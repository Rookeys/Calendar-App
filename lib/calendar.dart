import 'package:calendar_app/constants/customColor.dart';
import 'package:calendar_app/utils/googleAccessToken.dart';
import 'package:calendar_app/widgets/ScheduleBox.dart';
import 'package:calendar_app/widgets/calendar_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:developer';

class Calendar extends StatelessWidget {
  const Calendar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        width: double.infinity,
        color: CustomColor.skyBlue,
        child: const CalendarWidget(),
      ),
    ));
  }
}

Future<String?> getFirebaseToken(User? user) async {
  if (user != null) {
    try {
      final accessToken = await getAccessToken();
      String apiUrl =
          'https://www.googleapis.com/calendar/v3/calendars/primary/events';
      Map<String, String> headers = {'Authorization': 'Bearer $accessToken'};

      var response = await http.get(
        Uri.parse(apiUrl),
        headers: headers,
      );
      log(response.body);
    } catch (error) {
      print('error $error');
    }
  }
  return null;
}
