import 'package:calendar_app/constants/customColor.dart';
import 'package:flutter/material.dart';

class CustomSecretInput extends StatefulWidget {
  const CustomSecretInput({
    super.key,
    required this.label,
    required this.onSaved,
    required this.validator,
  });

  final String label;
  final FormFieldSetter onSaved;
  final FormFieldValidator validator;

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
            ),
          ),
          TextFormField(
            obscureText: _secret,
            onSaved: widget.onSaved,
            validator: widget.validator,
            // autovalidateMode: AutovalidateMode.always, // 제어컴포넌트
            decoration: InputDecoration(
              suffixIcon: GestureDetector(
                child: _secret
                    ? const Icon(Icons.visibility_outlined)
                    : const Icon(Icons.visibility_off_outlined),
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
