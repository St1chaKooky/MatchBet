import 'package:flutter/material.dart';
import 'package:match_bet/utils/colors.dart';

class PrognozWidget extends StatefulWidget {
  const PrognozWidget({super.key});

  @override
  State<PrognozWidget> createState() => _PrognozWidgetState();
}

var text =
    'Клуб в этом сезоне, по большому счету, подарил только 1 неплохой отрезок. Вернувшись, по сути, случайно, в квалификацию Лиги чемпионов (с 3-го места в прошлогодней Высшей Лиги Беларуси, благодаря наказанию и солигорского "Шахтера", и "Энергетику-БГУ" за "договорняки"), там "батоны" смогли выбить первого противника, "Партизани" (и то выиграли у него 2-0 после 1-1 в Албании).';
bool proverka() {
  if (text.isNotEmpty) {
    return true;
  } else {
    return false;
  }
}

class _PrognozWidgetState extends State<PrognozWidget> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Expanded(
      child: Container(
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
            TextField(
              maxLines: 10,
              decoration: InputDecoration(
                hintText: 'Enter your post...',
                hintStyle: TextStyle(color: textColor),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: inputColor)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                        8.0), // Закругление границы при фокусе
                    borderSide: BorderSide(
                        color:
                            inputColor) // Убираем границу, оставляя только закругления
                    ),
              ),
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
