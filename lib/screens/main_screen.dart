

import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../widgets/button_litle.dart';
import '../widgets/list_prognoz.dart';
import '../widgets/list_title.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool f = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: whiteColor,
        actions: const [],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
        child: Column(
          children: [
            Container(),
            Row(
              children: [
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
            const SizedBox(
              height: 15,
            ),
            ListPrognozWidget(),
            Expanded(
              child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, i) => const Padding(
                        padding: EdgeInsets.only(bottom: 8),
                        child: ListTitleWidget(),
                      )),
            )
          ],
        ),
      ),
    );
  }
}
