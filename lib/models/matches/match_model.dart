import 'fixture_model.dart';
import 'goals_model.dart';
import 'league_model.dart';
import 'score_model.dart';
import 'tems_model.dart';

class MatchModel {
  Fixture? fixture;
  League? league;
  Teams? teams;
  Goals? goals;
  Score? score;
  MatchModel({this.fixture, this.league, this.teams, this.goals, this.score});

  factory MatchModel.fromJson(Map<String, dynamic> json) {
    return MatchModel(
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
