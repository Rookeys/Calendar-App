import 'package:calendar_app/constants/customColor.dart';
import 'package:calendar_app/widgets/calendarWidget.dart';
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
              // color: CustomColor.skyBlue,
              padding: const EdgeInsets.all(8.0),
              width: 500,
              height: 500,
              // color: CustomColor.skyBlue,
              child: const CalendarWidget(),
            )
          ],
        ),
      ),
    ));
  }
}
