import 'package:flutter/material.dart';
import '../../widgets/match_widget.dart';

class MatchScreen extends StatelessWidget {
  const MatchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Создай свой прогноз')),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15).copyWith(top: 15),
        child: MatchWidget(theme: theme),
      ),
    );
  }
}
