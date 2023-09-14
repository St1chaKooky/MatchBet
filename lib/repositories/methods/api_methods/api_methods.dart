import 'package:match_bet/models/matches/match_model.dart';

import '../../../models/matches/response_model.dart';
import '../../api/api.dart';

class ApiMethods {
  Future<List<MatchModel>> getData() async {
    try {
      final myResponse =
          await ApiMeneger().getApi(); //получаем наш джсон в виде обьекта
      if (myResponse is MyResponse) {
        final matchModels = myResponse
            .response; // масив Моделей матча [fixture,league,goals,score...] (.response означает что мы оброщаемся к полю респонс)
        if (matchModels != null) {
          // Итерируемся по списку matchModels , каждый элемент это
          // {
          // "fixture": {},
          // "league": {},
          // "teams": {},
          // "goals": {},
          // "score": {}
          // }

          for (var matchModel in matchModels) {
            final league = matchModel.league;
            final teams = matchModel.teams;
            final goals = matchModel.goals;
            final fixture = matchModel.fixture;
            if (fixture != null) {
              // Выводим значения полей fixture
              print('ID: ${fixture.id}');
              print('Referee: ${fixture.referee}');
              print('Timezone: ${fixture.timezone}');
              print('Date: ${fixture.date}');
              print('Timestamp: ${fixture.timestamp}');
              print('Periods: ${fixture.periods}');
              print('Venue: ${fixture.venue}');
              print('Status: ${fixture.status}');
            }
          }
        } else {
          print('Список matchModels пуст');
        }
      } else {
        print('Ошибка: Не удалось получить данные');
      }
    } catch (error) {
      print('Ошибка при загрузке данных: $error');
    }
    return []; // Возвращаем пустой список по умолчанию
  }
}
