import 'dart:io';
import 'package:calendar_app/common/customInput.dart';
import 'package:calendar_app/common/customSecretInput.dart';
import 'package:calendar_app/constants/customColor.dart';
import 'package:calendar_app/utils/toastMessage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

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
  XFile? _imageFile;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      _imageFile = pickedFile;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          const SizedBox(height: 20),
          GestureDetector(
            onTap: _pickImage,
            child: Stack(
              children: [
                ClipRRect(
                  clipBehavior: Clip.hardEdge,
                  borderRadius: BorderRadius.circular(100),
                  child: _imageFile != null
                      ? Image.file(
                          File(_imageFile!.path),
                          width: 180,
                          height: 180,
                          fit: BoxFit.cover,
                        )
                      : const Image(
                          image: AssetImage('assets/example_profile.jpg'),
                          width: 180,
                          height: 180,
                          fit: BoxFit.cover,
                        ),
                ),
                // Positioned(
                //   top: 0,
                //   right: 10,
                //   child: GestureDetector(
                //     onTap: () => print("사진 가져오기 or 카메라"),
                //     child: ClipRRect(
                //       clipBehavior: Clip.hardEdge,
                //       borderRadius: BorderRadius.circular(100),
                //       child: const Image(
                //         image: AssetImage('assets/example_profile.jpg'),
                //         width: 40,
                //         height: 40,
                //         fit: BoxFit.cover,
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
          const SizedBox(height: 50),
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
