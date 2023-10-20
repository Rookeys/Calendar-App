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
    'reason': '사유 : 회사 방송촬영 일정이 잡힘',
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
    'reason': '사유 : 회사 방송촬영 일정이 잡힘',
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
    'reason': '사유 : 회사 방송촬영 일정이 잡힘',
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
    'reason': '사유 : 회사 방송촬영 일정이 잡힘',
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
    'reason': '사유 : 회사 방송촬영 일정이 잡힘',
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
    'reason': '사유 : 회사 방송촬영 일정이 잡힘',
  },
];

class Members extends StatelessWidget {
  const Members({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.whiteBlue,
      body: SafeArea(
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
      width: 360,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color:
            status == 'Pending' ? CustomColor.lightYellow : CustomColor.skyBlue,
      ),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 70,
            alignment: Alignment.centerLeft,
            child: Text(
              '$date - $status',
              style: const TextStyle(
                fontSize: 16,
                color: CustomColor.black,
              ),
            ),
          ),
        ],
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
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360,
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: CustomColor.darkGray,
      ),
      child: ExpansionTileTheme(
        data: const ExpansionTileThemeData(
          tilePadding: EdgeInsets.zero,
        ),
        child: ExpansionTile(
          title: SizedBox(
            child: Text(
              '${widget.date} - ${widget.status}',
              style: const TextStyle(
                fontSize: 16,
                color: CustomColor.black,
              ),
            ),
          ),
          children: [
            Text(widget.reason),
          ],
        ),
      ),
    );
    // return Container(
    //   width: 360,
    // decoration: BoxDecoration(
    //   borderRadius: BorderRadius.circular(30),
    //   color: CustomColor.darkGray,
    //   ),
    //   child: Column(
    //     children: [
    // Container(
    //   height: 70,
    //   padding: const EdgeInsets.symmetric(horizontal: 20),
    //   child: Row(
    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //     children: [
    //       Text(
    //         '${widget.date} - ${widget.status}',
    //         style: const TextStyle(
    //           fontSize: 16,
    //           color: CustomColor.white,
    //         ),
    //       ),
    //       const Icon(
    //         Icons.keyboard_arrow_down_outlined,
    //         color: CustomColor.white,
    //       )
    //     ],
    //   ),
    // ),
    //       // Reason Component
    //     ],
    //   ),
    // );
  }
}
