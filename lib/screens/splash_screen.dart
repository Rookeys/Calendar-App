import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:calendar_app/constants/customColor.dart';
import 'package:calendar_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MyApp()),
      );
    });

    return Scaffold(
      backgroundColor: CustomColor.skyBlue,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Stack(
            children: [
              Lottie.asset('assets/lotties/calendar_animation.json'),
              Align(
                alignment: Alignment.bottomCenter,
                child: AnimatedTextKit(
                  animatedTexts: [
                    TyperAnimatedText(
                      '저 이날 쉴게요',
                      textStyle: const TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Agne',
                        color: CustomColor.white,
                      ),
                      speed: const Duration(milliseconds: 180),
                    ),
                  ],
                  totalRepeatCount: 1,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
