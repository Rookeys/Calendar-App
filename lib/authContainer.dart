import 'package:calendar_app/constants/customColor.dart';
import 'package:calendar_app/services/auth_service.dart';
import 'package:calendar_app/utils/toastMessage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../components/login_button.dart';

class AuthContainer extends StatefulWidget {
  const AuthContainer({super.key});

  @override
  State<AuthContainer> createState() => _AuthContainerState();
}

class _AuthContainerState extends State<AuthContainer> {
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.skyBlue,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.verified_user_rounded, size: 100),
                        const SizedBox(height: 50),
                        // const SigninForm(),
                        const SizedBox(height: 15),
                        LoginButton(
                          onTap: () {
                            signUserInWithGoogle();
                          },
                          text: const Text(
                            'Sign up with Google',
                            style: TextStyle(
                              color: CustomColor.darkGray,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          image: Image.asset('assets/images/google.png',
                              width: 24, height: 24, fit: BoxFit.cover),
                          backgroundColor: CustomColor.white,
                        ),
                      ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void signUserInWithGoogle() async {
    var dialogContext;
    showDialog(
      context: context,
      builder: (context) {
        dialogContext = context;
        return const Center(
          child: CircularProgressIndicator(
            color: CustomColor.white,
          ),
        );
      },
    );

    try {
      await _authService.signInWithGoogle(context);
      Navigator.pop(dialogContext);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(dialogContext);
      showCustomMessage(e.message!, bgColor: CustomColor.red, delay: 3);
    } catch (e) {
      Navigator.pop(dialogContext);
      showCustomMessage(e.toString(), bgColor: CustomColor.red, delay: 3);
    }
  }
}
