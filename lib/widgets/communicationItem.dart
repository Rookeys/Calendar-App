import 'package:calendar_app/constants/categories.dart';
import 'package:calendar_app/constants/customColor.dart';
import 'package:calendar_app/models/communication.dart';
import 'package:calendar_app/widgets/readonlyModal.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CommunicationItem extends StatelessWidget {
  final CommunicationType listitem;

  const CommunicationItem({Key? key, required this.listitem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: listitem.userName != null && listitem.content != null
          ? () {
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
          : null,
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
                  categories[listitem.category] ?? '공지',
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
