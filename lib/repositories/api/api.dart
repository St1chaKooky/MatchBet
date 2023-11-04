import 'package:dio/dio.dart';
import 'package:match_bet/models/bets/response.dart';
import 'package:match_bet/models/bets/response_model.dart';
import 'package:match_bet/models/matches/match_model.dart';
import 'package:match_bet/models/matches/response_model.dart';

import 'package:match_bet/repositories/methods/algortm/date.dart';

class ApiMeneger {
  bool live;
  ApiMeneger({required this.live});
  final Dio dio = Dio();
  final String date = DataNow().getData();
  String get apiUrl => live
      ? 'https://v3.football.api-sports.io/fixtures?live=all'
      : "https://v3.football.api-sports.io/fixtures?date=$date";

  Future<List<MatchModel>> getApi() async {
    dio.options.headers = {
      'x-rapidapi-host': 'v3.football.api-sports.io',
      'x-rapidapi-key': '226d4ca9c02a2c65786d14b10ea0f756',
    };

    try {
      final response = await dio.get(apiUrl,
          queryParameters: live ? {'live': 'all'} : {'date': date});

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
      print('Ошибка при загрузке данных матчей: $error');
    }

    return [];
  }
}

class ApiMatch {
  final Dio dio = Dio();

  Future<MatchModel> getMatch(id) async {
    String apiUrl = "https://v3.football.api-sports.io/fixtures?id=$id";
    dio.options.headers = {
      'x-rapidapi-host': 'v3.football.api-sports.io',
      'x-rapidapi-key': '226d4ca9c02a2c65786d14b10ea0f756',
    };
    try {
      final response = await dio.get(apiUrl, queryParameters: {'id': '$id'});
      if (response.statusCode == 200) {
        final responseData = response.data;
        if (responseData is Map<String, dynamic>) {
          final myResponse = MyResponse.fromJson(responseData);
          final matchModels = myResponse.response;
          if (matchModels != null && matchModels.isNotEmpty) {
            // Возвращаем первый элемент, так как предполагается, что это будет единственный матч с указанным id
            return matchModels[0];
          }
        }
      }
    } catch (err) {
      print('Ошибка при загрузке информации матча ${err}');
    }
    return MatchModel(); // Возвращаем null в случае ошибки или отсутствия матча
  }
}

class ApiBet {
  final Dio dio = Dio();
  Future<List<ResponseModel>?> getBet(id) async {
    String apiUrl =
        'https://v3.football.api-sports.io/odds?fixture=$id'; // id преобразован в строку
    dio.options.headers = {
      'x-rapidapi-host': 'v3.football.api-sports.io',
      'x-rapidapi-key': '226d4ca9c02a2c65786d14b10ea0f756',
    };
    try {
      final response = await dio.get(apiUrl); // Убран queryParameters
      if (response.statusCode == 200) {
        final responseData = response.data;
        if (responseData is Map<String, dynamic>) {
          final myResponse = Responsee.fromJson(responseData);
          final betModels = myResponse.response;
          if (betModels == []) {
            return [];
          } // вывод
          return betModels;
        }
      }
    } catch (err) {
      print('Ошибка получения информации ставки ${err}');
    }
    return [];
  }
}
