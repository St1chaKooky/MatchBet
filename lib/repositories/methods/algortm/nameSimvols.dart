class NameSimvols {
  String? name;

  NameSimvols({required this.name});

  String? getName() {
    String? mainName = name;
    if (mainName != null) {
      if (mainName.length >= 7) {
        return '${mainName.substring(0, 7)}..'; // Используйте метод substring для получения первых 10 символов
      } else {
        return mainName;
      }
    }
    return ''; // Возвращайте null, если name равен null
  }
}
