import 'package:match_bet/models/bets/bet.dart';

class Bookmakers {
  int? id;
  String? name;
  List<Bet>? bets;

  Bookmakers({this.id, this.name, this.bets});

  Bookmakers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    bets = json['bets'] != null
        ? List<Bet>.from(json['bets'].map((x) => Bet.fromJson(x)))
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    if (bets != null) {
      data['bets'] = bets!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
