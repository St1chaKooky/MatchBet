import 'package:match_bet/models/bets/valuee.dart';

class Bet {
  int? id;
  String? name;
  List<Valuee>? values;

  Bet({this.id, this.name, this.values});

  factory Bet.fromJson(Map<String, dynamic> json) {
    return Bet(
      id: json['id'],
      name: json['name'],
      values: json['values'] != null
          ? List<Valuee>.from(json['values'].map((x) => Valuee.fromJson(x)))
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    if (values != null) {
      data['values'] = values!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
