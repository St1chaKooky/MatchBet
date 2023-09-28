import 'package:match_bet/models/bets/bet.dart';
import 'package:match_bet/models/matches/response_models/match_model.dart';

import '../../api/api.dart';

class ApiMethods {
  Future<List<List<MatchModel>>> getLegueMap(live) async {
    try {
      final matchModels = await ApiMeneger(live: live)
          .getApi(); //получаем наш джсон в виде List<List>
      var matchesByLeague = <int, List<MatchModel>>{};
      for (var matchModel in matchModels) {
        final league = matchModel.league;

        if (league != null) {
          int? leagueId = league.id;
          // Проверяем, существует ли уже подмассив для данной лиги
          if ((matchesByLeague[leagueId] == null) && (leagueId != null)) {
            // Если нет, создаем новый пустой подмассив
            matchesByLeague[leagueId] = [];
          }
          // Добавляем текущий матч в подмассив для данной лиги

          matchesByLeague[leagueId]!.add(matchModel);
          // Используем безопасное приведение типа
        }
      }
      var result = matchesByLeague.values.toList();
      return result;
    } catch (error) {
      print('Ошибка при загрузке данных: $error');
    }
    return []; // Возвращаем пустой список по умолчанию
  }

  Future<MatchModel> getMatchDetails(id) async {
    try {
      final matchModel = await ApiMatch().getMatch(id);

      return matchModel;
    } catch (err) {
      print('Err : ${err}');
    }
    return MatchModel();
  }

  Future<List<Bet>> getBets(id) async {
    try {
      final betModel = await ApiBet().getBet(id);
      final bookmakers = betModel.bookmakers![0]; //[id,name,bets]
      final List<Bet> bets = bookmakers.bets!; //bets[{},{},{}..]
      return bets;
    } catch (err) {
      print('Api Methods Error: ${err}');
    }
    return [];
  }
}
