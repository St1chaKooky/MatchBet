import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../router/router.dart';
import '../utils/colors.dart';
import 'button_litle.dart';

class MatchWidget extends StatelessWidget {
  const MatchWidget({Key? key, required this.theme}) : super(key: key);

  final TextTheme theme;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 410,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: whiteColor),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              'Аргентина. Кубок. 1/16 финала',
              style: theme.bodySmall,
            ),
            Text(
              '15.08 - 23:00',
              style: theme.labelMedium,
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      color: bottomBarColor,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Интер',
                      style: theme.headlineSmall,
                    ),
                  ],
                ),
                Text(
                  'vs',
                  style: theme.bodyLarge,
                ),
                Column(
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      color: bottomBarColor,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Монца',
                      style: theme.headlineSmall,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 280,
              height: 8,
              color: primaryColor,
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: 280,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Интер 71%',
                    style: theme.bodyMedium,
                  ),
                  Text(
                    'Ничья 18%',
                    style: theme.bodyMedium,
                  ),
                  Text(
                    'Монца 11%',
                    style: theme.bodyMedium,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ButtonLitleWidget(
                  width: 150,
                  onTap: () {
                    AutoRouter.of(context).push(MyBetRoute());
                  },
                  buttonText: 'Составить прогноз',
                  colorFill: primaryColor,
                  colorText: whiteColor,
                ),
                SizedBox(
                  width: 20,
                ),
                ButtonLitleWidget(
                  width: 120,
                  onTap: () {
                    AutoRouter.of(context).push(MainRoute());
                  },
                  buttonText: 'Прогнозы',
                  colorFill: whiteColor,
                  colorText: primaryColor,
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text(
                      'П1',
                      style: theme.labelMedium,
                    ),
                    Text(
                      '8.95',
                      style: theme.labelMedium,
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'Ничья',
                      style: theme.labelMedium,
                    ),
                    Text(
                      '8.95',
                      style: theme.labelMedium,
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'П2',
                      style: theme.labelMedium,
                    ),
                    Text(
                      '8.95',
                      style: theme.labelMedium,
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
