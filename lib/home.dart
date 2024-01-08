import 'package:calendar_app/constants/customColor.dart';
import 'package:calendar_app/utils/googleAccessToken.dart';
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
                context.go('/announcement');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: CustomColor.skyBlue,
                foregroundColor: CustomColor.white,
              ),
              child: const Text('Go to Announcement Page'),
            ),
            ElevatedButton(
              onPressed: () {
                context.go('/notification');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: CustomColor.skyBlue,
                foregroundColor: CustomColor.white,
              ),
              child: const Text('Go to Notification Page'),
            ),
            ElevatedButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                String? accessToken = await getAccessToken();
                if (accessToken != null) {
                  await deleteAccessToken();
                  print('deleted google access token');
                } else {
                  print('No access google access token found.');
                }
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
                context.go('/myPage');
                // context.push('/calendar');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: CustomColor.skyBlue,
                foregroundColor: CustomColor.white,
              ),
              child: const Text('Go to My Page'),
            ),
            ElevatedButton(
              onPressed: () {
                context.go('/dayoff-request');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: CustomColor.skyBlue,
                foregroundColor: CustomColor.white,
              ),
              child: const Text('Go to Day Off Request'),
            ),
          ],
        ),
      ),
    );
  }
}
