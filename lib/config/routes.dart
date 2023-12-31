import 'package:calendar_app/calendar.dart';
import 'package:calendar_app/home.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GoRouter routes = GoRouter(routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => const Home(),
  ),
  GoRoute(
    path: '/calendar',
    // builder: (context, state) => const Calendar(),
    pageBuilder: (context, state) => CustomTransitionPage<void>(
      key: state.pageKey,
      child: const Calendar(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) =>
          FadeTransition(opacity: animation, child: child),
    ),
  )
]);
