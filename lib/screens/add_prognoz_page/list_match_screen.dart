import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../utils/colors.dart';
import '../../widgets/list_title_add.dart';

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
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: 60,
          floating: false,
          backgroundColor: whiteColor,
          automaticallyImplyLeading: false,

          centerTitle: true,
          title: Text(
            'Создай свой прогноз',
            style: theme.titleSmall,
          ),
          // другие настройки flexibleSpace

          elevation: 0,
        ),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 18,
          ),
        ),
        SliverList.builder(
            itemCount: 20,
            itemBuilder: (context, i) => const ListTitleWidgetAdd()),
      ],
    ));
  }
}
