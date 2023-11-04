import 'package:calendar_app/components/autocomplete_textfield.dart';
import 'package:calendar_app/constants/customColor.dart';
import 'package:flutter/material.dart';

class ChooseCompany extends StatelessWidget {
  final TextEditingController companyNameController;
  const ChooseCompany({super.key, required this.companyNameController});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 40,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                const Text(
                  "회사를 선택해주세요.",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: CustomColor.skyBlue,
                  ),
                ),
                AutoCompleteTextField(
                  textEditingController: companyNameController,
                ),
                const SizedBox(
                  height: 40,
                ),
                const Text(
                  '회사가 없으신가요?',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: CustomColor.skyBlue,
                    decoration: TextDecoration.underline,
                    decorationColor: CustomColor.skyBlue,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
