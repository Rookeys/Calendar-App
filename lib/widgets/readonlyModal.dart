import 'package:calendar_app/constants/categories.dart';
import 'package:calendar_app/constants/customColor.dart';
import 'package:flutter/material.dart';

class ReadOnlyModal extends StatelessWidget {
  final String title;
  final String userName;
  final String content;
  final String category;

  const ReadOnlyModal({
    super.key,
    required this.title,
    required this.userName,
    required this.content,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                color: CustomColor.skyBlue),
            padding: const EdgeInsets.only(left: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '[${categories[category] ?? '공지'}] $title',
                  style: const TextStyle(
                    color: CustomColor.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(
                    Icons.close,
                    color: Colors.white,
                    size: 18,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(Icons.person_pin_outlined,
                    size: 24, color: CustomColor.black),
                const SizedBox(width: 10),
                Text(
                  userName,
                  style: const TextStyle(
                    color: CustomColor.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              content,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
