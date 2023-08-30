import 'package:flutter/material.dart';
import 'package:match_bet/utils/colors.dart';

import '../../widgets/button_litle.dart';

import '../../widgets/prognoz_widget.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class MyPublicationScreen extends StatefulWidget {
  MyPublicationScreen({Key? key}) : super(key: key);

  @override
  State<MyPublicationScreen> createState() => _MyPublicationScreenState();
}

class _MyPublicationScreenState extends State<MyPublicationScreen> {
  bool f = true;

  var text =
      'Клуб в этом сезоне, по большому счету, подарил только 1 неплохой отрезок. Вернувшись, по сути, случайно, в квалификацию Лиги чемпионов (с 3-го места в прошлогодней Высшей Лиги Беларуси, благодаря наказанию и солигорского "Шахтера", и "Энергетику-БГУ" за "договорняки"), там "батоны" смогли выбить первого противника, "Партизани" (и то выиграли у него 2-0 после 1-1 в Албании).';
  bool proverka() {
    if (text.length > 0)
      return true;
    else
      return false;
  }

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
  }

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
                'Добавь описание',
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
                ButtonLitleWidget(
                  onTap: () {},
                  buttonText: 'Опубликовать',
                  width: double.infinity,
                  colorFill: proverka() ? primaryColor : textColor,
                  colorText: whiteColor,
                  bigButton: true,
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
