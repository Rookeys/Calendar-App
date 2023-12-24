import 'package:calendar_app/common/customInput.dart';
import 'package:calendar_app/components/searchableDropdown.dart';
import 'package:calendar_app/constants/customBorderStyle.dart';
import 'package:calendar_app/constants/customColor.dart';
import 'package:calendar_app/services/getRandomNames.dart';
import 'package:flutter/material.dart';

class ChooseCompany extends StatelessWidget {
  final TextEditingController companyNameController;
  final bool isCompanyExist;
  final void Function() onCompanyNameChanged;
  const ChooseCompany(
      {Key? key,
      required this.companyNameController,
      required this.isCompanyExist,
      required this.onCompanyNameChanged})
      : super(key: key);

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
            child: _buildCompanyExist(isCompanyExist),
          )
        ],
      ),
    );
  }

  Widget _buildCompanyExist(bool isCompanyExist) {
    return Column(
      children: [
        Text(
          isCompanyExist ? "회사를 선택해주세요." : "회사 이름을 입력해주세요.",
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: CustomColor.skyBlue,
          ),
        ),
        isCompanyExist
            ? SearchableDropdown(
                asyncItems: getRandomNames,
                themeColor: CustomColor.skyBlue,
                decoration: customInputBorderDecoration(CustomColor.skyBlue),
                validator: (value) =>
                    (value ?? '')!.isEmpty ? "회사를 선택해주세요." : null,
                onSaved: (newValue) => companyNameController.text = newValue!,
              )
            : CustomInput(
                // controller: companyNameController,
                style: const TextStyle(
                  color: CustomColor.skyBlue,
                ),
                cursorColor: CustomColor.skyBlue,
                inputDecoration:
                    customInputBorderDecoration(CustomColor.skyBlue),
                validator: (value) => value!.isEmpty ? "회사 이름을 입력해주세요." : null,
                onSaved: (newValue) => companyNameController.text = newValue!,
              ),
        const SizedBox(
          height: 40,
        ),
        GestureDetector(
          onTap: () {
            onCompanyNameChanged();
          }, // You need to handle this onTap event
          child: Text(
            isCompanyExist ? "회사가 없으신가요 ?" : "회사가 이미 등록되어 있나요 ?",
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              color: CustomColor.skyBlue,
              decoration: TextDecoration.underline,
              decorationColor: CustomColor.skyBlue,
            ),
          ),
        )
      ],
    );
  }
}
