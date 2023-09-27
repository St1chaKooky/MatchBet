// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';

import 'package:match_bet/repositories/methods/api_methods/api_methods.dart';
import 'package:meta/meta.dart';

part 'league_list_event.dart';
part 'league_list_state.dart';

class LeagueListBloc extends Bloc<LeagueListEvent, LeagueListState> {
  LeagueListBloc(this.apiMethods) : super(LeagueListInitial()) {
    on<LoadLeagueList>((event, emit) async {
      final leagueList = await apiMethods.getLegueMap(
          false); // тут получаем отсортированый масив лиг, в каждом подмасиве матчи относящиеся к одной лиге
      emit(LeagueListLoaded(
          leagueList:
              leagueList)); //когда загрузился listLeague мы может выдать что загрузка заверешена
    });
  }
  final ApiMethods apiMethods;
}
