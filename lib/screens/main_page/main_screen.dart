import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:match_bet/components_lists/list_title_live.dart';
import '../../utils/colors.dart';
import '../../widgets/button_litle.dart';
import '../../components_lists/list_prognoz.dart';
import '../../components_lists/list_title_league.dart';

@RoutePage()
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int index = 0;
  @override
  void initState() {
    super.initState();
  }

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
            child: index == 0
                ? Text(
                    'Прогнозы',
                    style: theme.titleSmall,
                  )
                : Text(
                    'Все матчи',
                    style: theme.titleSmall,
                  ),
          ),
          // другие настройки flexibleSpace
        ),
        body: CustomScrollView(
          slivers: [
            // const SliverToBoxAdapter(
            //   child: SizedBox(
            //     height: 18,
            //   ),
            // ),
            // SliverToBoxAdapter(
            //   child: Padding(
            //     padding: const EdgeInsets.symmetric(horizontal: 18),
            //     child: TextFieldInput(
            //       hintText: 'Введите название матча',
            //       textInputType: TextInputType.name,
            //       color: whiteColor,
            //       textEditingController: TextEditingController(),
            //     ),
            //   ),
            // ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 10,
              ),
            ),
            SliverToBoxAdapter(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    const SizedBox(
                      width: 18,
                    ),
                    ButtonLitleWidget(
                      onTap: () => setState(() {
                        index = 0;
                      }),
                      buttonText: 'Прогнозы',
                      colorFill: index == 0 ? primaryColor : whiteColor,
                      colorText: index == 0 ? whiteColor : textColor,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    ButtonLitleWidget(
                      onTap: () => setState(() {
                        index = 1;
                      }),
                      buttonText: 'Матчи',
                      colorFill: index == 1 ? primaryColor : whiteColor,
                      colorText: index == 1 ? whiteColor : textColor,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    ButtonLitleWidget(
                      onTap: () => setState(() {
                        index = 2;
                      }),
                      buttonText: 'Live',
                      colorFill: index == 2 ? primaryColor : whiteColor,
                      colorText: index == 2 ? whiteColor : textColor,
                    ),
                    const SizedBox(
                      width: 18,
                    ),
                  ],
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 10,
              ),
            ),
            index == 0
                ? ListPrognozWidget()
                : index == 1
                    ? ListTitleWidget()
                    : ListTitleLiveWidget()
          ],
        ));
  }
}
