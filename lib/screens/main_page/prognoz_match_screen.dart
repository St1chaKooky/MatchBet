import 'package:flutter/material.dart';
import 'package:match_bet/utils/colors.dart';
import 'package:match_bet/widgets/prognoz_match_widget.dart';

import '../../widgets/match_widget.dart';

import 'package:auto_route/auto_route.dart';

@RoutePage()
class PrognozScreen extends StatelessWidget {
  const PrognozScreen({Key? key}) : super(key: key);

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
          'Прогнозы',
          style: theme.titleSmall,
        ),
        // другие настройки flexibleSpace
      ),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding:
                const EdgeInsets.symmetric(horizontal: 15).copyWith(top: 18),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                const PrognozMatchWidget(),
                const SizedBox(
                  height: 18,
                ),
                MatchWidget(
                  id: 1,
                  theme: theme,
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
