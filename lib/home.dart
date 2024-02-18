import 'package:calendar_app/announcement.dart';
import 'package:calendar_app/auth.dart';
import 'package:calendar_app/calendar.dart';
import 'package:calendar_app/models/nav_model.dart';
import 'package:calendar_app/myPage.dart';
import 'package:calendar_app/notification.dart';
import 'package:calendar_app/widgets/layout/footer/view.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  int _selectedNavIndex = 1;
  List<NavigationModel> items = [];

  @override
  void initState() {
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
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          if (snapshot.hasData) {
            // Firebase Auth token exists
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
                                MaterialPageRoute(
                                    builder: (context) => page.page)
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
              ),
            );
          } else {
            return AuthPage();
          }
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}
