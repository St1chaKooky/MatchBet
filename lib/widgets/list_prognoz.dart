import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:match_bet/utils/colors.dart';

import '../router/router.dart';

class ListPrognozWidget extends StatelessWidget {
  const ListPrognozWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10).copyWith(bottom: 10),
      child: Container(
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(10),
        ),
        height: 200,
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(children: [
            GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                AutoRouter.of(context).push(PrognozRoute());
              },
              child: Column(
                children: [
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
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () => print('like'),
                      child: SvgPicture.asset(
                        'images/like.svg',
                        width: 22,
                        height: 22,
                      ),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    Text(
                      '68%',
                      style: theme.labelMedium,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: () => print('dizlike'),
                      child: SvgPicture.asset(
                        'images/dizlike.svg',
                        width: 22,
                        height: 22,
                      ),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    Text(
                      '32%',
                      style: theme.labelMedium,
                    ),
                  ],
                ),
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    AutoRouter.of(context).push(PrognozRoute());
                  },
                  child: Text(
                    'Читать дальше',
                    style: theme.labelMedium,
                  ),
                )
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
