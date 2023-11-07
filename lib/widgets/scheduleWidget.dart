import 'package:calendar_app/constants/customColor.dart';
import 'package:flutter/material.dart';

class ScheduleWidget extends StatelessWidget {
  const ScheduleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: CustomColor.lightPurple,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            blurRadius: 4, // 그림자가 얼마나 드리울지 정함
            offset: const Offset(0, 4), // 그림자의 위치
            color: CustomColor.darkGray.withOpacity(0.5),
          )
        ],
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 12,
      ),
      child: const Text('test'),
    );
  }
}
