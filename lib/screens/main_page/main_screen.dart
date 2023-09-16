import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:match_bet/bloc/league/league_list_bloc.dart';
import 'package:match_bet/repositories/methods/api_methods/api_methods.dart';
import '../../utils/colors.dart';
import '../../widgets/button_litle.dart';
import '../../widgets/input.dart';
import '../../widgets/list_prognoz.dart';
import '../../widgets/list_title.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _leagueListBloc = LeagueListBloc(ApiMethods());

// Переменная для хранения результата асинхронной операции

  bool f = true;

  @override
  void initState() {
    super.initState();
    _leagueListBloc.add(LoadLeagueList());
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
            child: f
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
                  f = true;
                }),
                buttonText: 'Прогнозы',
                colorFill: f ? primaryColor : whiteColor,
                colorText: f ? whiteColor : textColor,
              ),
              const SizedBox(
                width: 10,
              ),
              ButtonLitleWidget(
                onTap: () => setState(() {
                  f = false;
                }),
                buttonText: 'Матчи',
                colorFill: f ? whiteColor : primaryColor,
                colorText: f ? textColor : whiteColor,
              ),
              const SizedBox(
                width: 10,
              ),
            ],
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 18,
          ),
        ),
        f
            ? SliverList.builder(
                itemCount: 10,
                itemBuilder: (context, i) {
                  return ListPrognozWidget();
                },
              )
            : BlocBuilder<LeagueListBloc, LeagueListState>(
                bloc: _leagueListBloc,
                builder: (context, state) {
                  if (state is LeagueListLoaded) {
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
                })
      ],
    ));
  }
}
