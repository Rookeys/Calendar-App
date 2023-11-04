import 'package:calendar_app/constants/customColor.dart';
import 'package:flutter/material.dart';

class Position extends StatelessWidget {
  final String position;
  final ValueChanged<String> onPositionChanged;
  const Position(
      {super.key, required this.position, required this.onPositionChanged});

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      const Text(
        "직책을 선택해주세요.",
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: CustomColor.skyBlue,
        ),
      ),
      const SizedBox(
        height: 20,
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildButton('직원', context),
          _buildButton('관리자', context),
        ],
      )
    ]);
  }

  Widget _buildButton(String title, BuildContext context) {
    bool isSelected = position == title;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        width: double.infinity,
        child: OutlinedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
                isSelected ? CustomColor.skyBlue : CustomColor.white),
            side: MaterialStateProperty.all(
                const BorderSide(color: CustomColor.skyBlue, width: 1)),
          ),
          onPressed: () {
            onPositionChanged(title);
          },
          child: Text(
            title,
            style: TextStyle(
              color: isSelected ? CustomColor.white : CustomColor.skyBlue,
            ),
          ),
        ),
      ),
    );
  }
}
