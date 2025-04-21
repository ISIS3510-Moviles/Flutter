import 'package:campus_bites/globals/GlobalUser.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:logger/logger.dart';
import 'package:dio/dio.dart';
import 'package:campus_bites/data/repositories/user_repository_impl.dart';
import 'package:campus_bites/domain/entities/user_entity.dart';

class AuthException implements Exception {
  final String message;
  AuthException(this.message);

  @override
  String toString() => message;
}

class AuthService {
  final logger = Logger();
  final UserRepositoryImpl userRepository;

  AuthService({required this.userRepository});

  Future<UserCredential> signInWithGoogle() async {
    try {
      logger.i("Starting Google sign-in process...");

      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      logger.d("Google user obtained: ${googleUser?.email}");

      if (googleUser == null) {
        logger.e("The user canceled the sign-in process.");
        throw AuthException("Sign-in was canceled by the user.");
      }

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      logger.d("Access token obtained: ${googleAuth.accessToken != null}");

      if (googleAuth.accessToken == null || googleAuth.idToken == null) {
        throw AuthException("Missing authentication tokens from Google.");
      }

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      logger.i("Firebase credential created");

      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      logger.i("Firebase authentication successful");

      final user = userCredential.user;

      if (user == null) {
        throw AuthException("Failed to retrieve authenticated user information.");
      }

      logger.i(
        "User authenticated",
        error: "Email: ${user.email} | UID: ${user.uid}",
      );

      final userEntity = UserEntity(
        id: user.uid,
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
        logger.i("User retrieved successfully from the database: ${GlobalUser().currentUser?.toJson()}");
      } on DioException catch (dioError) {
        logger.e("Network error while creating user", error: dioError.message);
        throw AuthException("Network error while creating your account. Please check your connection and try again.");
      } catch (dbError) {
        logger.e("Error creating or retrieving user from the database", error: dbError);
        throw AuthException("There was an error setting up your user account. Please try again.");
      }

      return userCredential;

    } on FirebaseAuthException catch (e) {
      logger.e("FirebaseAuthException", error: e.message);
      throw AuthException("Authentication failed: ${e.message}");
    } on AuthException catch (e) {
      logger.w("AuthException", error: e.message);
      rethrow;
    } catch (e, stackTrace) {
      logger.e("Unexpected authentication error", error: e, stackTrace: stackTrace);
      throw AuthException("An unexpected error occurred during sign-in. Please try again later.");
    }
  }
}
