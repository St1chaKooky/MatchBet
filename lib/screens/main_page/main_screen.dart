import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:match_bet/bloc/league/league_list_bloc.dart';
import 'package:match_bet/bloc/live/live_bloc.dart';
import 'package:match_bet/repositories/methods/api_methods/api_methods.dart';
import 'package:match_bet/widgets/list_title_live.dart';
import '../../utils/colors.dart';
import '../../widgets/button_litle.dart';
import '../../widgets/input.dart';
import '../../widgets/list_prognoz.dart';
import '../../widgets/list_title_league.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _allleagueListBloc = LeagueListBloc(ApiMethods());
  final _liveleagueListBloc = LiveBloc(ApiMethods());

// Переменная для хранения результата асинхронной операции

  int index = 0;

  @override
  void initState() {
    super.initState();
    _allleagueListBloc.add(LoadLeagueList());
    _liveleagueListBloc.add(LoadLive());
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

          title: Center(
            child: index == 0
                ? Text(
                    'Прогнозы',
                    style: theme.titleSmall,
                  )
                : Text(
                    'Все матчи',
                    style: theme.titleSmall,
                  ),
          ),
          // другие настройки flexibleSpace

          elevation: 0,
        ),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 18,
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: TextFieldInput(
              hintText: 'Введите название матча',
              textInputType: TextInputType.name,
              color: whiteColor,
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 18,
          ),
        ),
        SliverToBoxAdapter(
          child: Row(
            children: [
              const SizedBox(
                width: 18,
              ),
              ButtonLitleWidget(
                onTap: () => setState(() {
                  index = 0;
                }),
                buttonText: 'Прогнозы',
                colorFill: index == 0 ? primaryColor : whiteColor,
                colorText: index == 0 ? whiteColor : textColor,
              ),
              const SizedBox(
                width: 10,
              ),
              ButtonLitleWidget(
                onTap: () => setState(() {
                  index = 1;
                  ApiMethods().getMatchDetails(1037713);
                }),
                buttonText: 'Матчи',
                colorFill: index == 1 ? primaryColor : whiteColor,
                colorText: index == 1 ? whiteColor : textColor,
              ),
              const SizedBox(
                width: 10,
              ),
              ButtonLitleWidget(
                onTap: () => setState(() {
                  index = 2;
                  ApiMethods().getMatchDetails(1037713);
                }),
                buttonText: 'Live',
                colorFill: index == 2 ? primaryColor : whiteColor,
                colorText: index == 2 ? whiteColor : textColor,
              ),
            ],
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 18,
          ),
        ),
        index == 0
            ? SliverList.builder(
                itemCount: 10,
                itemBuilder: (context, i) {
                  return ListPrognozWidget();
                },
              )
            : index == 1
                ? BlocBuilder<LeagueListBloc, LeagueListState>(
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
                : BlocBuilder<LiveBloc, LiveState>(
                    bloc: _liveleagueListBloc,
                    builder: (context, state) {
                      if (state is LiveLoaded) {
                        print(2);

                        return ListTitleLiveWidget();
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
