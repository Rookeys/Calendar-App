import 'package:calendar_app/announcement.dart';
import 'package:calendar_app/calendar.dart';
import 'package:calendar_app/constants/customColor.dart';
import 'package:calendar_app/models/nav_model.dart';
import 'package:calendar_app/myPage.dart';
import 'package:calendar_app/notification.dart';
import 'package:calendar_app/widgets/layout/footer/view.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final announcementNavKey = GlobalKey<NavigatorState>();
  final calendarNavKey = GlobalKey<NavigatorState>();
  final notificationNavKey = GlobalKey<NavigatorState>();
  final myPageNavKey = GlobalKey<NavigatorState>();
  int _selectedNavIndex = 0;
  List<NavigationModel> items = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    items = [
      NavigationModel(
        page: const Announcement(),
        navigatorKey: announcementNavKey,
      ),
      NavigationModel(
        page: const Calendar(),
        navigatorKey: calendarNavKey,
      ),
      NavigationModel(
        page: const Notifications(),
        navigatorKey: notificationNavKey,
      ),
      NavigationModel(
        page: const MyPage(),
        navigatorKey: myPageNavKey,
      ),
    ];
  }

  @override
  Widget build(BuildContext contexst) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: IndexedStack(
            index: _selectedNavIndex,
            children: items
                .map((page) => Navigator(
                    key: page.navigatorKey,
                    onGenerateInitialRoutes: (navigator, initialRoute) {
                      return [
                        MaterialPageRoute(builder: (context) => page.page)
                      ];
                    }))
                .toList()),
        bottomNavigationBar: NavigaterBar(
          pageIndex: _selectedNavIndex,
          onTap: (index) {
            if (index == _selectedNavIndex) {
              items[index]
                  .navigatorKey
                  .currentState!
                  .popUntil((route) => route.isFirst);
            }
            setState(() {
              _selectedNavIndex = index;
            });
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: SizedBox(
            height: 64,
            width: 64,
            child: FloatingActionButton(
              backgroundColor: CustomColor.white,
              onPressed: () {
                print('test');
              },
              shape: RoundedRectangleBorder(
                side: const BorderSide(width: 3, color: CustomColor.skyBlue),
                borderRadius: BorderRadius.circular(100),
              ),
              child: const Icon(
                Icons.add,
                size: 32,
                color: CustomColor.skyBlue,
              ),
            )),
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return SafeArea(
  //     child: Scaffold(
  //       appBar: AppBar(
  //         foregroundColor: CustomColor.white,
  //         backgroundColor: CustomColor.skyBlue,
  //         title: const Text(
  //           "Home Page",
  //           style: TextStyle(
  //             fontSize: 24,
  //           ),
  //         ),
  //       ),
  //       body: Column(
  //         children: [
  // ElevatedButton(
  //   onPressed: () {
  //     context.go('/calendar');
  //   },
  //   style: ElevatedButton.styleFrom(
  //     backgroundColor: CustomColor.skyBlue,
  //     foregroundColor: CustomColor.white,
  //   ),
  //   child: const Text('Go to Calendar Page'),
  // ),
  // ElevatedButton(
  //   onPressed: () {
  //     context.go('/announcement');
  //   },
  //   style: ElevatedButton.styleFrom(
  //     backgroundColor: CustomColor.skyBlue,
  //     foregroundColor: CustomColor.white,
  //   ),
  //   child: const Text('Go to Announcement Page'),
  // ),
  // ElevatedButton(
  //   onPressed: () {
  //     context.go('/notification');
  //   },
  //   style: ElevatedButton.styleFrom(
  //     backgroundColor: CustomColor.skyBlue,
  //     foregroundColor: CustomColor.white,
  //   ),
  //   child: const Text('Go to Notification Page'),
  // ),
  // ElevatedButton(
  //   onPressed: () async {
  //     await FirebaseAuth.instance.signOut();
  //     String? accessToken = await getAccessToken();
  //     if (accessToken != null) {
  //       await deleteAccessToken();
  //       print('deleted google access token');
  //     } else {
  //       print('No access google access token found.');
  //     }
  //   },
  //   style: ElevatedButton.styleFrom(
  //     backgroundColor: CustomColor.skyBlue,
  //     foregroundColor: CustomColor.white,
  //   ),
  //   child: const Text('Sign Out'),
  // ),
  // ElevatedButton(
  //   onPressed: () {
  //     context.push('/register');
  //   },
  //   style: ElevatedButton.styleFrom(
  //     backgroundColor: CustomColor.skyBlue,
  //     foregroundColor: CustomColor.white,
  //   ),
  //   child: const Text('Register Company'),
  // ),
  // ElevatedButton(
  //   onPressed: () {
  //     context.go('/myPage');
  //     // context.push('/calendar');
  //   },
  //   style: ElevatedButton.styleFrom(
  //     backgroundColor: CustomColor.skyBlue,
  //     foregroundColor: CustomColor.white,
  //   ),
  //   child: const Text('Go to My Page'),
  // ),
  // ElevatedButton(
  //   onPressed: () {
  //     context.go('/dayoff-request');
  //   },
  //   style: ElevatedButton.styleFrom(
  //     backgroundColor: CustomColor.skyBlue,
  //     foregroundColor: CustomColor.white,
  //   ),
  //   child: const Text('Go to Day Off Request'),
  // ),
  //       ],
  //     ),
  //   ),
  // );
  // }
}
