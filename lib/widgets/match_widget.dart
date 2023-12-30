import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:match_bet/bloc/bloc_matches/match_bloc/match_bloc.dart';

import 'package:match_bet/repositories/methods/algortm/date.dart';
import 'package:match_bet/repositories/methods/algortm/nameSimvols.dart';
import 'package:match_bet/repositories/methods/api_methods/api_methods.dart';

import '../router/router.dart';
import '../utils/colors.dart';
import 'button_litle.dart';

class MatchWidget extends StatefulWidget {
  final int id;
  const MatchWidget({
    Key? key,
    required this.theme,
    required this.id,
  }) : super(key: key);
  final TextTheme theme;

  @override
  State<MatchWidget> createState() => _MatchWidgetState();
}

class _MatchWidgetState extends State<MatchWidget> {
  late final MatchBloc bloc;
  @override
  void initState() {
    super.initState();
    bloc = MatchBloc(ApiMethods(), widget.id);
    bloc.add(LoadMatch());
    print(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MatchBloc, MatchState>(
      bloc: bloc,
      builder: (context, state) {
        if (state is MatchLoaded) {
          final response = state.matchModel;
          String title = '${response.league?.country}.${response.league?.name}';
          String date =
              DataMatch(match: true).getData('${response.fixture?.date}');

          String logoHome = state.matchModel.teams?.home?.logo ?? ' ';
          String logoAway = state.matchModel.teams?.away?.logo ?? ' ';
          String nameHome =
              '${NameSimvols(name: response.teams?.home?.name).getName()}';
          String nameAway =
              '${NameSimvols(name: response.teams?.away?.name).getName()}';

          return SliverPadding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10).copyWith(top: 18),
            sliver: SliverToBoxAdapter(
              child: Container(
                height: 410,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12), color: whiteColor),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        title,
                        style: widget.theme.bodySmall,
                      ),
                      Text(
                        date,
                        style: widget.theme.labelMedium,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                              child: WidgetHome(
                                  logoHome: logoHome,
                                  nameHome: nameHome,
                                  widget: widget)),
                          Text(
                            'vs',
                            style: widget.theme.bodyLarge,
                          ),
                          Expanded(
                              child: WidgetHome(
                                  logoHome: logoAway,
                                  nameHome: nameAway,
                                  widget: widget)),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: 280,
                        height: 8,
                        color: primaryColor,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
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
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ButtonLitleWidget(
                            width: 150,
                            onTap: () {
                              AutoRouter.of(context)
                                  .push(MyBetRoute(id: widget.id));
                            },
                            buttonText: 'Составить прогноз',
                            colorFill: primaryColor,
                            colorText: whiteColor,
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
              ),
            ),
          );
        }
        return SliverFillRemaining(
          child: Center(
            child: CircularProgressIndicator(
              strokeWidth: 2,
              color: primaryColor,
            ),
          ),
        );
      },
    );
  }
}

class WidgetHome extends StatelessWidget {
  const WidgetHome({
    super.key,
    required this.logoHome,
    required this.nameHome,
    required this.widget,
  });

  final String logoHome;
  final String nameHome;
  final MatchWidget widget;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          child: logoHome != ' '
              ? Image.network(
                  logoHome,
                  width: 25,
                  height: 25,
                )
              : CircularProgressIndicator(
                  strokeWidth: 2,
                  color: primaryColor,
                ),
          width: 52,
          height: 52,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          nameHome,
          style: widget.theme.headlineSmall,
        ),
      ],
    );
  }
}
