import 'dart:convert';

import 'package:calendar_app/constants/customColor.dart';
import 'package:calendar_app/utils/googleAccessToken.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:googleapis/calendar/v3.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class DummyEvent {
  String title;

  DummyEvent(this.title);
}

// Todo DummyEvent 타입 지정 및 실제데이터 가져와야함
Map<DateTime, List<DummyEvent>> events = {
  DateTime.utc(2023, 11, 20): [
    DummyEvent('title'),
    DummyEvent('title2'),
  ],
  DateTime.utc(2023, 11, 23): [DummyEvent('title3')],
};

// Todo 이벤트 목록 할당해야함
List<Event> _getEventsForDay(DateTime day) {
  // return events[day] ?? [];
  // return null;
  return [];
}

class CalendarWidget extends StatefulWidget {
  const CalendarWidget({super.key});

  @override
  State<CalendarWidget> createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: CustomColor.pastelBlue,
          ),
          // margin: const EdgeInsets.all(8.0),
          child: TableCalendar(
            // locale: 'ko_KR',
            daysOfWeekHeight: 40,
            firstDay: DateTime.utc(2021, 10, 16),
            lastDay: DateTime.utc(2030, 3, 14),
            focusedDay: _focusedDay,
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
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: CustomColor.black,
                  ),
                ),
              ),
            ),
            eventLoader: _getEventsForDay,
            // daysOfWeekStyle: const DaysOfWeekStyle(),
            calendarStyle: const CalendarStyle(
              outsideDaysVisible: false,
              isTodayHighlighted: true,
              todayTextStyle: TextStyle(
                color: CustomColor.white,
                fontSize: 16.0,
              ),
              todayDecoration: BoxDecoration(
                color: CustomColor.skyBlue,
                shape: BoxShape.circle,
              ),
            ),
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              if (!isSameDay(_selectedDay, selectedDay)) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                });
              }
            },
            onFormatChanged: (format) {
              if (_calendarFormat != format) {
                setState(() {
                  _calendarFormat = format;
                });
              }
            },
            onPageChanged: (focusedDay) {
              _focusedDay = focusedDay;
              getGoogleCalendarMonthEvents(_focusedDay);
            },
          ),
        ),
      ],
    );
  }
}

Future<List<Event>?> getGoogleCalendarMonthEvents(DateTime focusedDay) async {
  DateTime start = DateTime(focusedDay.year, focusedDay.month, 1);
  DateTime end = DateTime(focusedDay.year, focusedDay.month + 1, 1);
  final FirebaseAuth auth = FirebaseAuth.instance;
  User? user = auth.currentUser;
  if (user != null) {
    try {
      final accessToken = await getAccessToken();
      String apiUrl =
          'https://www.googleapis.com/calendar/v3/calendars/primary/events?timeMin=${start.toUtc().toIso8601String()}&timeMax=${end.toUtc().toIso8601String()}';
      Map<String, String> headers = {'Authorization': 'Bearer $accessToken'};
      var response = await http.get(
        Uri.parse(apiUrl),
        headers: headers,
      );
      final res = jsonDecode(response.body);

      if (res.containsKey('items')) {
        if (res['items'] is List) {
          List<dynamic> items = res['items'];
          for (var e in items) {
            final String eventStartKey =
                e['start']['date'] ?? e['start']['dateTime'];
            print(eventStartKey);
          }
        }
      }

      // print(eventList[0].id);
    } catch (error) {
      print('error $error');
    }
  }
  return null;
}
