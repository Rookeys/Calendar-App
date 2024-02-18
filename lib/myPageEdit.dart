import 'package:calendar_app/constants/customColor.dart';
import 'package:calendar_app/widgets/myPageEdit/myPageEditForm.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MyPageEdit extends StatefulWidget {
  const MyPageEdit({super.key});

  @override
  State<MyPageEdit> createState() => _MyPageEditState();
}

class _MyPageEditState extends State<MyPageEdit> {
  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
  }

  XFile? file;

  @override
  Widget build(BuildContext context) {
    print('file $file');
    return Scaffold(
      appBar: AppBar(
        foregroundColor: CustomColor.black,
        backgroundColor: CustomColor.whiteBlue,
        toolbarHeight: 40,
      ),
      backgroundColor: CustomColor.whiteBlue,
      body: const SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                MyPageEditForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Future<void> _pickImage(Function setState, XFile? file) async {
  final XFile? pickedFile =
      await ImagePicker().pickImage(source: ImageSource.gallery);
  if (pickedFile != null) {
    setState(() {
      file = XFile(pickedFile.path);
    });
  }
}
