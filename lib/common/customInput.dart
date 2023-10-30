import 'package:calendar_app/constants/customColor.dart';
import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  const CustomInput({
    super.key,
    required this.label,
    required this.onSaved,
    required this.validator,
  });

  final String label;
  final FormFieldSetter onSaved;
  final FormFieldValidator validator;

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
          TextFormField(
            onSaved: onSaved,
            validator: validator,
            // autovalidateMode: AutovalidateMode.always, // 제어컴포넌트
          ),
          const SizedBox(
            height: 16.0,
          )
        ],
      ),
    );
  }
}
