import 'package:calendar_app/constants/customColor.dart';
import 'package:calendar_app/widgets/membersAdminEdit/membersEditForm.dart';
import 'package:flutter/material.dart';

class MembersAdminEdit extends StatelessWidget {
  const MembersAdminEdit({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.whiteBlue,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 60,
                ),
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
                const SizedBox(height: 50),
                const MembersEditForm()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
