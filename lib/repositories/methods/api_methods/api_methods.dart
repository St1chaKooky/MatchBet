import 'package:match_bet/models/matches/match_model.dart';

import '../../api/api.dart';

class ApiMethods {
  Future<List<List<MatchModel>>> getLegueMap() async {
    try {
      final matchModels =
          await ApiMeneger().getApi(); //получаем наш джсон в виде обьекта
      var matchesByLeague = <int, List<MatchModel>>{};
      for (var matchModel in matchModels) {
        final league = matchModel.league;
        // final teams = matchModel.teams;
        // final goals = matchModel.goals;
        // final fixture = matchModel.fixture;
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
}
