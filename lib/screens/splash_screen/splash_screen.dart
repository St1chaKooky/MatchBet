import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:match_bet/utils/colors.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [primaryColor, Color(hexColor('1314DE'))],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft),
        ),
        child: Center(
            child: Text(
          'MatchBet',
          style: theme.titleLarge,
        )),
      ),
    );
  }
}
