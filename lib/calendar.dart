import 'package:calendar_app/constants/customColor.dart';
import 'package:calendar_app/widgets/calendarWidget.dart';
import 'package:flutter/material.dart';

class Calendar extends StatelessWidget {
  const Calendar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              // color: CustomColor.skyBlue,
              height: 1000,
              child: CalendarWidget(),
            )
          ],
        ),
      ),
    ));
  }
}
