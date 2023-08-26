import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../../utils/colors.dart';
import '../../widgets/bet_widget.dart';

class MyBetScreen extends StatefulWidget {
  const MyBetScreen({super.key});

  @override
  State<MyBetScreen> createState() => _MyBetScreenState();
}

class _MyBetScreenState extends State<MyBetScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: whiteColor,
        title: Center(
            child: Text(
          'Создай свой прогноз',
          style: theme.titleSmall,
        )),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15).copyWith(top: 18),
        child: BetWidget(theme: theme),
      ),
    );
  }
}
