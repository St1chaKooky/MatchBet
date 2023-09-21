import 'package:dio/dio.dart';
import 'package:match_bet/models/matches/match_model.dart';
import '../../models/matches/response_model.dart';

class ApiMeneger {
  bool live;
  ApiMeneger({required this.live});
  final Dio dio = Dio();
  String get apiUrl => live
      ? 'https://v3.football.api-sports.io/fixtures?live=all'
      : "https://v3.football.api-sports.io/fixtures?date=2023-09-17";

  Future<List<MatchModel>> getApi() async {
    dio.options.headers = {
      'x-rapidapi-host': 'v3.football.api-sports.io',
      'x-rapidapi-key': '226d4ca9c02a2c65786d14b10ea0f756',
    };

    try {
      final response = await dio.get(apiUrl,
          queryParameters: live ? {'live': 'all'} : {'date': '2023-09-15'});

      if (response.statusCode == 200) {
        final responseData = response.data;
        if (responseData is Map<String, dynamic>) {
          final myResponse = MyResponse.fromJson(
              responseData); //получаем наш джсон в виде обьекта
          final matchModels = myResponse
              .response; // масив Моделей матча [fixture,league,goals,score...] (.response означает что мы оброщаемся к полю респонс)
          if (matchModels != null) {
            return matchModels;
          } else {
            print('Список matchModels пуст');
          }
        }
      }
    } catch (error) {
      print('Ошибка при загрузке данных vcvc: $error');
    }

    return [];
  }
}
