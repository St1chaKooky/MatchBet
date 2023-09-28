import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:match_bet/bloc/league/league_list_bloc.dart';
import 'package:match_bet/repositories/methods/api_methods/api_methods.dart';
import 'package:match_bet/widgets/list_title_league.dart';

import '../../utils/colors.dart';

@RoutePage()
class ListMatchScreen extends StatefulWidget {
  const ListMatchScreen({super.key});

  @override
  State<ListMatchScreen> createState() => _ListMatchScreenState();
}

class _ListMatchScreenState extends State<ListMatchScreen> {
  final _allleagueListBloc = LeagueListBloc(ApiMethods());

  @override
  void initState() {
    super.initState();
    _allleagueListBloc.add(LoadLeagueList());
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: 60,
          floating: false,
          backgroundColor: whiteColor,
          automaticallyImplyLeading: false,

          centerTitle: true,
          title: Text(
            'Создай свой прогноз',
            style: theme.titleSmall,
          ),
          // другие настройки flexibleSpace

          elevation: 0,
        ),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 18,
          ),
        ),
        BlocBuilder<LeagueListBloc, LeagueListState>(
          bloc: _allleagueListBloc,
          builder: (context, state) {
            if (state is LeagueListLoaded) {
              print(1);
              return ListTitleWidget();
            }
            return SliverToBoxAdapter(
              child: Center(
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: primaryColor,
                ),
              ),
            );
          },
        )
      ],
    ));
  }
}
