import 'package:match_bet/models/bets/bookmakers.dart';

class ResponseModel {
  League? league;
  League? fixture;
  String? update;
  List<Bookmakers>? bookmakers;

  ResponseModel({this.league, this.fixture, this.update, this.bookmakers});

  ResponseModel.fromJson(Map<String, dynamic> json) {
    league = json['league'] != null ? League.fromJson(json['league']) : null;
    fixture = json['fixture'] != null ? League.fromJson(json['fixture']) : null;
    update = json['update'];
    bookmakers = json['bookmakers'] != null
        ? List<Bookmakers>.from(
            json['bookmakers'].map((x) => Bookmakers.fromJson(x)))
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (league != null) {
      data['league'] = league!.toJson();
    }
    if (fixture != null) {
      data['fixture'] = fixture!.toJson();
    }
    data['update'] = update;
    if (bookmakers != null) {
      data['bookmakers'] = bookmakers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class League {
  League.fromJson(Map<String, dynamic> json);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    return data;
  }
}
