// import 'package:flutter/material.dart';
// import 'package:match_bet/router/router.dart';
//
// import 'package:match_bet/utils/theme.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatefulWidget {
//   const MyApp({super.key});
//
//   @override
//   State<MyApp> createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   final _router = AppRouter();
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp.router(
//       debugShowCheckedModeBanner: false,
//       theme: buildThemeData(context),
//       routerConfig: _router.config(),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:match_bet/screens/start_page/login_screen.dart';

import 'package:match_bet/utils/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: buildThemeData(context),
      home: const LoginScreen(),
    );
  }
}
