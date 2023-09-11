import 'package:match_bet/models/matches/score_model.dart';
import 'package:match_bet/models/matches/tems_model.dart';

import 'fixture_model.dart';
import 'goals_model.dart';
import 'league_model.dart';

class ResponseMatchesModel {
  String? get;
  Parameters? parameters;
  List? errors;
  int? results;
  Paging? paging;
  List<ResponseListModel>? response;

  ResponseMatchesModel(
      {this.get,
      this.parameters,
      this.errors,
      this.results,
      this.paging,
      this.response});

  ResponseMatchesModel.fromJson(Map<String, dynamic> json) {
    get = json['get'];
    parameters = json['parameters'] != null
        ? Parameters.fromJson(json['parameters'])
        : null;
    errors = json['errors'];
    results = json['results'];
    paging = json['paging'] != null ? Paging.fromJson(json['paging']) : null;
    response = json['response'] != null
        ? List<ResponseListModel>.from(
            json['response'].map((x) => ResponseListModel.fromJson(x)))
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['get'] = get;
    if (parameters != null) {
      data['parameters'] = parameters!.toJson();
    }
    if (errors != null) {
      data['errors'] = errors!.toList();
    }
    data['results'] = results;
    if (paging != null) {
      data['paging'] = paging!.toJson();
    }
    if (response != null) {
      data['response'] = response!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Parameters {
  String? live;

  Parameters({this.live});

  Parameters.fromJson(Map<String, dynamic> json) {
    live = json['live'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['live'] = live;
    return data;
  }
}

class Paging {
  int? current;
  int? total;

  Paging({this.current, this.total});

  Paging.fromJson(Map<String, dynamic> json) {
    current = json['current'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['current'] = current;
    data['total'] = total;
    return data;
  }
}

class ResponseListModel {
  Fixture? fixture;
  League? league;
  Teams? teams;
  Goals? goals;
  Score? score;
  ResponseListModel(
      {this.fixture, this.league, this.teams, this.goals, this.score});

  factory ResponseListModel.fromJson(Map<String, dynamic> json) {
    return ResponseListModel(
      fixture:
          json['fixture'] != null ? Fixture.fromJson(json['fixture']) : null,
      league: json['league'] != null ? League.fromJson(json['league']) : null,
      teams: json['teams'] != null ? Teams.fromJson(json['teams']) : null,
      goals: json['goals'] != null ? Goals.fromJson(json['goals']) : null,
      score: json['score'] != null ? Score.fromJson(json['score']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (fixture != null) {
      data['fixture'] = fixture!.toJson();
    }
    if (league != null) {
      data['league'] = league!.toJson();
    }
    if (teams != null) {
      data['teams'] = teams!.toJson();
    }
    if (goals != null) {
      data['goals'] = goals!.toJson();
    }
    if (score != null) {
      data['score'] = score!.toJson();
    }
    return data;
  }
}
