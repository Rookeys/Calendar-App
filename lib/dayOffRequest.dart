import 'package:calendar_app/constants/customColor.dart';
import 'package:calendar_app/models/DayOffRequestType.dart';
import 'package:calendar_app/services/getDayOffRequest.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DayOffRequest extends StatefulWidget {
  const DayOffRequest({super.key});

  @override
  State<DayOffRequest> createState() => _DayOffRequestState();
}

class _DayOffRequestState extends State<DayOffRequest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: CustomColor.whiteBlue,
        body:  FutureBuilder<List<DayOffRequestType>>(
              future: getDayOffRequest(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasData &&
                    snapshot.connectionState == ConnectionState.done) {
                  final Map<String, dynamic> dateAndTime = formatDateAndTime(
                      snapshot.data![0].startDateTime,
                      snapshot.data![0].endDateTime);

                  final String startDate = dateAndTime['startDate'];
                  final String endDate = dateAndTime['endDate'];
                  final int startHour = dateAndTime['startHour'];
                  final int startMinute = dateAndTime['startMinute'];
                  final int endHour = dateAndTime['endHour'];
                  final int endMinute = dateAndTime['endMinute'];
                  final int diffHours = dateAndTime['diffHours'];

                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        ListView.separated(
                            shrinkWrap: true,
                            itemCount: snapshot.data!.length,
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return const SizedBox(height: 20);
                            },
                            itemBuilder: (context, index) {
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
                                            child: Image.network(
                                                snapshot.data![index].profile),
                                          ),
                                        ),
                                        const SizedBox(width: 20),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              snapshot.data![index].name,
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 16),
                                            ),
                                            const SizedBox(height: 20),
                                            Text(snapshot.data![index]
                                                        .endDateTime !=
                                                    null
                                                ? '$startDate ~ $endDate'
                                                : startDate),
                                            Text(
                                                '$startHour:$startMinute ~ $endHour:$endMinute ($diffHours h)')
                                          ],
                                        )
                                      ],
                                    ),
                                  ));
                            }),
                      ],
                    ),
                  );
                } else {
                  return const Text('No data');
                }
              }),
        );
  }

  Map<String, dynamic> formatDateAndTime(
      DateTime startDateTime, DateTime endDateTime) {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String startDate = formatter.format(startDateTime);
    final String endDate = formatter.format(endDateTime);
    final int startHour = startDateTime.hour;
    final int startMinute = startDateTime.minute;
    final int endHour = endDateTime.hour;
    final int endMinute = endDateTime.minute;
    final Duration diff = endDateTime.difference(startDateTime);
    final int diffHours = diff.inHours;

    return {
      'startDate': startDate,
      'endDate': endDate,
      'startHour': startHour,
      'startMinute': startMinute,
      'endHour': endHour,
      'endMinute': endMinute,
      'diffHours': diffHours,
    };
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
}
