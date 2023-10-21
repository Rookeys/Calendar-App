import 'package:calendar_app/constants/categories.dart';
import 'package:calendar_app/constants/customColor.dart';
import 'package:calendar_app/models/announcement.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AnnouncementListItem extends StatelessWidget {
  final AnnouncementItem announcement;

  const AnnouncementListItem({Key? key, required this.announcement})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
              decoration: BoxDecoration(
                border: Border.all(color: CustomColor.skyBlue, width: 1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                categories[announcement.category] ?? '공지',
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
                announcement.title,
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
                DateFormat('yyyy-MM-dd').format(announcement.createdDate),
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
    );
  }
}
