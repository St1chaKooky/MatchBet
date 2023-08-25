import 'package:flutter/material.dart';

import '../../utils/colors.dart';
import '../../widgets/button_litle.dart';
import '../../widgets/list_prognoz.dart';
import '../../widgets/list_title.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool f = true;

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
            child: f
                ? Text(
                    'Все матчи',
                    style: theme.titleSmall,
                  )
                : Text(
                    'Прогнозы',
                    style: theme.titleSmall,
                  ),
          ),
          // другие настройки flexibleSpace

          elevation: 0,
        ),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 18,
          ),
        ),
        SliverToBoxAdapter(
          child: Row(
            children: [
              const SizedBox(
                width: 18,
              ),
              ButtonLitleWidget(
                onTap: () => setState(() {
                  f = true;
                }),
                buttonText: 'Матчи',
                colorFill: f ? primaryColor : whiteColor,
                colorText: f ? whiteColor : textColor,
              ),
              const SizedBox(
                width: 10,
              ),
              ButtonLitleWidget(
                onTap: () => setState(() {
                  f = false;
                }),
                buttonText: 'Прогнозы',
                colorFill: f ? whiteColor : primaryColor,
                colorText: f ? textColor : whiteColor,
              ),
              const SizedBox(
                width: 50,
              ),
              const Text('Сегодня'),
            ],
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 18,
          ),
        ),
        SliverList.builder(
            itemCount: 20,
            itemBuilder: (context, i) =>
                f ? const ListTitleWidget() : const ListPrognozWidget()),
      ],
    ));
  }
}
