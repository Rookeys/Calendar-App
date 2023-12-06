import 'package:calendar_app/constants/customColor.dart';
import 'package:calendar_app/models/DayOffRequestType.dart';
import 'package:calendar_app/services/getDayOffRequest.dart';
import 'package:calendar_app/widgets/myPageAdminDayoff/DayOffCard.dart';
import 'package:calendar_app/widgets/myPageAdminDayoff/DayOffMdoal.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DayOffRequest extends StatefulWidget {
  const DayOffRequest({super.key});

  @override
  State<DayOffRequest> createState() => _DayOffRequestState();
}

class _DayOffRequestState extends State<DayOffRequest> {
  late Future<List<DayOffRequestType>> futureDayOffRequests;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.whiteBlue,
      body: Stack(children: [
        FutureBuilder<List<DayOffRequestType>>(
            future: futureDayOffRequests,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return const Text('An error occurred');
              } else if (snapshot.hasData) {
                return _buildListView(snapshot.data!);
              } else {
                return const Text('No data');
              }
            }),
      ]),
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
      'endDateTime': endDateTime
    };
  }

  @override
  void initState() {
    super.initState();
    futureDayOffRequests = getDayOffRequest();
  }

  Widget _buildListView(List<DayOffRequestType> data) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ListView.separated(
                shrinkWrap: true,
                itemCount: data.length,
                separatorBuilder: (BuildContext context, int index) =>
                    const SizedBox(height: 10),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return DayOffModal(
                              name: data[index].name,
                              dateAndTime: formatDateAndTime(
                                  data[index].startDateTime,
                                  data[index].endDateTime),
                              description: data[index].description,
                            );
                          });
                    },
                    child: DayOffCard(
                        profile: data[index].profile,
                        name: data[index].name,
                        dateAndTime: formatDateAndTime(
                            data[index].startDateTime,
                            data[index].endDateTime)),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
