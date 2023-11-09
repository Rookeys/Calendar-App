import 'package:calendar_app/constants/customColor.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.whiteBlue,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(
                    bottom: 40,
                  ),
                  decoration: const BoxDecoration(
                    color: CustomColor.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(48),
                      bottomRight: Radius.circular(48),
                    ),
                  ),
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
                      const Column(
                        children: [
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InfoBox(
                                title: 'Spent DayOff',
                                value: '1',
                              ),
                              InfoBox(
                                title: 'Available DayOff',
                                value: '2',
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 15.0,
                      ),
                      child: MyPageMenu(
                        imageUrl: 'assets/example_profile.jpg',
                        text: 'Edit profile',
                        onTap: () => context.go('/myPage/edit'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 15.0,
                      ),
                      child: MyPageMenu(
                        imageUrl: 'assets/example_profile.jpg',
                        text: 'Day-off History',
                        onTap: () => context.go('/dayOffHistory'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 15.0,
                      ),
                      child: MyPageMenu(
                        imageUrl: 'assets/example_profile.jpg',
                        text: 'Members',
                        onTap: () => context.go('/members'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 15.0,
                      ),
                      child: MyPageMenu(
                        imageUrl: 'assets/example_profile.jpg',
                        text: 'Members-Admin',
                        onTap: () => context.go('/members-admin'),
                      ),
                    ),
                  ],
                )
              ],
            ),
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
      width: 180,
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

class MyPageMenu extends StatelessWidget {
  const MyPageMenu({
    super.key,
    required this.imageUrl,
    required this.text,
    required this.onTap,
  });

  final String imageUrl;
  final String text;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          flex: 1,
          child: ClipRRect(
            clipBehavior: Clip.hardEdge,
            borderRadius: BorderRadius.circular(4),
            child: Image(
              image: AssetImage(imageUrl),
              width: 40,
              height: 40,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          flex: 2,
          child: GestureDetector(
            onTap: onTap,
            child: Text(
              text,
              style: const TextStyle(
                color: CustomColor.skyBlue,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
        ),
        Flexible(
          flex: 1,
          child: GestureDetector(
            onTap: onTap,
            child: const Icon(
              Icons.keyboard_arrow_right,
              size: 48,
              color: CustomColor.skyBlue,
            ),
          ),
        )
      ],
    );
  }
}