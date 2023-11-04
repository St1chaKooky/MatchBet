class Teams {
  TeamHome? home;
  TeamAway? away;

  Teams({this.home, this.away});

  Teams.fromJson(Map<String, dynamic> json) {
    home = json['home'] != null ? TeamHome.fromJson(json['home']) : null;
    away = json['away'] != null ? TeamAway.fromJson(json['away']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (home != null) {
      data['home'] = home!.toJson();
    }
    if (away != null) {
      data['away'] = away!.toJson();
    }
    return data;
  }
}

class TeamHome {
  int? id;
  String? name;
  String? logo;
  bool? winner;

  TeamHome({this.id, this.name, this.logo, this.winner});

  TeamHome.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    logo = json['logo'];
    winner = json['winner'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['logo'] = logo;
    data['winner'] = winner;
    return data;
  }
}

class TeamAway {
  int? id;
  String? name;
  String? logo;
  bool? winner;

  TeamAway({this.id, this.name, this.logo, this.winner});

  TeamAway.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    logo = json['logo'];
    winner = json['winner'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['logo'] = logo;
    data['winner'] = winner;
    return data;
  }
}
