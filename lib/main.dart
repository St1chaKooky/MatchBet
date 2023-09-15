import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:match_bet/router/router.dart';

import 'package:match_bet/utils/theme.dart';

void main() {
  final jsonDateStr =
      "2023-09-14T18:15:00+00:00"; // Ваша строка с датой и временем
  final now = DateTime.now();
  final timeZone = now.timeZoneName;
  final dateTime = DateTime.parse(jsonDateStr);

  // Преобразовываем время в локальное время
  final localTime = dateTime.toLocal();

  // Форматируем часы и минуты
  final timeFormat = DateFormat('HH:mm');
  final formattedTime = timeFormat.format(localTime);

  print('Время матча в вашей локальной временной зоне ($timeZone): $formattedTime');

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
