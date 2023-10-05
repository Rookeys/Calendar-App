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
                decoration: BoxDecoration(
                    color: CustomColor.skyBlue,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(48),
                      bottomRight: Radius.circular(48),
                    ),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 4, // 그림자가 얼마나 드리울지 정함
                        offset: const Offset(0, 4), // 그림자의 위치
                        color: CustomColor.darkGray.withOpacity(0.5),
                      )
                    ]),
                padding: const EdgeInsets.all(10),
                height: 200,
                child: Row(
                  children: [
                    ClipRRect(
                      clipBehavior: Clip.hardEdge,
                      borderRadius: BorderRadius.circular(100),
                      child: const Image(
                        image: AssetImage('assets/example_profile.jpg'),
                        width: 130,
                        height: 130,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    const Column(
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
              Container(
                // color: CustomColor.green,
                height: 200,
              )
            ],
          ),
        ),
      ),
    );
  }
}
