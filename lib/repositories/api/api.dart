import 'package:dio/dio.dart';
import '../../models/matches/response_model.dart';

class ApiMeneger {
  final Dio dio = Dio();
  final String apiUrl = 'https://v3.football.api-sports.io/fixtures?live=all';

  Future<Object> getApi() async {
    dio.options.headers = {
      'x-rapidapi-host': 'v3.football.api-sports.io',
      'x-rapidapi-key': '226d4ca9c02a2c65786d14b10ea0f756',
    };

    try {
      final response = await dio.get(apiUrl, queryParameters: {'live': 'all'});

      if (response.statusCode == 200) {
        final responseData = response.data;
        if (responseData is Map<String, dynamic>) {
          final myResponse = MyResponse.fromJson(
              responseData); //получаем наш джсон в виде обьекта
          return myResponse;
        }
      }
    } catch (error) {
      print('Ошибка при загрузке данных: $error');
    }

    return {};
  }
}
