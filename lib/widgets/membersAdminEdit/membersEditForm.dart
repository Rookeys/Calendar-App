import 'package:calendar_app/constants/customColor.dart';
import 'package:calendar_app/utils/toastMessage.dart';
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
          // 달력 input 추가
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
