import 'package:calendar_app/constants/customColor.dart';
import 'package:calendar_app/widgets/myPageEdit/myPageEditForm.dart';
import 'package:flutter/material.dart';

class MyPageEdit extends StatelessWidget {
  const MyPageEdit({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: CustomColor.black,
        backgroundColor: CustomColor.whiteBlue,
        toolbarHeight: 40,
      ),
      backgroundColor: CustomColor.whiteBlue,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 130,
                ),
                Stack(
                  children: [
                    ClipRRect(
                      clipBehavior: Clip.hardEdge,
                      borderRadius: BorderRadius.circular(100),
                      child: const Image(
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
                const SizedBox(height: 50),
                const MyPageEditForm()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
