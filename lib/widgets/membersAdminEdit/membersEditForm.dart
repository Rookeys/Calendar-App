import 'package:calendar_app/common/customInput.dart';
import 'package:calendar_app/constants/customColor.dart';
import 'package:calendar_app/utils/toastMessage.dart';
import 'package:calendar_app/common/datePickerInput.dart';
import 'package:flutter/material.dart';

class MembersEditForm extends StatefulWidget {
  const MembersEditForm({super.key});

  @override
  State<MembersEditForm> createState() => _FormComponentState();
}

class _FormComponentState extends State<MembersEditForm> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomInput(
            label: 'Name',
            onSaved: (newValue) => {},
            validator: (value) {
              if (value.isEmpty) {
                return '필수 필드입니다.';
              }
              return null;
            },
          ),
          CustomInput(
            label: 'Position',
            onSaved: (newValue) => {},
            validator: (value) {
              if (value.isEmpty) {
                return '필수 필드입니다.';
              }
              return null;
            },
          ),
          // const DatePickerInput(),
          DatePickerInput(
            label: 'Joined Date',
            onSaved: (value) {},
          ),
          CustomInput(
            label: 'Available DayOff',
            onSaved: (newValue) => {},
            validator: (value) {
              if (value.isEmpty) {
                return '필수 필드입니다.';
              }
              return null;
            },
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                showSuccessMessage('validation 통과');
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: CustomColor.skyBlue,
              foregroundColor: CustomColor.white,
            ),
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }
}
