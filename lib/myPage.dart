import 'package:calendar_app/constants/customColor.dart';
import 'package:flutter/material.dart';

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: CustomColor.skyBlue,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(48),
                  bottomRight: Radius.circular(48),
                ),
              ),
              height: 200,
              child: const Row(
                children: [
                  ClipRRect(
                    clipBehavior: Clip.hardEdge,
                    // Todo 이미지 사이즈 조정
                    // borderRadius: BorderRadius.circular(48),
                    child: Image(
                      image: AssetImage('assets/example_profile.jpg'),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Name: KoJaem",
                        style: TextStyle(
                          fontSize: 16,
                          color: CustomColor.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Position: Front-End',
                        style: TextStyle(
                            fontSize: 16,
                            color: CustomColor.white,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Joined Team : 2023-03-13',
                        style: TextStyle(
                          fontSize: 16,
                          color: CustomColor.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
