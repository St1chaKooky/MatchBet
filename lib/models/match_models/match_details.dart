import 'package:json_annotation/json_annotation.dart';

part 'match_details.g.dart';

@JsonSerializable()
class MatchDetail {
  String id;
  String country;
  String nameLeague;
  String date;
  String home;
  String away;
  String homeLogo;
  String awayLogo;
  String winHome;
  String winaAway;
  String draw;
  String chanceHome;
  String chanceAway;
  String chanceDraw;

  MatchDetail({
    required this.id,
    required this.country,
    required this.nameLeague,
    required this.date,
    required this.home,
    required this.away,
    required this.homeLogo,
    required this.awayLogo,
    required this.winHome,
    required this.winaAway,
    required this.draw,
    required this.chanceHome,
    required this.chanceAway,
    required this.chanceDraw,
  });
  factory MatchDetail.fromJson(Map<String, dynamic> json) =>
      _$MatchDetailFromJson(json);

  Map<String, dynamic> toJson() => _$MatchDetailToJson(this);
}
