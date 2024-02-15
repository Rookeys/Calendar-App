import 'package:calendar_app/constants/customColor.dart';
import 'package:calendar_app/ImagePickerExample.dart';
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
      backgroundColor: CustomColor.whiteBlue,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 130,
                ),
                GestureDetector(
                  onTap: () => _pickImage(setState, file),
                  child: Stack(
                    children: [
                      ClipRRect(
                        clipBehavior: Clip.hardEdge,
                        borderRadius: BorderRadius.circular(100),
                        child: file != null
                            ? const Text('test')
                            : const Image(
                                image: AssetImage('assets/example_profile.jpg'),
                                width: 180,
                                height: 180,
                                fit: BoxFit.cover,
                              ),
                      ),
                      Positioned(
                        top: 0,
                        right: 10,
                        child: GestureDetector(
                          onTap: () => print("사진 가져오기 or 카메라"),
                          child: ClipRRect(
                            clipBehavior: Clip.hardEdge,
                            borderRadius: BorderRadius.circular(100),
                            child: const Image(
                              image: AssetImage('assets/example_profile.jpg'),
                              width: 40,
                              height: 40,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 50),
                const MyPageEditForm(),
                const ImagePickerExample(),
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
