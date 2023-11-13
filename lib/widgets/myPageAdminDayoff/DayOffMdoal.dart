import 'package:calendar_app/constants/customColor.dart';
import 'package:flutter/material.dart';

class DayOffModal extends StatefulWidget {
  final String name;
  final String description;
  final Map<String, dynamic> dateAndTime;
  const DayOffModal(
      {super.key,
      required this.name,
      required this.dateAndTime,
      required this.description});

  @override
  State<DayOffModal> createState() => _DayOffModalState();
}

class _DayOffModalState extends State<DayOffModal> {
  late final String startDate;
  late final int diffHours;
  final reasonController = TextEditingController();
  bool isRejected = false;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 30,
            decoration: const BoxDecoration(
              color: CustomColor.skyBlue,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            ),
            padding: const EdgeInsets.only(right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                    onTap: Navigator.of(context).pop,
                    child: const Icon(Icons.close, color: CustomColor.white))
              ],
            ),
          ),
          Flexible(
            child: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(children: [
                  Row(
                    children: [
                      const Icon(Icons.person, color: CustomColor.skyBlue),
                      Text(
                        widget.name,
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Row(
                    children: [
                      const Icon(Icons.calendar_month_outlined,
                          color: CustomColor.skyBlue),
                      Text(
                        '$startDate ( $diffHours h )',
                        style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            color: CustomColor.darkGray),
                      )
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Column(
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Dayoff Reason',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14),
                          ),
                        ],
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: CustomColor
                                .darkGray, // Change this to your desired color
                            width: 1, // Change this to your desired width
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Text(
                          widget.description,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  isRejected
                      ? Column(children: [
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Reject Reason',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 14),
                              ),
                            ],
                          ),
                          TextFormField(
                            controller: reasonController,
                            cursorColor: CustomColor.black,
                            maxLines: null,
                            style: const TextStyle(
                              fontSize:
                                  12.0, // Change this value to change the text size
                              color: CustomColor
                                  .black, // Change this value to change the text color
                            ),
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 4),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: CustomColor.skyBlue),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                            ),
                          ),
                        ])
                      : Container()
                ]),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isRejected = !isRejected;
                    });
                  },
                  style: ButtonStyle(backgroundColor:
                      MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                    return CustomColor
                        .red; // Use the same color regardless of the state.
                  })),
                  child: Text(
                    isRejected ? 'Cancel' : 'Reject',
                    style: const TextStyle(color: CustomColor.white),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.02,
                ),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isRejected = !isRejected;
                      });
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        return CustomColor
                            .skyBlue; // Use the same color regardless of the state.
                      }),
                    ),
                    child: Text(
                      isRejected ? 'Reject' : 'Approve',
                      style: const TextStyle(color: CustomColor.white),
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startDate = widget.dateAndTime['startDate'];
    diffHours = widget.dateAndTime['diffHours'];
  }
}
