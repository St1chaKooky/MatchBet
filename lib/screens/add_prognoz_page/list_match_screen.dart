import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:match_bet/components_lists/list_title_league.dart';

import '../../utils/colors.dart';

@RoutePage()
class ListMatchScreen extends StatefulWidget {
  const ListMatchScreen({super.key});

  @override
  State<ListMatchScreen> createState() => _ListMatchScreenState();
}

class _ListMatchScreenState extends State<ListMatchScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 65,
          surfaceTintColor: whiteColor,
          backgroundColor: whiteColor,
          automaticallyImplyLeading: false,
          title: Center(
            child: Text(
              'Создай свой прогноз',
              style: theme.titleSmall,
            ),
          ),
          // другие настройки flexibleSpace
        ),
        body: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 18,
              ),
            ),
            ListTitleWidget()
          ],
        ));
  }
}
