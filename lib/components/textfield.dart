import 'package:flutter/material.dart';

import '../constants/customColor.dart';

class FormTextField extends StatefulWidget {
  final dynamic controller;
  final String hintText;
  final bool obscureText;

  const FormTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
  });

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
          style: const TextStyle(
            color: CustomColor.white,
            fontSize: 24,
            height: 1.5,
          ),
          cursorHeight: 24,
          cursorColor: CustomColor.white,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.fromLTRB(0, 30, 0, 10),
            isDense: true,
            enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(
              color: CustomColor.white,
              width: 2,
            )),
            labelText: widget.hintText,
            labelStyle: const TextStyle(
              color: CustomColor.white,
              fontSize: 16,
              height: 1.5,
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: CustomColor.white,
                width: 2,
              ),
            ),
            suffixIcon: widget.obscureText
                ? Transform.translate(
                    offset: const Offset(0, 20),
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                      alignment: AlignmentDirectional.bottomCenter,
                      icon: Icon(
                        _obscureText ? Icons.visibility : Icons.visibility_off,
                        color: CustomColor.white,
                        size: 24,
                      ),
                    ),
                  )
                : null,
          ),
        ));
  }
}
