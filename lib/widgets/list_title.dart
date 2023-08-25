import 'package:flutter/material.dart';
import 'package:match_bet/utils/colors.dart';

class ListTitleWidget extends StatelessWidget {
  const ListTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 18).copyWith(bottom: 15),
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(7),
        ),
        child: ExpansionTile(
          collapsedIconColor: bottomBarColor,
          iconColor: primaryColor,
          collapsedShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
                7), // Устанавливаем радиус границы как ноль
            side: const BorderSide(
                color: Colors
                    .transparent), // Устанавливаем прозрачный цвет границы
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
                7), // Устанавливаем радиус границы как ноль
            side: const BorderSide(
                color: Colors
                    .transparent), // Устанавливаем прозрачный цвет границы
          ),
          backgroundColor: whiteColor,
          tilePadding: const EdgeInsets.symmetric(horizontal: 18),
          // childrenPadding: const EdgeInsets.symmetric(horizontal: 18),
          title: Row(children: [
            Image.asset(
              'images/argentina.png',
            ),
            const SizedBox(
              width: 15,
            ),
            Text(
              'Аргентина. Кубок. 1/16 финалаgg',
              style: theme.textTheme.labelSmall,
            )
          ]),
          children: [
            _MatchList(),
            _MatchList(),
            _MatchList(),
          ],
        ));
  }
}

class _MatchList extends StatelessWidget {
  const _MatchList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => print('lalal'),
      child: Container(
        height: 55,
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Colors.grey, // Цвет обводки
              width: 0.5, // Толщина обводки
            ),
          ),
        ),
        child: const Row(
          children: [
            SizedBox(
              width: 15,
            ),
            Text('21:00'),
            SizedBox(
              width: 15,
            ),
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text('Лос-Андес-резерв'),
              Text('Лос-Андес-резерв'),
            ]),
          ],
        ),
      ),
    );
  }
}
