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
            .response; // масив Моделей матча (.response означает что мы оброщаемся к полю респонс)
        print(matchModels);
        if (matchModels != null) {
          // Итерируемся по списку matchModels и выводим значения поля fixture
          for (var matchModel in matchModels) {
            final fixture = matchModel.fixture;
            if (fixture != null) {
              // Выводим значения полей fixture
              print('Fixture ID: ${fixture.id}');
              print('Referee: ${fixture.referee}');
              print('Timezone: ${fixture.timezone}');
              print('Date: ${fixture.date}');
              print('Periods: ${fixture.periods}');

              // Выводите остальные поля fixture по аналогии
              print('-----');
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
