import 'package:flutter/material.dart';

import '../constants/customColor.dart';

class FormTextField extends StatefulWidget {
  final dynamic controller;
  final String hintText;
  final bool obscureText;
  final Color themeColor;
  final Icon? suffixIcon;

  // add theme color as parameter optionally
  const FormTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    this.themeColor = CustomColor.white,
    this.suffixIcon,
  }) : super(key: key);

  @override
  State<FormTextField> createState() => _FormTextFieldState();
}

class _FormTextFieldState extends State<FormTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: TextFormField(
          controller: widget.controller,
          obscureText: widget.obscureText ? _obscureText : false,
          style: TextStyle(
            color: widget.themeColor,
            fontSize: 24,
            height: 1.5,
          ),
          cursorHeight: 24,
          cursorColor: widget.themeColor,
          strutStyle: const StrutStyle(
            forceStrutHeight: true,
            fontSize: 14,
            height: 1.8,
          ),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.fromLTRB(0, 20, 0, 4),
            isDense: true,
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
              color: widget.themeColor,
              width: 2,
            )),
            labelText: widget.hintText,
            labelStyle: TextStyle(
              color: widget.themeColor,
              fontSize: 14,
              height: 1.5,
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: widget.themeColor,
                width: 2,
              ),
            ),
            suffixIcon: widget.suffixIcon != null
                ? Transform.translate(
                    offset: const Offset(0, 10),
                    child: widget.suffixIcon,
                  )
                : (widget.obscureText
                    ? Transform.translate(
                        offset: const Offset(0, 10),
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                          alignment: AlignmentDirectional.bottomCenter,
                          icon: Icon(
                            _obscureText
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: widget.themeColor,
                            size: 24,
                          ),
                        ),
                      )
                    : null),
          ),
        ));
  }
}
