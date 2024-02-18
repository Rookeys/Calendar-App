import 'package:calendar_app/announcement.dart';
import 'package:calendar_app/auth.dart';
import 'package:calendar_app/calendar.dart';
import 'package:calendar_app/dayOffHistory.dart';
import 'package:calendar_app/dayOffRequest.dart';
import 'package:calendar_app/home.dart';
import 'package:calendar_app/members-admin-edit.dart';
import 'package:calendar_app/members-admin.dart';
import 'package:calendar_app/members.dart';
import 'package:calendar_app/myPage.dart';
import 'package:calendar_app/myPageEdit.dart';
import 'package:calendar_app/notification.dart';
import 'package:calendar_app/register.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GoRouter routes = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) {
        return const Home();
      },
    ),
    GoRoute(
      path: '/calendar',
      pageBuilder: (context, state) => CustomTransitionPage<void>(
        key: state.pageKey,
        child: const Calendar(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            FadeTransition(opacity: animation, child: child),
      ),
    ),
    GoRoute(
      path: '/register',
      pageBuilder: (context, state) => CustomTransitionPage<void>(
        key: state.pageKey,
        child: const Register(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            FadeTransition(opacity: animation, child: child),
      ),
    ),
    GoRoute(
      path: '/myPage',
      // builder: (context, state) => const Calendar(),
      pageBuilder: (context, state) => CustomTransitionPage<void>(
        key: state.pageKey,
        child: const MyPage(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            FadeTransition(opacity: animation, child: child),
      ),
    ),
    GoRoute(
      path: '/announcement',
      pageBuilder: (context, state) => CustomTransitionPage<void>(
        key: state.pageKey,
        child: const Announcement(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            FadeTransition(opacity: animation, child: child),
      ),
    ),
    GoRoute(
      path: '/myPage/edit',
      builder: (context, state) => const MyPageEdit(),
    ),
    GoRoute(
      path: '/dayOffHistory',
      builder: (context, state) => const DayOffHistory(),
    ),
    GoRoute(
      path: '/members',
      builder: (context, state) => const Members(),
    ),
    GoRoute(
      path: '/members-admin',
      builder: (context, state) => const MembersAdmin(),
    ),
    GoRoute(
      path: '/members-admin-edit',
      builder: (context, state) => const MembersAdminEdit(),
    ),
    GoRoute(
      path: '/dayoff-request',
      builder: (context, state) => const DayOffRequest(),
    ),
    GoRoute(
      path: '/register',
      pageBuilder: (context, state) => CustomTransitionPage<void>(
        key: state.pageKey,
        child: const Register(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            FadeTransition(opacity: animation, child: child),
      ),
    ),
    GoRoute(
        path: '/notification',
        pageBuilder: (context, state) => CustomTransitionPage<void>(
              key: state.pageKey,
              child: const Notifications(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) =>
                      FadeTransition(opacity: animation, child: child),
            ))
  ],
);
