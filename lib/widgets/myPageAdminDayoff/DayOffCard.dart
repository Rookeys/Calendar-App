import 'package:calendar_app/constants/customColor.dart';
import 'package:flutter/material.dart';

class DayOffCard extends StatelessWidget {
  final String profile;
  final String name;
  final Map<String, dynamic> dateAndTime;

  const DayOffCard(
      {super.key,
      required this.profile,
      required this.name,
      required this.dateAndTime});

  @override
  Widget build(BuildContext context) {
    DateTime endDateTime = dateAndTime['endDateTime'];
    String startDate = dateAndTime['startDate'];
    String endDate = dateAndTime['endDate'];
    int startHour = dateAndTime['startHour'];
    int startMinute = dateAndTime['startMinute'];
    int endHour = dateAndTime['endHour'];
    int endMinute = dateAndTime['endMinute'];
    int diffHours = dateAndTime['diffHours'];

    return Card(
      color: CustomColor.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            SizedBox(
              width: 90,
              height: 90,
              child: ClipOval(
                child: Image.network(profile),
              ),
            ),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 16),
                ),
                const SizedBox(height: 20),
                Text(endDateTime != null ? '$startDate ~ $endDate' : startDate),
                Text(
                    '$startHour:$startMinute ~ $endHour:$endMinute ($diffHours h)')
              ],
            )
          ],
        ),
      ),
    );
  }
}
