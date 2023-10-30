import 'package:calendar_app/common/customInput.dart';
import 'package:calendar_app/common/customSecretInput.dart';
import 'package:calendar_app/constants/customColor.dart';
import 'package:calendar_app/utils/toastMessage.dart';
import 'package:flutter/material.dart';

class MyPageEditForm extends StatefulWidget {
  const MyPageEditForm({super.key});

  @override
  State<MyPageEditForm> createState() => _FormComponentState();
}

class _FormComponentState extends State<MyPageEditForm> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomInput(
            label: 'E-mail',
            onSaved: (newValue) => {},
            validator: (value) {
              if (value.isEmpty) {
                return '필수 필드입니다.';
              }
              return null;
            },
          ),
          CustomSecretInput(
            label: 'Password',
            onSaved: (newValue) => {},
            validator: (value) {
              if (value.isEmpty) {
                return '필수 필드입니다.';
              }
              return null;
            },
          ),
          CustomInput(
            label: 'Phone',
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
