import 'package:calendar_app/constants/customColor.dart';
import 'package:flutter/material.dart';

UnderlineInputBorder underlineInputBorder(Color color) {
  return UnderlineInputBorder(
    borderSide: BorderSide(
      color: color,
    ),
  );
}

InputDecoration customInputBorderDecoration(Color color) {
  UnderlineInputBorder border = underlineInputBorder(color);
  return InputDecoration(
    focusedErrorBorder: underlineInputBorder(CustomColor.red),
    disabledBorder: underlineInputBorder(CustomColor.darkGray),
    errorBorder: underlineInputBorder(CustomColor.red),
    border: border,
    enabledBorder: border,
    focusedBorder: border,
  );
}