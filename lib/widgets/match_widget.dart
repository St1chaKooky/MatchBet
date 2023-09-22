import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:match_bet/bloc/match/match_bloc.dart';
import 'package:match_bet/repositories/methods/api_methods/api_methods.dart';

import '../router/router.dart';
import '../utils/colors.dart';
import 'button_litle.dart';

class MatchWidget extends StatefulWidget {
  MatchWidget({Key? key, required this.theme, required this.id})
      : super(key: key);
  final int id;
  final TextTheme theme;

  @override
  State<MatchWidget> createState() => _MatchWidgetState();
}

class _MatchWidgetState extends State<MatchWidget> {
  late MatchBloc _matchBloc;
  // Переменную объявляем здесь
  @override
  void initState() {
    super.initState();
    _matchBloc = MatchBloc(ApiMethods(), widget.id); // Инициализируем здесь
    _matchBloc.add(LoadMatch());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MatchBloc, MatchState>(
      bloc: _matchBloc,
      builder: (context, state) {
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
                  style: widget.theme.bodySmall,
                ),
                Text(
                  '15.08 - 23:00',
                  style: widget.theme.labelMedium,
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
                          style: widget.theme.headlineSmall,
                        ),
                      ],
                    ),
                    Text(
                      'vs',
                      style: widget.theme.bodyLarge,
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
                          style: widget.theme.headlineSmall,
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
                        style: widget.theme.bodyMedium,
                      ),
                      Text(
                        'Ничья 18%',
                        style: widget.theme.bodyMedium,
                      ),
                      Text(
                        'Монца 11%',
                        style: widget.theme.bodyMedium,
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
                        AutoRouter.of(context).popAndPush((MainRoute()));
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
                          style: widget.theme.labelMedium,
                        ),
                        Text(
                          '8.95',
                          style: widget.theme.labelMedium,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          'Ничья',
                          style: widget.theme.labelMedium,
                        ),
                        Text(
                          '8.95',
                          style: widget.theme.labelMedium,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          'П2',
                          style: widget.theme.labelMedium,
                        ),
                        Text(
                          '8.95',
                          style: widget.theme.labelMedium,
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
