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
