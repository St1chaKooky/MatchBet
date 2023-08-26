import 'package:flutter/material.dart';
import 'package:match_bet/screens/add_prognoz_page/my_bet_prgnoz.dart';
import 'package:match_bet/utils/theme.dart';
import 'screens/add_prognoz_page/list_match_screen.dart';
import 'screens/add_prognoz_page/my_publication_prognoz.dart';
import 'screens/main_page/main_screen.dart';
import 'screens/main_page/match_screen.dart';
import 'screens/main_page/prognoz_match_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: buildThemeData(context),
      home: MyBetScreen(),
    );
  }
}
