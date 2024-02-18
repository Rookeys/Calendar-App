import 'package:calendar_app/constants/customColor.dart';
import 'package:calendar_app/models/Announcement.dart';
import 'package:calendar_app/widgets/readonlyModal.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Notifications extends StatelessWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.pastelBlue,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        child: FutureBuilder<List<AnnouncementType>>(
          future: getAnnouncement(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else if (snapshot.hasData) {
              final notificationData = snapshot.data!;
              return ListView.builder(
                itemCount: notificationData.length,
                itemBuilder: (context, index) {
                  return NotificationItem(context, snapshot.data![index]);
                },
              );
            } else {
              return const Center(
                child: Text('No notifications found.'),
              );
            }
          },
        ),
      ),
    );
  }

  Widget NotificationItem(BuildContext context, AnnouncementType listitem) {
    void onPress() {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return ReadOnlyModal(
              title: listitem.title,
              userName: listitem.userName ?? '',
              content: listitem.content ?? '',
              category: listitem.category,
            );
          });
    }

    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        decoration: BoxDecoration(
          color: CustomColor.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: CustomColor.skyBlue,
            width: 2,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
                decoration: BoxDecoration(
                  border: Border.all(color: CustomColor.skyBlue, width: 1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  listitem.category,
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: CustomColor.skyBlue,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  listitem.title,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: CustomColor.black,
                      decoration: TextDecoration.none,
                      overflow: TextOverflow.ellipsis),
                  softWrap: false,
                  maxLines: 1,
                ),
              )
            ]),
            const SizedBox(height: 5),
            Row(
              children: [
                Text(
                  DateFormat('yyyy-MM-dd').format(listitem.createdDate),
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: CustomColor.darkGray,
                    decoration: TextDecoration.none,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

Future<List<AnnouncementType>> getAnnouncement() async {
  List<AnnouncementType> mockData = [];

  for (int i = 1; i <= 5; i++) {
    AnnouncementType communication = AnnouncementType(
      id: 'id$i',
      title: 'Title $i',
      createdDate: DateTime.now(),
      content: 'Content $i',
      category: 'Category $i',
      userName: 'User $i',
    );
    mockData.add(communication);
  }

  await Future.delayed(const Duration(seconds: 1));

  return mockData;
}
