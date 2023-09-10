import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:match_bet/utils/colors.dart';
import '../../widgets/match_widget.dart';

@RoutePage()
class MatchScreen extends StatelessWidget {
  const MatchScreen({Key? key}) : super(key: key);

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

            title: Expanded(
              child: Center(
                child: Text(
                  'Все матчи',
                  style: theme.titleSmall,
                ),
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
                MatchWidget(theme: theme),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
