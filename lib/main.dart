import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';

import 'package:match_bet/firebase_options.dart';
import 'package:match_bet/router/router.dart';

import 'package:match_bet/utils/theme.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(MyApp());
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
