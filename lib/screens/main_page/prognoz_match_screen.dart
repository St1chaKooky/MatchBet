import 'package:flutter/material.dart';
import 'package:match_bet/utils/colors.dart';

import '../../widgets/match_widget.dart';
import '../../widgets/prognoz_widget.dart';

import 'package:auto_route/auto_route.dart';

@RoutePage()
class PrognozScreen extends StatelessWidget {
  const PrognozScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 60,
            floating: false,
            backgroundColor: whiteColor,

            title: Center(
              child: Text(
                'Прогнозы',
                style: theme.titleSmall,
              ),
            ),
            // другие настройки flexibleSpace

            elevation: 0,
          ),
          SliverPadding(
            padding:
                const EdgeInsets.symmetric(horizontal: 15).copyWith(top: 18),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                PrognozWidget(theme: theme),
                const SizedBox(
                  height: 18,
                ),
                MatchWidget(
                  theme: theme,
                  id: 32,
                ),
                const SizedBox(
                  height: 18,
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
