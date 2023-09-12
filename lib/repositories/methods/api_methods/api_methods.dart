class ApiMethods {
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
}