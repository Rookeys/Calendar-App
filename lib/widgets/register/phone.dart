import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class Phone extends StatelessWidget {
  final TextEditingController controller;
  const Phone({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      IntlPhoneField(
        controller: controller,
        decoration: const InputDecoration(
          labelText: 'Phone Number',
          border: OutlineInputBorder(
            borderSide: BorderSide(),
          ),
        ),
        initialCountryCode: 'IN',
        // onChanged: (phone) {
        //   print(phone.completeNumber);
        // },
      )
    ]);
  }
}
