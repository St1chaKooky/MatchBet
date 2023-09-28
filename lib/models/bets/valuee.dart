class Valuee {
  String? value;
  String? odd;

  Valuee({this.value, this.odd});

  Valuee.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    odd = json['odd'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['value'] = value;
    data['odd'] = odd;
    return data;
  }
}
