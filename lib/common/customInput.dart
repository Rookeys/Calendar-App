import 'package:calendar_app/constants/customColor.dart';
import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  const CustomInput({
    super.key,
    this.label,
    this.onSaved,
    this.controller,
    this.labelStyle,
    this.validator,
    this.style,
    this.cursorColor,
    this.inputContainerDecoration,
    this.inputDecoration,
  });

  final String? label;
  final FormFieldSetter? onSaved;
  final FormFieldValidator? validator;
  final TextStyle? labelStyle;
  final TextStyle? style;
  final Color? cursorColor;
  final BoxDecoration? inputContainerDecoration;
  final InputDecoration? inputDecoration;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label ?? '',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: CustomColor.darkGray,
            ).merge(labelStyle),
          ),
          Container(
            decoration: inputContainerDecoration,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
            child: TextFormField(
              controller: controller,
              style: style,
              cursorColor: cursorColor,
              onSaved: onSaved,
              decoration: inputDecoration,
              validator: validator,
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
