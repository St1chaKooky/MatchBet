import 'package:dio/dio.dart';

class ApiMeneger {
  final Dio dio = Dio();

  Future<void> getApi() async {
    dio.options.headers = {
      'x-rapidapi-host': 'v3.football.api-sports.io',
      'x-rapidapi-key': '226d4ca9c02a2c65786d14b10ea0f756',
    };
    final response = await dio.get(
      'https://v3.football.api-sports.io/fixtures?live=all',
      queryParameters: {'live': 'all'},
    );
    print(response.data);
  }
}
