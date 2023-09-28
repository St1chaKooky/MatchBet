import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../../utils/colors.dart';
import '../../widgets/bet_widget.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class MyBetScreen extends StatefulWidget {
  const MyBetScreen({Key? key}) : super(key: key);

  @override
  State<MyBetScreen> createState() => _MyBetScreenState();
}

class _MyBetScreenState extends State<MyBetScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Scaffold(
        body: CustomScrollView(slivers: [
      SliverAppBar(
        expandedHeight: 60,
        floating: false,
        backgroundColor: whiteColor,

        title: Center(
          child: Text(
            'Создай свой прогноз',
            style: theme.titleSmall,
          ),
        ),
        // другие настройки flexibleSpace

        elevation: 0,
      ),
      BetWidget(
        id: 1075292,
      )
    ]));
  }
}
