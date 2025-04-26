import 'package:campus_bites/data/datasources/user_backend_datasource.dart';
import 'package:campus_bites/globals/GlobalUser.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
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

        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('user_id', userRetrieved.id);
        await prefs.setString('user_name', userRetrieved.name);
        await prefs.setString('user_email', userRetrieved.email);
        await prefs.setString('user_phone', userRetrieved.phone);
        await prefs.setString('user_role', userRetrieved.role);
        await prefs.setBool('user_premium', userRetrieved.isPremium);
        await prefs.setString(
            'institution_Id', userRetrieved.institutionId ?? '');
        await prefs.setStringList(
          'user_savedProductsIds',
          userRetrieved.savedProductsIds.map((e) => e.toString()).toList(),
        );
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
      throw AuthException("Unexpected error during sign-in.");
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
    );

    return userData;
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

      logger.i("All saved preferences have been cleared.");
    } catch (e) {
      logger.e("Error clearing saved preferences", error: e);
      throw AuthException("Failed to clear saved preferences.");
    }
  }

  Future<UserEntity> getMockedUserData() async {
    final userData = UserEntity(
      id: 'KLAt7tOTC7CFvuyXdkVC',
      name: 'Daniel Diaz',
      phone: '',
      email: 'danielf4415@gmail.com',
      role: 'user',
      isPremium: false,
      institutionId: null,
      savedProductsIds: [],
    );

    logger.i("Mocked user data retrieved: ${userData.toJson()}");

    return userData;
  }
}
