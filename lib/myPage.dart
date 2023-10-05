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
                  ],
                ),
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
              const SizedBox(
                // color: CustomColor.green,
                height: 200,
                child: Column(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InfoBox(
                          title: 'test1',
                          value: '1',
                        ),
                        InfoBox(
                          title: 'test2',
                          value: '2',
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class InfoBox extends StatelessWidget {
  const InfoBox({
    super.key,
    required this.title,
    required this.value,
  });

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: CustomColor.pastelBlue,
        boxShadow: [
          BoxShadow(
            blurRadius: 4, // 그림자가 얼마나 드리울지 정함
            offset: const Offset(0, 4), // 그림자의 위치
            color: CustomColor.darkGray.withOpacity(0.5),
          )
        ],
      ),
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: CustomColor.black,
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 30,
              color: CustomColor.white,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
