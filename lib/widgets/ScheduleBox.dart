import 'package:calendar_app/constants/customColor.dart';
import 'package:flutter/material.dart';
import 'package:googleapis/calendar/v3.dart';

class ScheduleBox extends StatelessWidget {
  const ScheduleBox({super.key, required this.bgColor, required this.event});
  final Color bgColor;
  final dynamic event;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      alignment: Alignment.topLeft,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            blurRadius: 4, // 그림자가 얼마나 드리울지 정함
            offset: const Offset(0, 4), // 그림자의 위치
            color: CustomColor.darkGray.withOpacity(0.5),
          )
        ],
      ),
      margin: const EdgeInsets.symmetric(
        horizontal: 8.0,
        vertical: 4.0,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            event['summary'],
            style: const TextStyle(
              fontSize: 16,
              color: CustomColor.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            event['start']['date'] != null
                ? '하루종일'
                : '${FormattedDateTime(DateTime.parse(event['start']['dateTime']).toLocal())} ~ ${FormattedDateTime(DateTime.parse(event['end']['dateTime']).toLocal())}',
            style: const TextStyle(
              fontSize: 16,
              color: CustomColor.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

String FormattedDateTime(DateTime dateTime) {
  print(dateTime);
  final hour = dateTime.hour;
  final minute = dateTime.minute;
  String formattedDateTime =
      "${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}";

  return formattedDateTime;
}
