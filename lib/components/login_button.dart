import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final Function()? onTap;
  final Text text;
  final Color backgroundColor;
  final Image? image;
  // final Color textColor;

  const LoginButton({
    super.key,
    required this.onTap,
    required this.text,
    required this.backgroundColor,
    this.image,
    // required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: image != null ? 15 : 8,
          horizontal: 25,
        ),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: image != null
              ? MainAxisAlignment.start
              : MainAxisAlignment.center,
          children: [
            image ?? const SizedBox(),
            SizedBox(width: image != null ? 24 : 0),
            text,
          ],
        ),
      ),
    );
  }
}
