import 'package:calendar_app/config/routes.dart';
import 'package:flutter/material.dart';
// import 'package:intl/date_symbol_data_local.dart';

void main() async {
  // 달력 언어 한글로 지원할거면 필요
  // await initializeDateFormatting();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      routerConfig: routes,
    );
  }
}
