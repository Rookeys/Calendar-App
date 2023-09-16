import 'package:calendar_app/constants/customColor.dart';
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
        child: ElevatedButton(
          onPressed: () {
            context.go('/calendar');
            // context.push('/calendar');
          },
          //          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
          //       FadeTransition(opacity: animation, child: child),
          // ),
          style: ElevatedButton.styleFrom(
            backgroundColor: CustomColor.skyBlue,
            foregroundColor: CustomColor.white,
          ),
          child: const Text('Go to Calendar Page'),
        ),
      ),
    );
  }
}
