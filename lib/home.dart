import 'package:calendar_app/constants/customColor.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: CustomColor.white,
        backgroundColor: CustomColor.skyBlue,
        title: const Text(
          "Home Page",
          style: TextStyle(
            fontSize: 24,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                context.go('/calendar');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: CustomColor.skyBlue,
                foregroundColor: CustomColor.white,
              ),
              child: const Text('Go to Calendar Page'),
            ),
            ElevatedButton(
              onPressed: () {
                context.go('/auth');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: CustomColor.skyBlue,
                foregroundColor: CustomColor.white,
              ),
              child: const Text('Go to Auth Page'),
            ),
            ElevatedButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: CustomColor.skyBlue,
                foregroundColor: CustomColor.white,
              ),
              child: const Text('Sign Out'),
            ),
            ElevatedButton(
              onPressed: () {
                context.push('/register');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: CustomColor.skyBlue,
                foregroundColor: CustomColor.white,
              ),
              child: const Text('Register Company'),
            ),
            ElevatedButton(
              onPressed: () {
                context.push('/biometric');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: CustomColor.skyBlue,
                foregroundColor: CustomColor.white,
              ),
              child: const Text('Biometric'),
            ),
          ],
        ),
      ),
    );
  }
}
