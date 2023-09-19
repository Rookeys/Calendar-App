import 'package:calendar_app/constants/custom_color.dart';
import 'package:flutter/material.dart';

class Calendar extends StatelessWidget {
  const Calendar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: CustomColor.skyBlue,
              height: 500,
            )
          ],
        ),
      ),
    ));
  }
}
