import 'package:campus_bites/globals/GlobalUser.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:logger/logger.dart';
import 'package:campus_bites/data/repositories/user_repository_impl.dart';
import 'package:campus_bites/domain/entities/user_entity.dart';

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


      final user = userCredential.user;
      if (user != null) {
        final userEntity = UserEntity(
          id: "mhb5GrYjKYb52x7Cub5yT7LlPIo1",
          name: user.displayName ?? "Unknown",
          phone: user.phoneNumber ?? "",
          email: user.email ?? "",
          role: "user",
          isPremium: false,
          institutionId: "",
          savedProductsIds: [], 
        );
     
        var userRetrieved = await userRepository.createUser(userEntity);
        GlobalUser().currentUser = userRetrieved;
        logger.i("User retrieved successfully from the database: ${userRetrieved.toJson()}");
      }
      

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