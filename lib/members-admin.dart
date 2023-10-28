import 'package:calendar_app/constants/customColor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

const exampleMyInfo = {
  'name': 'KoJaem',
  'role': 'Rookeys',
};

var exampleJson = [
  {
    'name': 'KoJaem',
    'role': 'Front-End',
  },
  {
    'name': 'KoJaem',
    'role': 'Front-End',
  },
  {
    'name': 'KoJaem',
    'role': 'Front-End',
  },
  {
    'name': 'KoJaem',
    'role': 'Front-End',
  },
  {
    'name': 'KoJaem',
    'role': 'Front-End',
  },
  {
    'name': 'KoJaem',
    'role': 'Front-End',
  },
  {
    'name': 'KoJaem',
    'role': 'Front-End',
  },
  {
    'name': 'KoJaem',
    'role': 'Front-End',
  },
  {
    'name': 'KoJaem',
    'role': 'Front-End',
  },
  {
    'name': 'KoJaem',
    'role': 'Front-End',
  },
  {
    'name': 'KoJaem',
    'role': 'Front-End',
  },
  {
    'name': 'KoJaem',
    'role': 'Front-End',
  },
  {
    'name': 'KoJaem',
    'role': 'Front-End',
  },
];

class MembersAdmin extends StatelessWidget {
  const MembersAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.whiteBlue,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Center(
              child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    clipBehavior: Clip.hardEdge,
                    borderRadius: BorderRadius.circular(100),
                    child: const Image(
                      image: AssetImage('assets/example_profile.jpg'),
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${exampleMyInfo['name']} (Me)',
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          '${exampleMyInfo['role']}',
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Expanded(
                child: SizedBox(
                  width: 360,
                  child: ListView.separated(
                    separatorBuilder: (context, index) {
                      return const Padding(
                        padding: EdgeInsets.symmetric(vertical: 8),
                      );
                    },
                    itemCount: exampleJson.length,
                    itemBuilder: (context, index) {
                      return InfoBox(
                        name: exampleJson[index]['name'] as String,
                        role: exampleJson[index]['role'] as String,
                      );
                    },
                  ),
                ),
              ),
            ],
          )),
        ),
      ),
    );
  }
}

class InfoBox extends StatelessWidget {
  const InfoBox({
    super.key,
    required this.name,
    required this.role,
  });

  final String name;
  final String role;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: CustomColor.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Slidable(
        endActionPane: ActionPane(
          extentRatio: 0.5,
          motion: const ScrollMotion(),
          children: [
            // A SlidableAction can have an icon and/or a label.
            SlidableAction(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30),
                bottomLeft: Radius.circular(30),
              ),
              onPressed: (context) => {},
              backgroundColor: CustomColor.green,
              foregroundColor: Colors.white,
              label: 'Edit',
              padding: EdgeInsets.zero,
            ),
            SlidableAction(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
              onPressed: (context) => {},
              backgroundColor: CustomColor.red,
              foregroundColor: Colors.white,
              label: 'Delete',
              padding: EdgeInsets.zero,
            ),
          ],
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: CustomColor.white,
          ),
          height: 80,
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                ClipRRect(
                  clipBehavior: Clip.hardEdge,
                  borderRadius: BorderRadius.circular(100),
                  child: const Image(
                    image: AssetImage('assets/example_profile.jpg'),
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        role,
                        style: const TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
