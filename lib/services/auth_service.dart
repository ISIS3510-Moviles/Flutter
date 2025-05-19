import 'dart:convert';

import 'package:campus_bites/data/datasources/user_backend_datasource.dart';
import 'package:campus_bites/domain/entities/product_entity.dart';
import 'package:campus_bites/globals/GlobalUser.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:logger/logger.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:campus_bites/data/repositories/user_repository_impl.dart';
import 'package:campus_bites/domain/entities/user_entity.dart';

class AuthException implements Exception {
  final String message;
  AuthException(this.message);

  @override
  String toString() => message;
}

class AuthService {
  static AuthService? _instance;
  final Logger logger = Logger();
  final UserRepositoryImpl userRepository;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  AuthService._internal({required this.userRepository});

  factory AuthService() {
    if (_instance != null) return _instance!;

    final userBackendDatasource = UserBackendDatasource();
    final userRepository = UserRepositoryImpl(userBackendDatasource);

    _instance = AuthService._internal(userRepository: userRepository);
    return _instance!;
  }

  Future<UserCredential> signInWithGoogle() async {
    try {
      logger.i("Starting Google sign-in process...");

      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      logger.d("Google user obtained: ${googleUser?.email}");

      if (googleUser == null) {
        logger.e("The user canceled the sign-in process.");
        throw AuthException("Sign-in was canceled by the user.");
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      if (googleAuth.accessToken == null || googleAuth.idToken == null) {
        throw AuthException("Missing authentication tokens from Google.");
      }

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      final user = userCredential.user;

      if (user == null) {
        throw AuthException(
            "Failed to retrieve authenticated user information.");
      }

      final userEntity = UserEntity(
        id: "",
        name: user.displayName ?? "Unknown",
        phone: user.phoneNumber ?? "",
        email: user.email ?? "",
        role: "user",
        isPremium: false,
        institutionId: "",
        savedProductsIds: [],
      );


      try {
        var userRetrieved = await userRepository.createUser(userEntity);
        GlobalUser().currentUser = userRetrieved;

        logger.i(
            "User retrieved successfully from the database: ${userRetrieved.toJson()}");
        await saveUser(userRetrieved);
      } on DioException catch (dioError) {
        logger.e("Network error while creating user", error: dioError.message);
        throw AuthException("Network error while creating your account.");
      } catch (dbError) {
        logger.e("Error creating or retrieving user from DB", error: dbError);
        throw AuthException("Error setting up your user account.");
      }

      return userCredential;
    } on FirebaseAuthException catch (e) {
      logger.e("FirebaseAuthException", error: e.message);
      throw AuthException("Authentication failed: ${e.message}");
    } catch (e, stackTrace) {
      logger.e("Unexpected authentication error",
          error: e, stackTrace: stackTrace);
      throw AuthException("You cancelled the Sign in process");
    }
  }

  Future<void> signOutGoogle() async {
    try {
      await _googleSignIn.signOut();
    } catch (e) {
      debugPrint('Google sign-out failed: $e');
    }
  }


  Future<void> saveUser(UserEntity user) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('user_id', user.id);
      logger.i("Saved user_id: ${user.id}");

      await prefs.setString('user_name', user.name);
      logger.i("Saved user_name: ${user.name}");

      await prefs.setString('user_email', user.email);
      logger.i("Saved user_email: ${user.email}");

      await prefs.setString('user_phone', user.phone);
      logger.i("Saved user_phone: ${user.phone}");

      await prefs.setString('user_role', user.role);
      logger.i("Saved user_role: ${user.role}");

      await prefs.setBool('user_premium', user.isPremium);
      logger.i("Saved user_premium: ${user.isPremium}");

      await prefs.setString('institution_Id', user.institutionId ?? '');
      logger.i("Saved institution_Id: ${user.institutionId ?? ''}");

      await prefs.setStringList(
        'user_savedProductsIds',
        user.savedProductsIds.map((e) => e.toString()).toList(),
      );
      logger.i("Saved user_savedProductsIds: ${user.savedProductsIds}");

      await prefs.setStringList(
        'user_savedProducts',
        (user.savedProducts ?? []).map((e) => jsonEncode(e.toJson())).toList(),
      );
      logger.i("Saved user_savedProducts: []");
    } catch (e) {
      logger.e("Error saving user data", error: e);
      throw AuthException("Failed to save user data.");
    }
  }

  Future<UserEntity> getSavedUserData() async {
    final prefs = await SharedPreferences.getInstance();
    final userData = UserEntity(
      id: prefs.getString('user_id') ?? '',
      name: prefs.getString('user_name') ?? 'Unknown',
      phone: prefs.getString('user_phone') ?? '',
      email: prefs.getString('user_email') ?? '',
      role: prefs.getString('user_role') ?? 'user',
      isPremium: prefs.getBool('user_premium') ?? false,
      institutionId: prefs.getString('institution_Id'),
      savedProductsIds: prefs.getStringList('user_savedProductsIds') ?? [],
      savedProducts: await getSavedProductsData(),
    );
    return userData;
  }

  Future<List<ProductEntity>> getSavedProductsData() async {
    final prefs = await SharedPreferences.getInstance();
    final products = prefs.getStringList('user_savedProducts') ?? [];

    final parsedProducts = await compute(parseSavedProducts, products);
    return parsedProducts;
  }

  Future<void> clearSavedPreferences() async {
    try {
      final prefs = await SharedPreferences.getInstance();

      await prefs.remove('user_id');
      await prefs.remove('user_name');
      await prefs.remove('user_email');
      await prefs.remove('user_phone');
      await prefs.remove('user_role');
      await prefs.remove('user_premium');
      await prefs.remove('institution_Id');
      await prefs.remove('user_savedProductsIds');
      await prefs.remove('user_savedProducts');
      GlobalUser().currentUser = null;
      logger.i("All saved preferences have been cleared.");
    } catch (e) {
      logger.e("Error clearing saved preferences", error: e);
      throw AuthException("Failed to clear saved preferences.");
    }
  }

  Future<void> setMockedUserData() async {
    final userData = UserEntity(
      id: 'KLAt7tOTC7CFvuyXdkVC',
      name: 'Daniel Diaz',
      phone: '',
      email: 'danielf4415@gmail.com',
      role: 'user',
      isPremium: false,
      institutionId: null,
      savedProductsIds: [],
      savedProducts: [],
    );
    logger.i(
        "Saving mocked user data to SharedPreferences: ${userData.toJson()}");
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_id', userData.id);
    await prefs.setString('user_name', userData.name);
    await prefs.setString('user_email', userData.email);
    await prefs.setString('user_phone', userData.phone);
    await prefs.setString('user_role', userData.role);
    await prefs.setBool('user_premium', userData.isPremium);
    await prefs.setString('institution_Id', userData.institutionId ?? '');
    await prefs.setStringList(
      'user_savedProductsIds',
      userData.savedProductsIds.map((e) => e.toString()).toList(),
    );
    await prefs.setStringList('user_savedProducts', []);
    logger.i("Mocked user data saved successfully in SharedPreferences.");
  }
}


List<ProductEntity> parseSavedProducts(List<String> jsonStrings) {
  return jsonStrings.map((e) {
    final json = jsonDecode(e);
    return ProductEntity.fromJson(json);
  }).toList();
}