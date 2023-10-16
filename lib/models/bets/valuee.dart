class Valuee {
  dynamic value; // Теперь тип данных - dynamic
  String? odd;

  Valuee({this.value, this.odd});

  Valuee.fromJson(Map<String, dynamic> json) {
    if (json['value'] is int) {
      value = json['value'].toString(); // Преобразуем int в строку
    } else {
      value = json['value']; // Оставляем строку как есть
    }
    odd = json['odd'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['value'] = value;
    data['odd'] = odd;
    return data;
  }
}
