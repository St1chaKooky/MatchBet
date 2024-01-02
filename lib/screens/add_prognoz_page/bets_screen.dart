import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../../utils/colors.dart';
import '../../widgets/bet_widget.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class MyBetScreen extends StatefulWidget {
  final int id;
  final String team1;
  final String team2;
  final String date;

  const MyBetScreen({Key? key, required this.date,required this.team1, required this.team2, required this.id}) : super(key: key);

  @override
  State<MyBetScreen> createState() => _MyBetScreenState();
}

class _MyBetScreenState extends State<MyBetScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Scaffold(
        appBar: AppBar(
          titleSpacing: 0,
          toolbarHeight: 65,
          surfaceTintColor: whiteColor,
          backgroundColor: whiteColor,
          automaticallyImplyLeading: true,
          centerTitle: true,
          title: Text(
            'Создай свой прогноз',
            style: theme.titleSmall,
          ),
          // другие настройки flexibleSpace
        ),
        body: CustomScrollView(slivers: [
          BetWidget(
            id: widget.id, date: widget.date, team1: widget.team1, team2: widget.team2,
          )
        ]));
  }
}
