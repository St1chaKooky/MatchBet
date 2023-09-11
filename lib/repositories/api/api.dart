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

    if (response.statusCode == 200) {
      // Декодируйте JSON-ответ

      // Получите данные из поля "response"
      final responseList = response.data['response'];

      // responseList теперь содержит список данных из поля "response"
      // Вы можете обработать этот список данных по вашему усмотрению

      // Пример: Вывести в консоль длину списка и первый элемент
      print("Длина списка response: ${responseList.length}");
      if (responseList.isNotEmpty) {
        print("Первый элемент: ${responseList[0]}");
      }
    } else {
      // Обработка ошибки, если не получен статус код 200
      print('Ошибка: ${response.statusCode}');
    }
  }
}
