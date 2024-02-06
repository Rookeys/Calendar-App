import 'package:flutter/material.dart';

class NavigationModel {
  final Widget page;
  final GlobalKey<NavigatorState> navigatorKey;

  NavigationModel({
    required this.page,
    required this.navigatorKey,
  });
}
