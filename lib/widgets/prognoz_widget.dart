import 'package:flutter/material.dart';
import 'package:match_bet/utils/colors.dart';

class PrognozWidget extends StatelessWidget {
  const PrognozWidget({
    super.key,
    required this.theme,
  });

  final TextTheme theme;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Expanded(
      child: Container(
        // height: 400,
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: bottomBarColor,
                      radius: 13,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Иосиф Сталин',
                      style: theme.bodyMedium,
                    ),
                  ],
                ),
                Text(
                  'Рейтинг: 111 455',
                  style: theme.bodyMedium,
                ),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Интер',
                      style: theme.headlineSmall,
                    ),
                    Text('Монца', style: theme.headlineSmall)
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Сегодня',
                      style: theme.bodyMedium,
                    ),
                    Text(
                      '11:00',
                      style: theme.bodyMedium,
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Прогноз',
                      style: theme.bodySmall,
                    ),
                    Text(
                      'ТМ1.5',
                      style: theme.bodyLarge,
                    ),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: primaryColor),
                  width: 60,
                  height: 35,
                  child: Center(
                      child: Text(
                    '2.47',
                    style: TextStyle(
                        fontSize: 14,
                        color: whiteColor,
                        fontWeight: FontWeight.w400),
                  )),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Клуб в этом сезоне, по большому счету, подарил только 1 неплохой отрезок. Вернувшись, по сути, случайно, в квалификацию Лиги чемпионов (с 3-го места в прошлогодней Высшей Лиги Беларуси, благодаря наказанию и солигорского "Шахтера", и "Энергетику-БГУ" за "договорняки"), там "батоны" смогли выбить первого противника, "Партизани" (и то выиграли у него 2-0 после 1-1 в Албании).',
              style: theme.bodyLarge,
            ),
            const SizedBox(
              height: 12,
            ),
          ]),
        ),
      ),
    );
  }
}
