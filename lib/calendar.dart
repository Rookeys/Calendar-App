import 'package:calendar_app/constants/customColor.dart';
import 'package:calendar_app/widgets/calendarWidget.dart';
import 'package:calendar_app/widgets/scheduleWidget.dart';
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
              // padding: const EdgeInsets.all(8.0),
              width: double.infinity,
              color: CustomColor.skyBlue,
              padding: const EdgeInsets.only(
                top: 12.0,
                left: 12.0,
                right: 12.0,
                bottom: 30,
              ),
              child: const CalendarWidget(),
            ),
            Container(
              // color: CustomColor.skyBlue,
              // padding: const EdgeInsets.all(8.0),
              color: CustomColor.pastelBlue,
              padding: const EdgeInsets.all(12.0),
              width: double.infinity,
              child: const ScheduleWidget(),
            )
          ],
        ),
      ),
    ));
  }
}
