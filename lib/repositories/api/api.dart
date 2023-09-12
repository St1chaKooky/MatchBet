import 'package:dio/dio.dart';
import '../../models/matches/response_list_model.dart';

class ApiMeneger {
  final Dio dio = Dio();
  final String apiUrl = 'https://v3.football.api-sports.io/fixtures?live=all';

  Future<List<ResponseListModel>> getApi() async {
    dio.options.headers = {
      'x-rapidapi-host': 'v3.football.api-sports.io',
      'x-rapidapi-key': '226d4ca9c02a2c65786d14b10ea0f756',
    };

    try {
      final response = await dio.get(apiUrl, queryParameters: {'live': 'all'});

      if (response.statusCode == 200) {
        final responsData = response.data['response'];
        if (responsData is List) {
          final List<ResponseListModel> responseList = responsData
              .map((json) => ResponseListModel.fromJson(json))
              .toList();
          print(responseList);
          return responseList;
        }
      } else {
        print('Ошибка: ${response.statusCode}');
      }
    } catch (error) {
      print('Ошибка при загрузке данных: $error');
    }

    // Если что-то пошло не так или данные не были успешно загружены, вернуть пустой список.
    return [];
  }
}
