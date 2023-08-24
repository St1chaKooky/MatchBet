import 'package:flutter/material.dart';
import 'package:match_bet/utils/colors.dart';

class ListTitleWidget extends StatelessWidget {
  const ListTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: double.infinity,
      height: 58,
      margin: const EdgeInsets.symmetric(horizontal: 18).copyWith(bottom: 15),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(7),
      ),
      child: Row(children: [
        const SizedBox(
          width: 12,
        ),
        Image.asset(
          'images/arow.png',
          color: bottomBarColor,
        ),
        const SizedBox(
          width: 12,
        ),
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
    );
  }
}
