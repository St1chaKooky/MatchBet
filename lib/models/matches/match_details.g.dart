// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MatchDetail _$MatchDetailFromJson(Map<String, dynamic> json) => MatchDetail(
      id: json['id'] as String,
      country: json['country'] as String,
      nameLeague: json['nameLeague'] as String,
      date: json['date'] as String,
      home: json['home'] as String,
      away: json['away'] as String,
      homeLogo: json['homeLogo'] as String,
      awayLogo: json['awayLogo'] as String,
      winHome: json['winHome'] as String,
      winaAway: json['winaAway'] as String,
      draw: json['draw'] as String,
      chanceHome: json['chanceHome'] as String,
      chanceAway: json['chanceAway'] as String,
      chanceDraw: json['chanceDraw'] as String,
    );

Map<String, dynamic> _$MatchDetailToJson(MatchDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'country': instance.country,
      'nameLeague': instance.nameLeague,
      'date': instance.date,
      'home': instance.home,
      'away': instance.away,
      'homeLogo': instance.homeLogo,
      'awayLogo': instance.awayLogo,
      'winHome': instance.winHome,
      'winaAway': instance.winaAway,
      'draw': instance.draw,
      'chanceHome': instance.chanceHome,
      'chanceAway': instance.chanceAway,
      'chanceDraw': instance.chanceDraw,
    };
