import 'package:calendar_app/constants/customColor.dart';
import 'package:calendar_app/services/auth_service.dart';
import 'package:calendar_app/utils/toastMessage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../components/login_button.dart';
import '../components/textfield.dart';

class Signup_Page extends StatefulWidget {
  final Function()? onTap;
  const Signup_Page({super.key, required this.onTap});

  @override
  State<Signup_Page> createState() => _Signup_PageState();
}

class _Signup_PageState extends State<Signup_Page> {
  // text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

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
                        // logo
                        const Icon(Icons.verified_user_rounded, size: 100),

                        const SizedBox(height: 50),

                        // email textfield
                        FormTextField(
                          controller: emailController,
                          hintText: 'E-mail',
                          obscureText: false,
                        ),

                        // password textfield
                        FormTextField(
                          controller: passwordController,
                          hintText: 'Password',
                          obscureText: true,
                        ),

                        FormTextField(
                          controller: confirmPasswordController,
                          hintText: 'Confirm Password',
                          obscureText: true,
                        ),

                        const SizedBox(height: 50),

                        // sign in button
                        LoginButton(
                          onTap: () {
                            signUserUp();
                          },
                          text: const Text(
                            'Sign Up',
                            style: TextStyle(
                              color: CustomColor.skyBlue,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          backgroundColor: CustomColor.white,
                        ),

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

                        const SizedBox(height: 55),

                        // sign up button with Link Text
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'already have an account?',
                              style: TextStyle(
                                color: CustomColor.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(width: 4),
                            GestureDetector(
                              onTap: widget.onTap,
                              child: const Text(
                                'Sign in',
                                style: TextStyle(
                                  color: CustomColor.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  decoration: TextDecoration.underline,
                                  decorationColor: CustomColor.white,
                                ),
                              ),
                            )
                          ],
                        )
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
    showDialog(
        context: context,
        builder: (context) => const Center(
              child: CircularProgressIndicator(
                color: CustomColor.white,
              ),
            ));
    try {
      await AuthService().signInWithGoogle(context);
    } on FirebaseAuthException catch (e) {
      showCustomMessage(e.message!, bgColor: CustomColor.red, delay: 3);
    } catch (e) {
      showCustomMessage(e.toString(), bgColor: CustomColor.red, delay: 3);
    } finally {
      Navigator.pop(context);
    }
  }

  void signUserUp() async {
    showDialog(
        context: context,
        builder: (context) => const Center(
              child: CircularProgressIndicator(
                color: CustomColor.white,
              ),
            ));
    try {
      if (passwordController.text != confirmPasswordController.text) {
        Navigator.pop(context);
        throw Exception('Password and Confirm Password are not the same');
      }
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
    } on FirebaseAuthException catch (e) {
      showCustomMessage(e.message!, bgColor: CustomColor.red, delay: 3);
    } catch (e) {
      showCustomMessage(e.toString(), bgColor: CustomColor.red, delay: 3);
    } finally {
      Navigator.pop(context);
    }
  }
}
