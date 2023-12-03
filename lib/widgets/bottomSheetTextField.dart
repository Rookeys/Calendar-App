import 'package:calendar_app/constants/customColor.dart';
import 'package:flutter/material.dart';

class BottomSheetTextField extends StatelessWidget {
  final TextEditingController titleController;
  final bool isMultiLine;

  const BottomSheetTextField(
      {super.key, required this.titleController, this.isMultiLine = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: CustomColor.brightGray,
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      padding: const EdgeInsets.all(16),
      child: TextField(
        controller: titleController,
        decoration: const InputDecoration.collapsed(hintText: 'Event title'),
        keyboardType:
            isMultiLine ? TextInputType.multiline : TextInputType.text,
        maxLines: isMultiLine ? 8 : 1,
      ),
    );
  }
}
