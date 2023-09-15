import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:match_bet/models/matches/match_model.dart';
import 'package:match_bet/utils/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../router/router.dart';

class ListTitleWidget extends StatefulWidget {
  final String flag;
  final String country;
  final String nameLeague;
  final List<MatchModel> matchesList;
  const ListTitleWidget(
      {super.key,
      required this.flag,
      required this.country,
      required this.nameLeague,
      required this.matchesList});

  @override
  State<ListTitleWidget> createState() => _ListTitleWidgetState();
}

class _ListTitleWidgetState extends State<ListTitleWidget> {
  List<_MatchList> listWidgets = [];

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
            widget.flag != ' '
                ? SvgPicture.network(
                    widget.flag,
                    width: 25,
                    height: 25,
                    placeholderBuilder: (BuildContext context) => SizedBox(
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
              '${widget.country}. ${widget.nameLeague}',
              style: theme.textTheme.labelSmall,
            )
          ]),
          children: listWidgets,
        ));
  }
}

class _MatchList extends StatefulWidget {
  final String home;
  final String away;
  final String time;

  const _MatchList({
    super.key,
    required this.home,
    required this.away,
    required this.time,
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
        AutoRouter.of(context).push(MatchRoute());
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
