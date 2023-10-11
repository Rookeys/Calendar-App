import 'package:calendar_app/constants/customColor.dart';
import 'package:calendar_app/services/auth_service.dart';
import 'package:calendar_app/utils/toastMessage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../components/login_button.dart';
import '../components/textfield.dart';

class ForgotPassword {
  static void showForgotPasswordDialog(BuildContext context) {
    TextEditingController resetEmailController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: CustomColor.white,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FormTextField(
                controller: resetEmailController,
                hintText: 'E-mail',
                obscureText: false,
                themeColor: CustomColor.skyBlue,
              ),
              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Text(
                  'Please enter your email address',
                  style: TextStyle(
                    color: CustomColor.skyBlue,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              style: ButtonStyle(
                // border color
                side: MaterialStateProperty.all(
                  const BorderSide(
                    color: CustomColor.skyBlue,
                  ),
                ),
              ),
              onPressed: () => Navigator.pop(context),
              child: const Text(
                'Close',
                style: TextStyle(
                  color: CustomColor.skyBlue,
                ),
              ),
            ),
            TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  CustomColor.skyBlue,
                ),
                // border color
                side: MaterialStateProperty.all(
                  const BorderSide(
                    color: CustomColor.skyBlue,
                  ),
                ),
              ),
              onPressed: () async {
                try {
                  await FirebaseAuth.instance.sendPasswordResetEmail(
                    email: resetEmailController.text,
                  );
                  Navigator.pop(context);
                  showCustomMessage(
                    'Please check your email',
                    bgColor: CustomColor.green,
                    delay: 3,
                  );
                } catch (e) {
                  Navigator.pop(context);
                  showCustomMessage(
                    e.toString(),
                    bgColor: CustomColor.red,
                    delay: 3,
                  );
                }
              },
              child: const Text(
                'Send',
                style: TextStyle(color: CustomColor.white),
              ),
            ),
          ],
        );
      },
    );
  }
}

class SignIn_Page extends StatefulWidget {
  final Function()? onTap;
  const SignIn_Page({super.key, required this.onTap});

  @override
  State<SignIn_Page> createState() => _SignIn_PageState();
}

class _SignIn_PageState extends State<SignIn_Page> {
  // text editing controllers
  final resetEmailController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

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

                        const SizedBox(height: 20),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                InkWell(
                                  onTap: () {
                                    ForgotPassword.showForgotPasswordDialog(
                                        context);
                                  },
                                  child: const Row(
                                    mainAxisSize:
                                        MainAxisSize.min, // set to min
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Icon(
                                        Icons.settings,
                                        color: CustomColor.white,
                                        size: 12,
                                      ),
                                      SizedBox(width: 4),
                                      Text(
                                        'Forgot password?',
                                        style: TextStyle(
                                          color: CustomColor.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                          decoration: TextDecoration.underline,
                                          decorationColor: CustomColor.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ]),
                        ),

                        const SizedBox(height: 25),

                        // sign in button
                        LoginButton(
                          onTap: () {
                            signUserIn();
                          },
                          text: const Text(
                            'Login',
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
                              'Not a member?',
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
                                'Register now',
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

  void displayErrorMessage(String message, String s) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Error Message'),
            content: Text(message),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Close'),
              ),
            ],
          );
        });
  }

  // sign in function
  void signUserIn() async {
    showDialog(
        context: context,
        builder: (context) => const Center(
              child: CircularProgressIndicator(
                color: CustomColor.white,
              ),
            ));
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      Navigator.pop(context);
    } on FirebaseAuthException {
      Navigator.pop(context);
      showCustomMessage('Please check your email and password',
          bgColor: CustomColor.red, delay: 3);
    } catch (e) {
      showCustomMessage('please check your email and password',
          bgColor: CustomColor.red, delay: 3);
    }
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
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      showCustomMessage(e.message!, bgColor: CustomColor.red, delay: 3);
    } catch (e) {
      showCustomMessage(e.toString(), bgColor: CustomColor.red, delay: 3);
    }
  }
}
