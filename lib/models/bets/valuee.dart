class Valuee {
  int? value;
  String? odd;

  Valuee({this.value, this.odd});

  Valuee.fromJson(Map<String, dynamic> json) {
    value =
        json['value'] != null ? int.tryParse(json['value'].toString()) : null;
    odd = json['odd'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['value'] = value;
    data['odd'] = odd;
    return data;
  }
}
