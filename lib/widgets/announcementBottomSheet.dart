import 'package:calendar_app/constants/customColor.dart';
import 'package:calendar_app/widgets/bottomSheetTextField.dart';
import 'package:flutter/material.dart';

class AnnouncementBottomSheet extends StatefulWidget {
  const AnnouncementBottomSheet({super.key});

  @override
  State<AnnouncementBottomSheet> createState() =>
      _AnnouncementBottomSheetState();
}

class _AnnouncementBottomSheetState extends State<AnnouncementBottomSheet> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _summaryController = TextEditingController();
  List<String> categories = ['test', 'test2', 'test3'];
  String category = 'test';

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.7,
        decoration: BoxDecoration(
          color: CustomColor.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Center(
                  child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 50),
                child: Divider(
                  color: CustomColor.black,
                  height: 20,
                  thickness: 2,
                ),
              )),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DropdownButton(
                      isExpanded: true,
                      hint: const Text('Category'),
                      items: categories.map((String value) {
                        return DropdownMenuItem(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? value) {
                        if (value is String) {
                          setState(() {
                            category = value;
                          });
                        }
                      },
                      value: category),
                  const SizedBox(height: 10),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Title",
                        style: TextStyle(
                          fontSize: 24,
                          color: CustomColor.darkGray,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  BottomSheetTextField(
                    titleController: _titleController,
                  ),
                  const SizedBox(height: 10),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Summary",
                        style: TextStyle(
                          fontSize: 24,
                          color: CustomColor.darkGray,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  BottomSheetTextField(
                    titleController: _summaryController,
                    isMultiLine: true,
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: CustomColor.skyBlue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            'Submit',
                            style: TextStyle(color: CustomColor.white),
                          )),
                    ],
                  )
                ],
              ),
            ],
          ),
        ));
  }
}
