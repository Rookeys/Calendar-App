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
  String email = '';
  String password = '';
  String phone = '';
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomInput(
            label: 'E-mail',
            onSaved: (value) => {email = value},
            validator: (value) {
              if (value.isEmpty) {
                return '필수 필드입니다.';
              }
              return null;
            },
          ),
          CustomSecretInput(
            label: 'Password',
            onSaved: (value) => {password = value},
            validator: (value) {
              if (value.isEmpty) {
                return '필수 필드입니다.';
              }
              return null;
            },
          ),
          CustomInput(
            label: 'Phone',
            onSaved: (value) => {phone = value},
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
                // _formKey.currentState!.save();
                showSuccessMessage('validation 통과');
                print('before $email $password $phone');
                _formKey.currentState!.save();
                print('after $email $password $phone');
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
