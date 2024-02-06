import 'dart:convert';

import 'package:calendar_app/common/customInput.dart';
import 'package:calendar_app/common/datePickerInput.dart';
import 'package:calendar_app/constants/customColor.dart';
import 'package:calendar_app/utils/googleAccessToken.dart';
import 'package:calendar_app/utils/toastMessage.dart';
import 'package:calendar_app/widgets/ScheduleBox.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarWidget extends StatefulWidget {
  const CalendarWidget({super.key});

  @override
  State<CalendarWidget> createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  dynamic monthEvents;
  late final ValueNotifier<List<dynamic>> _selectedEvents;
  final _formKey = GlobalKey<FormState>();
  String summary = '';
  String description = '';
  String startDate = '';
  // String endDate = '';

  @override
  void initState() {
    super.initState();
    getGoogleCalendarMonthEvents(_focusedDay);
    _selectedDay = _focusedDay;
    _selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay!));
  }

  List<dynamic> _getEventsForDay(DateTime day) {
    if (monthEvents != null) {
      return monthEvents[day] ?? [];
    }
    return [];
  }

  dynamic getGoogleCalendarMonthEvents(DateTime focusedDay) async {
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

        final Map<DateTime, dynamic> events = {};

        if (res.containsKey('items')) {
          if (res['items'] is List) {
            List<dynamic> items = res['items'];
            for (var item in items) {
              final String eventStartKey =
                  item['start']['date'] ?? item['start']['dateTime'];
              DateTime parsedDateTime = DateTime.parse(eventStartKey);
              DateTime dateTimeWithYearMonthDay = DateTime.utc(
                      parsedDateTime.year,
                      parsedDateTime.month,
                      parsedDateTime.day)
                  .toUtc();
              // print(dateTimeWithYearMonthDay);
              if (!events.containsKey(dateTimeWithYearMonthDay)) {
                events[dateTimeWithYearMonthDay] = [item];
              } else {
                // 같은 키 값이 있다면 해당 배열에 데이터 추가
                events[dateTimeWithYearMonthDay]!.add(item);
              }
            }
          }
        }
        setState(() {
          monthEvents = events;
        });
        return events;

        // print(eventList[0].id);
      } catch (error) {
        print('error $error');
      }
    }
    return null;
  }

  dynamic postGoogleCalendarEvent(
      String title, String description, String date) async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;

    // String start =
    //     DateTime(DateTime.now().year, DateTime.now().month, 15).toString();
    // String end =
    //     DateTime(DateTime.now().year, DateTime.now().month, 15).toString();

    if (user != null) {
      try {
        final accessToken = await getAccessToken();
        String apiUrl =
            'https://www.googleapis.com/calendar/v3/calendars/primary/events';
        Map<String, String> headers = {'Authorization': 'Bearer $accessToken'};
        final test = {
          'summary': title,
          'description': description,
          'start': {
            // 'dateTime': '2023-12-20T09:00:00',
            'timeZone': 'Asia/Seoul',
            'date': date,
          },
          'end': {
            // 'dateTime': '2023-12-20T10:00:00',
            'timeZone': 'Asia/Seoul',
            'date': date,
          },
          'reminders': {
            'useDefault': false, // 이거 안하면 default 로 알람설정됨
          },
          "transparency": 'transparent'
        };

        var response = await http.post(Uri.parse(apiUrl),
            headers: headers, body: jsonEncode(test));
        final res = jsonDecode(response.body);

        print(response);
        print(response.body);
        return res.body;

        // print(eventList[0].id);
      } catch (error) {
        print('error $error');
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(20.0),
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
                _selectedEvents.value = _getEventsForDay(selectedDay);
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
        Expanded(
          child: Container(
            color: CustomColor.pastelBlue,
            padding: const EdgeInsets.all(12.0),
            child: ValueListenableBuilder<List<dynamic>>(
              valueListenable: _selectedEvents,
              builder: (context, value, _) {
                return ListView.separated(
                  separatorBuilder: (context, index) {
                    return const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
                    );
                  },
                  itemCount: value.length,
                  itemBuilder: (context, index) {
                    return ScheduleBox(
                      bgColor: CustomColor.lightPurple, // Todo 커스텀
                      event: value[index],
                    );
                  },
                );
              },
            ),
          ),
        ),
        FloatingActionButton(
          heroTag: 'calendarFloatingActionButton',
          backgroundColor: CustomColor.skyBlue,
          onPressed: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (BuildContext context) {
                return Form(
                  key: _formKey,
                  child: Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.6,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(24)),
                      color: CustomColor.white,
                    ),
                    child: Column(
                      children: [
                        Divider(
                          color: CustomColor.darkGray,
                          height: 20,
                          indent: MediaQuery.of(context).size.width * 0.45,
                          endIndent: MediaQuery.of(context).size.width * 0.45,
                          thickness: 4,
                        ),
                        DatePickerInput(
                          label: '',
                          isFutureCalendar: true,
                          onSaved: (value) => {startDate = value},
                        ),
                        // DatePickerInput(
                        //   label: '',
                        //   isFutureCalendar: true,
                        //   onSaved: (value) => {endDate = value},
                        // ),
                        CustomInput(
                          label: 'Summary',
                          inputContainerDecoration: BoxDecoration(
                            color: CustomColor.brightGray,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          inputDecoration: const InputDecoration(
                            border: InputBorder.none,
                          ),
                          onSaved: (value) => {summary = value},
                          validator: (value) {
                            if (value.isEmpty) {
                              return '필수 필드입니다.';
                            }
                            return null;
                          },
                        ),
                        CustomInput(
                          label: 'Description',
                          inputContainerDecoration: BoxDecoration(
                            color: CustomColor.brightGray,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          inputDecoration: const InputDecoration(
                            border: InputBorder.none,
                          ),
                          onSaved: (value) => {description = value},
                          // validator: (value) {
                          //   if (value.isEmpty) {
                          //     return '필수 필드입니다.';
                          //   }
                          //   return null;
                          // },
                        ),
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              // _formKey.currentState!.save();
                              showSuccessMessage('validation 통과');
                              // print('before $title $summary $date');
                              _formKey.currentState!.save();
                              // print('after $title $summary $date');
                              postGoogleCalendarEvent(
                                  summary, description, startDate);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: CustomColor.skyBlue,
                            foregroundColor: CustomColor.white,
                          ),
                          child: const Text('Submit'),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        )
        // ElevatedButton(
        //   onPressed: () {
        //     showModalBottomSheet(
        //       context: context,
        //       isScrollControlled: true,
        //       builder: (BuildContext context) {
        //         return Form(
        //           key: _formKey,
        //           child: Container(
        //             width: double.infinity,
        //             height: MediaQuery.of(context).size.height * 0.9,
        //             decoration: const BoxDecoration(
        //               borderRadius: BorderRadius.all(Radius.circular(24)),
        //               color: CustomColor.white,
        //             ),
        //             child: Column(
        //               children: [
        //                 Divider(
        //                   color: CustomColor.darkGray,
        //                   height: 20,
        //                   indent: MediaQuery.of(context).size.width * 0.45,
        //                   endIndent: MediaQuery.of(context).size.width * 0.45,
        //                   thickness: 4,
        //                 ),
        //                 DatePickerInput(
        //                   label: '',
        //                   isFutureCalendar: true,
        //                   onSaved: (value) => {startDate = value},
        //                 ),
        //                 // DatePickerInput(
        //                 //   label: '',
        //                 //   isFutureCalendar: true,
        //                 //   onSaved: (value) => {endDate = value},
        //                 // ),
        //                 CustomInput(
        //                   label: 'Summary',
        //                   inputContainerDecoration: BoxDecoration(
        //                     color: CustomColor.brightGray,
        //                     borderRadius: BorderRadius.circular(8),
        //                   ),
        //                   inputDecoration: const InputDecoration(
        //                     border: InputBorder.none,
        //                   ),
        //                   onSaved: (value) => {summary = value},
        //                   validator: (value) {
        //                     if (value.isEmpty) {
        //                       return '필수 필드입니다.';
        //                     }
        //                     return null;
        //                   },
        //                 ),
        //                 CustomInput(
        //                   label: 'Description',
        //                   inputContainerDecoration: BoxDecoration(
        //                     color: CustomColor.brightGray,
        //                     borderRadius: BorderRadius.circular(8),
        //                   ),
        //                   inputDecoration: const InputDecoration(
        //                     border: InputBorder.none,
        //                   ),
        //                   onSaved: (value) => {description = value},
        //                   // validator: (value) {
        //                   //   if (value.isEmpty) {
        //                   //     return '필수 필드입니다.';
        //                   //   }
        //                   //   return null;
        //                   // },
        //                 ),
        //                 ElevatedButton(
        //                   onPressed: () {
        //                     if (_formKey.currentState!.validate()) {
        //                       // _formKey.currentState!.save();
        //                       showSuccessMessage('validation 통과');
        //                       // print('before $title $summary $date');
        //                       _formKey.currentState!.save();
        //                       // print('after $title $summary $date');
        //                       postGoogleCalendarEvent(
        //                           summary, description, startDate);
        //                     }
        //                   },
        //                   style: ElevatedButton.styleFrom(
        //                     backgroundColor: CustomColor.skyBlue,
        //                     foregroundColor: CustomColor.white,
        //                   ),
        //                   child: const Text('Submit'),
        //                 ),
        //               ],
        //             ),
        //           ),
        //         );
        //       },
        //     );
        //   },
        //   style: ElevatedButton.styleFrom(
        //     backgroundColor: CustomColor.white,
        //     foregroundColor: CustomColor.black,
        //   ),
        //   child: const Text('Test Button'),
        // ),

        // showModalBottomSheet
        // DraggableScrollableSheet
      ],
    );
  }
}
