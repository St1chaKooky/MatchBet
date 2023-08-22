import 'package:flutter/material.dart';
import 'package:match_bet/utils/colors.dart';

class ListPrognozWidget extends StatelessWidget {
  const ListPrognozWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: whiteColor,
      height: 340,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(children: [
          Row(
            children: [
              Row(
                children: [
                  Container(
                    color: blackColor,
                    width: 30,
                    height: 30,
                  ),
                  Text('Иосиф Сталин'),
                ],
              ),
              Text('Рейтинг'),
            ],
          ),
          Row(
            children: [
              Column(
                children: [Text('Интер'), Text('Монца')],
              ),
              Column(
                children: [
                  Text('Сегодня'),
                  Text('11:00'),
                ],
              )
            ],
          ),
          Row(
            children: [
              Column(
                children: [
                  Text('Прогноз'),
                  Text('ТМ1.5'),
                ],
              ),
              Container(
                color: blackColor,
                width: 50,
                height: 30,
              )
            ],
          ),
          Row(
            children: [
              Row(
                children: [
                  Container(
                    color: blackColor,
                    width: 30,
                    height: 30,
                  ),
                  Container(
                    color: blackColor,
                    width: 30,
                    height: 30,
                  ),
                ],
              ),
              Text('Читать дальше')
            ],
          ),
        ]),
      ),
    );
  }
}
