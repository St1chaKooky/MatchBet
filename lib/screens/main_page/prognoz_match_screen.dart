import 'package:flutter/material.dart';
import 'package:match_bet/utils/colors.dart';
import 'package:match_bet/widgets/prognoz_match_widget.dart';

import '../../widgets/match_widget.dart';

import 'package:auto_route/auto_route.dart';

@RoutePage()
class PrognozScreen extends StatefulWidget {
  final String post;
  final int matchId;
  final String k;
  final String name;
  final String date;
  final String nameBet;
  final String team1;
  final String team2;
  final int like;
  final int dislike;
  final String? picture;
  const PrognozScreen({
    Key? key,
    required this.post,
    required this.matchId,
    required this.picture,
    required this.team1,
    required this.team2,
    required this.date,
    required this.k,
    required this.nameBet,
    required this.like,
    required this.dislike,
    required this.name,
  }) : super(key: key);

  @override
  State<PrognozScreen> createState() => _PrognozScreenState();
}

class _PrognozScreenState extends State<PrognozScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        toolbarHeight: 65,
        surfaceTintColor: whiteColor,
        backgroundColor: whiteColor,
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: Text(
          'Прогнозы',
          style: theme.titleSmall,
        ),
        // другие настройки flexibleSpace
      ),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10).copyWith(top: 18),
              sliver: SliverToBoxAdapter(
                child: PrognozMatchWidget(
                  post: widget.post,
                  picture: widget.picture,
                  team1: widget.team1,
                  team2: widget.team2,
                  date: widget.date,
                  k: widget.k,
                  like: widget.like,
                  nameBet: widget.nameBet,
                  dislike: widget.dislike,
                  name: widget.name,
                ),
              )),
          MatchWidget(
            id: widget.matchId,
            theme: theme,
          ),
        ],
      ),
    );
  }
}
