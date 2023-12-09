import 'package:calendar_app/constants/customColor.dart';
import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  const CustomInput({
    super.key,
    required this.label,
    required this.onSaved,
    this.validator,
    this.inputContainerDecoration,
    this.inputDecoration,
  });

  final String label;
  final FormFieldSetter onSaved;
  final FormFieldValidator? validator;
  final BoxDecoration? inputContainerDecoration;
  final InputDecoration? inputDecoration;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: CustomColor.darkGray,
            ),
          ),
          Container(
            decoration: inputContainerDecoration,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
            child: TextFormField(
              onSaved: onSaved,
              decoration: inputDecoration,
              validator: validator,
              // autovalidateMode: AutovalidateMode.always, // 제어컴포넌트
            ),
          ),
          const SizedBox(
            height: 16.0,
          )
        ],
      ),
    );
  }
}
