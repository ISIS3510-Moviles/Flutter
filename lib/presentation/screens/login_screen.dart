import 'package:campus_bites/globals/GlobalUser.dart';
import 'package:campus_bites/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  final AuthService authService = AuthService();

  LoginScreen({super.key});

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  late final AuthService authService;
  bool isLoading = false;
  bool isCheckingPreferences = true;

  @override
  void initState() {
    super.initState();
    authService = widget.authService;
    _checkUserAndProceed();
  }

void _checkUserAndProceed() async {
  //await authService.clearSavedPreferences();
  //await authService.setMockedUserData();
  final userEntity = await authService.getSavedUserData();

  setState(() {
    isCheckingPreferences = false;
  });

  final userId = userEntity.id;

  if (userId.isEmpty) {
    debugPrint('User data not found locally. Please log in manually.');
  } else {
    debugPrint('User data found in saved preferences:');
    debugPrint('user_id: ${userEntity.id}');
    debugPrint('user_name: ${userEntity.name}');
    debugPrint('user_email: ${userEntity.email}');
    debugPrint('user_phone: ${userEntity.phone}');
    debugPrint('user_role: ${userEntity.role}');
    debugPrint('user_premium: ${userEntity.isPremium}');
    debugPrint('institution_Id: ${userEntity.institutionId}');
    debugPrint('user_savedProductsIds: ${userEntity.savedProductsIds}');

    GlobalUser().currentUser = userEntity;

    if (mounted) {
      context.go('/');
    }
  }
}


  void _signInWithGoogle() async {
    if (isLoading) return;

    setState(() {
      isLoading = true;
    });

    try {
      await authService.signOutGoogle();
      final userCredential = await authService.signInWithGoogle();
      if (userCredential.user != null) {
        if (mounted) {
          context.go('/');
        }
      } else {
        if (mounted) {
          _showErrorSnackbar('Failed to sign in with Google. User is null.');
        }
      }
    } catch (e) {
      if (mounted) {
        _showErrorSnackbar('Error: ${e.toString()}');
      }
    } finally {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  void _showErrorSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  @override
  Widget build(BuildContext context) {
    if (isCheckingPreferences || GlobalUser().currentUser != null) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/logo.png', width: 150),
              const SizedBox(height: 20),
              Text(
                'CampusBites',
                style: GoogleFonts.poppins(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'With Campus Bites, finding delicious options near you and within your budget has never been easier. Are you vegan, vegetarian, or looking for something gluten-free? We’ve got you covered! The app recommends the best spots based on your tastes and location, so you can enjoy every bite without the hassle.',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(fontSize: 14, color: Colors.black54),
              ),
              const SizedBox(height: 30),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFF46417),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                ),
                onPressed: isLoading ? null : _signInWithGoogle,
                icon:
                    const Icon(Icons.verified_user_sharp, color: Colors.white),
                label: SizedBox(
                  width: 180,
                  child: Center(
                    child: isLoading
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 2,
                            ),
                          )
                        : Text(
                            'Log in with Google',
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}