import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class Phone extends StatelessWidget {
  final TextEditingController controller;
  const Phone({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      FormField<String>(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter a phone number';
          }
          return null;
        },
        initialValue: controller.text,
        onSaved: (newValue) => controller.text = newValue!,
        builder: (FormFieldState<String> state) {
          return IntlPhoneField(
            decoration: InputDecoration(
              labelText: 'Phone Number',
              border: OutlineInputBorder(
                borderSide: BorderSide(),
              ),
              errorText: state.errorText,
            ),
            initialCountryCode: 'KR',
            onChanged: (phone) {
              state.didChange(phone.completeNumber);
            },
          );
        },
      ),
    ]);
  }
}
