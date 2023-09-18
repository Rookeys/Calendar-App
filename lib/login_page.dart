import 'package:calendar_app/constants/customColor.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../components/login_button.dart';
import '../components/textfield.dart';
import 'components/link_text.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // text editing controllers
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.skyBlue,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            // logo
            const Icon(Icons.verified_user_rounded, size: 100),

            const SizedBox(height: 50),

            // email textfield
            FormTextField(
              controller: emailController,
              hintText: 'E-mail',
              obscureText: false,
            ),

            const SizedBox(height: 25),

            // password textfield
            FormTextField(
              controller: passwordController,
              hintText: 'Password',
              obscureText: true,
            ),

            const SizedBox(height: 50),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LinkText(
                    icon: const Icon(
                      Icons.check_circle_outline,
                      color: CustomColor.white,
                    ),
                    text: const Text(
                      'Auto login',
                      style: TextStyle(
                          color: CustomColor.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    onTap: () {
                      print('auto login');
                    },
                  ),
                  const SizedBox(height: 20), // add a gap of 10 pixels
                  LinkText(
                    icon: const Icon(
                      Icons.settings,
                      color: CustomColor.white,
                    ),
                    text: const Text(
                      'Forgot password?',
                      style: TextStyle(
                          color: CustomColor.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          decoration: TextDecoration.underline,
                          decorationColor: CustomColor.white),
                    ),
                    onTap: () {
                      print('forgot password');
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            // sign in button
            LoginButton(
              onTap: () {
                // signUserIn();
                print('login');
              },
              text: const Text(
                'Login',
                style: TextStyle(
                  color: CustomColor.skyBlue,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              backgroundColor: CustomColor.white,
            ),

            const SizedBox(height: 15),

            LoginButton(
              onTap: () {
                // signUserIn();
                print('Sign up with Google');
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

            //number? regoster now
          ]),
        ),
      ),
    );
  }

  // sign in function
  void signUserIn() async {
    showDialog(
        context: context,
        builder: (context) => const Center(
              child: CircularProgressIndicator(),
            ));
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      if (e.code == 'user-not-found') {
        wrongEmailMessage();
      } else if (e.code == 'wrong-password') {
        wrongPasswordMessage();
      }
    }
  }

  // wrong message pop uo
  void wrongEmailMessage() {
    showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            title: Text('Wrong email'),
          );
        });
  }

  void wrongPasswordMessage() {
    showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            title: Text('Wrong password'),
          );
        });
  }
}
