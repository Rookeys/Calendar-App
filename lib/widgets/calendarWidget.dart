import 'package:calendar_app/constants/customColor.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarWidget extends StatelessWidget {
  const CalendarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TableCalendar(
        // locale: 'ko_KR',
        // daysOfWeekHeight: 30,
        firstDay: DateTime.utc(2021, 10, 16),
        lastDay: DateTime.utc(2030, 3, 14),
        focusedDay: DateTime.now(),
        headerStyle: HeaderStyle(
          titleCentered: true,
          titleTextFormatter: (date, locale) =>
              DateFormat.yMMMd(locale).format(date),
          formatButtonVisible: false,
          titleTextStyle: const TextStyle(
            fontSize: 20.0,
            color: CustomColor.black,
          ),
          headerPadding: const EdgeInsets.symmetric(vertical: 4.0),
          leftChevronIcon: const Icon(
            Icons.keyboard_arrow_left,
            size: 40.0,
            color: CustomColor.black,
          ),
          rightChevronIcon: const Icon(
            Icons.keyboard_arrow_right,
            size: 40.0,
            color: CustomColor.black,
          ),
        ),
        calendarStyle: const CalendarStyle(
          outsideDaysVisible: false,
          isTodayHighlighted: true,
          // today 글자 조정
          todayTextStyle: TextStyle(
            color: CustomColor.white,
            fontSize: 16.0,
          ),
          todayDecoration: BoxDecoration(
            color: CustomColor.skyBlue,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}
