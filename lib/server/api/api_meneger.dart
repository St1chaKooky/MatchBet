import 'dart:convert';

import 'package:http/http.dart';
import 'package:match_bet/server/leagues/leagues_model.dart';

class ApiSoccer {
  final dynamic apiUrl = 'https://v3.football.api-sports.io/fixtures?live=all';

  static const headers = {
    'x-rapidapi-host': "v3.football.api-sports.io",
    'x-rapidapi-key': '226d4ca9c02a2c65786d14b10ea0f756',
  };
  Future<List<SoccerMatch>> getAllMatches() async {
    Response res = await get(apiUrl, headers: headers);
    var body;
    if (res.statusCode == 200) {
      body = jsonDecode(res.body);
      List<dynamic> matchList = body['response'];
      print("Api servise:${body}");
      List<SoccerMatch> matches =
          matchList.map((dynamic item) => SoccerMatch.fromJson(item)).toList();
      return matches;
    } else
      return [];
  }
}
