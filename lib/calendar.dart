import 'package:calendar_app/constants/customColor.dart';
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
    final FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;

    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Container(
            width: 20,
            height: 20,
            color: CustomColor.red,
            child: GestureDetector(
              onTap: () async {
                await getFirebaseToken(user);
              },
            ),
          ),
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
          Expanded(
            child: Container(
              // color: CustomColor.skyBlue,
              // padding: const EdgeInsets.all(8.0),
              color: CustomColor.pastelBlue,
              padding: const EdgeInsets.all(12.0),
              width: double.infinity,
              child: ListView.separated(
                separatorBuilder: (context, index) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                  );
                },
                itemCount: 10, // Todo 리스트 받아와서 길이 체크
                itemBuilder: (context, index) {
                  return const ScheduleBox(
                    bgColor: CustomColor.lightPurple,
                  );
                },
              ),
            ),
          )
        ],
      ),
    ));
  }
}

Future<String?> getFirebaseToken(User? user) async {
  if (user != null) {
    try {
      // 아래 토큰은 firebase 토큰이고, google API 를 사용하기 위해서는 google Token 을 가져와야함.
      String? token = await user.getIdToken(true);
      String apiUrl =
          'https://www.googleapis.com/calendar/v3/calendars/primary/events';
      Map<String, String> headers = {'Authorization': 'Bearer $token'};
      // print('apiUrl: ${Uri.parse(apiUrl)}');
      // print('headers: $headers');
      var response = await http.get(
        Uri.parse(apiUrl),
        headers: headers,
      );
      log(response.body);

      return token;
    } catch (error) {}
  }
  return null;
}
