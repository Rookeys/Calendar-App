import 'package:calendar_app/constants/customColor.dart';
import 'package:flutter/material.dart';

var exampleJson = [
  {
    'date': '2023/09/08',
    'status': 'Pending',
    'reason': null,
  },
  {
    'date': '2023/08/18',
    'status': 'Done',
    'reason': null,
  },
  {
    'date': '2023/08/04',
    'status': 'Reject',
    'reason': '회사 일정이 잡힘',
  },
  {
    'date': '2023/09/08',
    'status': 'Pending',
    'reason': null,
  },
  {
    'date': '2023/08/18',
    'status': 'Done',
    'reason': null,
  },
  {
    'date': '2023/08/04',
    'status': 'Reject',
    'reason':
        '테스트 데이터테스트 데이터테스트 데이터테스트 데이터테스트 데이터테스트 데이터테스트 데이터테스트 데이터테스트 데이터테스트 데이터테스트 데이터테스트 데이터테스트 데이터테스트 데이터테스트 데이터테스트 데이터테스트 데이터테스트 데이터테스트 데이터테스트 데이터테스트 데이터테스트 데이터테스트 데이터테스트 데이터테스트 데이터테스트 데이터테스트 데이터테스트 데이터테스트 데이터테스트 데이터테스트 데이터테스트 데이터테스트 데이터테스트 데이터테스트 데이터테스트 데이터테스트 데이터테스트 데이터테스트 데이터테스트 데이터테스트 데이터테스트 데이터테스트 데이터테스트 데이터테스트 데이터테스트 데이터테스트 데이터테스트 데이터테스트 데이터테스트 데이터테스트 데이터테스트 데이터',
  },
  {
    'date': '2023/09/08',
    'status': 'Pending',
    'reason': null,
  },
  {
    'date': '2023/08/18',
    'status': 'Done',
    'reason': null,
  },
  {
    'date': '2023/08/04',
    'status': 'Reject',
    'reason': '회사 일정이 잡힘',
  },
  {
    'date': '2023/09/08',
    'status': 'Pending',
    'reason': null,
  },
  {
    'date': '2023/08/18',
    'status': 'Done',
    'reason': null,
  },
  {
    'date': '2023/08/04',
    'status': 'Reject',
    'reason': '회사 일정이 잡힘',
  },
  {
    'date': '2023/09/08',
    'status': 'Pending',
    'reason': null,
  },
  {
    'date': '2023/08/18',
    'status': 'Done',
    'reason': null,
  },
  {
    'date': '2023/08/04',
    'status': 'Reject',
    'reason': '회사 일정이 잡힘',
  },
  {
    'date': '2023/09/08',
    'status': 'Pending',
    'reason': null,
  },
  {
    'date': '2023/08/18',
    'status': 'Done',
    'reason': null,
  },
  {
    'date': '2023/08/04',
    'status': 'Reject',
    'reason': '회사 일정이 잡힘',
  },
];

class DayOffHistory extends StatelessWidget {
  const DayOffHistory({super.key});

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
        child: Center(
          child: SizedBox(
            width: 360,
            child: ListView.separated(
              separatorBuilder: (context, index) {
                return const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                );
              },
              // shrinkWrap: true,
              // primary: false,
              itemCount: exampleJson.length,
              itemBuilder: (context, index) {
                if (exampleJson[index]["status"] == 'Reject') {
                  return InfoBoxWithReason(
                    date: exampleJson[index]['date'] as String,
                    status: exampleJson[index]['status'] as String,
                    reason: exampleJson[index]['reason'] as String,
                  );
                }
                return InfoBox(
                  date: exampleJson[index]['date'] as String,
                  status: exampleJson[index]['status'] as String,
                );
              },
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
    required this.date,
    required this.status,
  });

  final String date;
  final String status;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color:
            status == 'Pending' ? CustomColor.lightYellow : CustomColor.skyBlue,
      ),
      height: 70,
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Text(
          '$date - $status',
          style: const TextStyle(
            fontSize: 16,
            color: CustomColor.black,
          ),
        ),
      ),
    );
  }
}

class InfoBoxWithReason extends StatefulWidget {
  const InfoBoxWithReason({
    super.key,
    required this.date,
    required this.status,
    required this.reason,
  });

  final String date;
  final String status;
  final String reason;

  @override
  State<InfoBoxWithReason> createState() => _InfoBoxWithReasonState();
}

class _InfoBoxWithReasonState extends State<InfoBoxWithReason> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          padding: const EdgeInsets.only(
            left: 1,
            right: 1,
          ),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
              // bottomLeft:
              //     _isExpanded ? Radius.zero : const Radius.circular(30),
              // bottomRight:
              //     _isExpanded ? Radius.zero : const Radius.circular(30),
            ),
            color: _isExpanded ? Colors.black : Colors.transparent,
          ),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
                // bottomLeft:
                //     _isExpanded ? Radius.zero : const Radius.circular(30),
                // bottomRight:
                //     _isExpanded ? Radius.zero : const Radius.circular(30),
              ),
              color: _isExpanded ? Colors.white : CustomColor.whiteBlue,
            ),
            height: 70,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _isExpanded = !_isExpanded;
                });
              },
              child: Container(
                height: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: CustomColor.darkGray,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${widget.date} - ${widget.status}',
                        style: const TextStyle(
                          fontSize: 16,
                          color: CustomColor.white,
                        ),
                      ),
                      Icon(
                        // Todo animation
                        _isExpanded
                            ? Icons.keyboard_arrow_up_outlined
                            : Icons.keyboard_arrow_down_outlined,
                        color: CustomColor.white,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        AnimatedCrossFade(
          firstChild: Container(
            padding: const EdgeInsets.only(left: 1, right: 1, bottom: 1),
            decoration: const BoxDecoration(
                color: CustomColor.black,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                )),
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
                color: CustomColor.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  widget.reason,
                  style: const TextStyle(
                    fontSize: 16,
                    height: 1.5,
                  ),
                ),
              ),
            ),
          ),
          secondChild: Container(
            width: double.infinity,
            color: CustomColor.white,
          ),
          crossFadeState: _isExpanded
              ? CrossFadeState.showFirst
              : CrossFadeState.showSecond,
          // sizeCurve: Curves.easeInOut,
          duration: const Duration(milliseconds: 400),
        ),
      ],
    );
  }
}
