import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:match_bet/bloc/bloc_matches/live_matches_bloc/live_bloc.dart';

import 'package:match_bet/repositories/methods/algortm/date.dart';
import 'package:match_bet/repositories/methods/api_methods/api_methods.dart';
import 'package:match_bet/utils/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../router/router.dart';

class ListTitleLiveWidget extends StatefulWidget {
  ListTitleLiveWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<ListTitleLiveWidget> createState() => _ListTitleLiveWidgetState();
}

class _ListTitleLiveWidgetState extends State<ListTitleLiveWidget> {
  late LiveBloc _leagueListBloc; // Переменную объявляем здесь

  @override
  void initState() {
    super.initState();
    _leagueListBloc = LiveBloc(ApiMethods()); // Инициализируем здесь
    _leagueListBloc.add(LoadLive());
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocBuilder<LiveBloc, LiveState>(
      bloc: _leagueListBloc,
      builder: (context, state) {
        if (state is LiveLoaded) {
          return SliverList.builder(
              itemCount: state.leagueList.length,
              itemBuilder: (context, i) {
                // Список наших моделей, [fixture, legue...]
                final listMatches = state
                    .leagueList[i]; // Список наших моделей, [fixture, legue...]
                final leagueName = listMatches.isNotEmpty
                    ? listMatches.first.league?.name
                    : ' ';
                String limitedName = leagueName!.length > 18
                    ? "${leagueName.substring(0, 18)}..."
                    : leagueName; // Иначе оставляем строку без изменений
                final leagueCountry = listMatches.isNotEmpty
                    ? listMatches.first.league?.country
                    : ' ';
                final leagueFlag = listMatches.isNotEmpty
                    ? listMatches.first.league?.flag ?? ' '
                    : ' ';

                List<_MatchList> listWidgets = [];
                for (int i = 0; i < listMatches.length; i++) {
                  String home = '';
                  String away = '';
                  String time = '';
                  String date = '';
                  int id = 0;
                  if (listMatches[i].teams?.home?.name != null &&
                      listMatches[i].teams?.away?.name != null) {
                    home = listMatches[i].teams!.home!.name!;
                    away = listMatches[i].teams!.away!.name!;
                  }
                  if (listMatches[i].fixture?.id != null) {
                    id = listMatches[i].fixture!.id!;
                  }
                  if (listMatches[i].fixture?.date != null) {
                    time = listMatches[i].fixture!.date!;
                    date = DataMatch(match: true).getData(time);
                  }
                  listWidgets.add(_MatchList(
                    homeName: home,
                    awayName: away,
                    time: date,
                    id: id,
                  ));
                }
                return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10)
                        .copyWith(bottom: 10),
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
                        leagueFlag != ' '
                            ? SvgPicture.network(
                                leagueFlag,
                                width: 25,
                                height: 25,
                                placeholderBuilder: (BuildContext context) =>
                                    SizedBox(
                                  width: 15, // Установите желаемую ширину
                                  height: 15, // Установите желаемую высоту
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    color: primaryColor,
                                  ),
                                ),
                              )
                            : Container(),
                        const SizedBox(
                          width: 15,
                        ),
                        Text(
                          '$leagueCountry. $limitedName',
                          style: theme.textTheme.labelSmall,
                        ),
                      ]),
                      children: listWidgets,
                    ));
              });
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

class _MatchList extends StatefulWidget {
  final String homeName;
  final String awayName;
  final String time;
  final int id;

  const _MatchList({
    required this.homeName,
    required this.awayName,
    required this.time,
    required this.id,
  });

  @override
  State<_MatchList> createState() => _MatchListState();
}

class _MatchListState extends State<_MatchList> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        AutoRouter.of(context).push(MatchRoute(id: widget.id));
      },
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
        child: Row(
          children: [
            const SizedBox(
              width: 15,
            ),
            Text(widget.time),
            const SizedBox(
              width: 15,
            ),
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.homeName),
                  Text(widget.awayName),
                ]),
          ],
        ),
      ),
    );
  }
}
