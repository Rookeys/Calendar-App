import 'package:calendar_app/constants/customColor.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showCustomMessage(String message,
    {ToastGravity position = ToastGravity.BOTTOM,
    double fontSize = 18,
    Color bgColor = CustomColor.darkGray,
    Color textColor = CustomColor.white,
    int delay = 1}) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_LONG,
    fontSize: fontSize,
    gravity: position,
    backgroundColor: bgColor,
    textColor: textColor,
    timeInSecForIosWeb: delay,
  );
}

void showErrorMessage(
  String message, {
  ToastGravity position = ToastGravity.BOTTOM,
  double fontSize = 18,
  Color bgColor = CustomColor.red,
  Color textColor = CustomColor.white,
}) {
  showCustomMessage(
    message,
    position: position,
    fontSize: fontSize,
    bgColor: bgColor,
    textColor: textColor,
  );
}

void showSuccessMessage(
  String message, {
  ToastGravity position = ToastGravity.BOTTOM,
  double fontSize = 18,
  Color bgColor = CustomColor.green,
  Color textColor = CustomColor.white,
}) {
  showCustomMessage(
    message,
    position: position,
    fontSize: fontSize,
    bgColor: bgColor,
    textColor: textColor,
  );
}

void showWarningMessage(
  String message, {
  ToastGravity position = ToastGravity.BOTTOM,
  double fontSize = 18,
  Color bgColor = CustomColor.orange,
  Color textColor = CustomColor.white,
}) {
  showCustomMessage(
    message,
    position: position,
    fontSize: fontSize,
    bgColor: bgColor,
    textColor: textColor,
  );
}
