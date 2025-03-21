import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:logger/logger.dart';

class AuthService {
  final logger = Logger();

  Future<UserCredential> signInWithGoogle() async {
    try {
      logger.i("Starting Google sign-in process...");

      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      logger.d("Google user obtained: ${googleUser?.email}");

      if (googleUser == null) {
        logger.e("The user canceled the sign-in process.");
        throw Exception("User canceled the sign-in process.");
      }

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      logger.d("Access token obtained: ${googleAuth.accessToken != null}");

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      logger.i("Firebase credential created");

      final UserCredential userCredential = 
          await FirebaseAuth.instance.signInWithCredential(credential);
      logger.i("Firebase authentication successful");


      logger.i(
        "User authenticated",
        error: "Email: ${userCredential.user!.email} | UID: ${userCredential.user!.uid}"
      );

      return userCredential;

    } catch (e, stackTrace) {
      logger.e(
        "Authentication error",
        error: e,
        stackTrace: stackTrace
      );
      rethrow;
    }
  }
}