import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
import 'package:match_bet/router/router.dart';

import 'package:match_bet/utils/theme.dart';

void main() {
  // Ваша строка с датой и временем
  final now = DateTime.now();
  final timeZone = now.timeZoneName;
  print(timeZone);

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _router = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: buildThemeData(context),
      routerConfig: _router.config(),
    );
  }
}
