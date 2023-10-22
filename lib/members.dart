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

class Members extends StatelessWidget {
  const Members({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      child: Text(
        '$date - $status',
        style: const TextStyle(
          fontSize: 16,
          color: CustomColor.black,
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
    return GestureDetector(
      onTap: () {
        setState(() {
          _isExpanded = !_isExpanded;
        });
      },
      child: Column(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(30),
                topRight: const Radius.circular(30),
                bottomLeft:
                    _isExpanded ? Radius.zero : const Radius.circular(30),
                bottomRight:
                    _isExpanded ? Radius.zero : const Radius.circular(30),
              ),
              color: CustomColor.green,
            ),
            height: 70,
            child: Container(
              height: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: CustomColor.darkGray,
              ),
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
          AnimatedCrossFade(
            firstChild: Container(
              width: double.infinity,
              color: CustomColor.white,
              child: Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    widget.reason,
                    style: const TextStyle(
                      fontSize: 16,
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
            duration: const Duration(milliseconds: 400),
          ),
          // Transform.translate(
          //   offset: const Offset(0, -50),
          //   child: AnimatedCrossFade(
          //     firstChild: Container(
          //       width: double.infinity,
          //       color: CustomColor.white,
          //       child: Padding(
          //         padding: const EdgeInsets.only(top: 50),
          //         child: Padding(
          //           padding: const EdgeInsets.all(16.0),
          //           child: Text(
          //             widget.reason,
          //             style: const TextStyle(
          //               fontSize: 16,
          //             ),
          //           ),
          //         ),
          //       ),
          //     ),
          //     secondChild: Container(
          //       width: double.infinity,
          //       color: CustomColor.white,
          //     ),
          //     crossFadeState: _isExpanded
          //         ? CrossFadeState.showFirst
          //         : CrossFadeState.showSecond,
          //     duration: const Duration(milliseconds: 200),
          //   ),
          // ),
        ],
      ),
    );
  }
}
