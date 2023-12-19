import 'package:calendar_app/constants/customColor.dart';
import 'package:flutter/material.dart';

class CustomSecretInput extends StatefulWidget {
  const CustomSecretInput({
    super.key,
    required this.label,
    required this.onSaved,
    required this.validator,
    this.labelStyle,
    this.style,
    this.cursorColor,
    this.inputContainerDecoration,
    this.inputDecoration,
  });

  final String label;
  final FormFieldSetter onSaved;
  final FormFieldValidator validator;
  final TextStyle? labelStyle;
  final TextStyle? style;
  final Color? cursorColor;
  final BoxDecoration? inputContainerDecoration;
  final InputDecoration? inputDecoration;

  @override
  State<CustomSecretInput> createState() => _CustomSecretInputState();
}

class _CustomSecretInputState extends State<CustomSecretInput> {
  bool _secret = true;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.label,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: CustomColor.darkGray,
            ).merge(widget.labelStyle),
          ),
          TextFormField(
            obscureText: _secret,
            onSaved: widget.onSaved,
            validator: widget.validator,
            style: widget.style,
            cursorColor: widget.cursorColor,
            decoration: widget.inputDecoration?.copyWith(
              suffixIcon: GestureDetector(
                child: _secret
                    ? Icon(
                        Icons.visibility_outlined,
                        color: widget.inputDecoration?.iconColor,
                      )
                    : Icon(
                        Icons.visibility_off_outlined,
                        color: widget.inputDecoration?.iconColor,
                      ),
                onTap: () => setState(() {
                  _secret = !_secret;
                }),
              ),
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
