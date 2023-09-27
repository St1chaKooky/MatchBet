class Score {
  Halftime? halftime;
  Fulltime? fulltime;
  Extratime? extratime;
  Penalty? penalty;

  Score({this.halftime, this.fulltime, this.extratime, this.penalty});

  Score.fromJson(Map<String, dynamic> json) {
    halftime =
        json['halftime'] != null ? Halftime.fromJson(json['halftime']) : null;
    fulltime =
        json['fulltime'] != null ? Fulltime.fromJson(json['fulltime']) : null;
    extratime = json['extratime'] != null
        ? Extratime.fromJson(json['extratime'])
        : null;
    penalty =
        json['penalty'] != null ? Penalty.fromJson(json['penalty']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (halftime != null) {
      data['halftime'] = halftime!.toJson();
    }
    if (fulltime != null) {
      data['fulltime'] = fulltime!.toJson();
    }
    if (extratime != null) {
      data['extratime'] = extratime!.toJson();
    }
    if (penalty != null) {
      data['penalty'] = penalty!.toJson();
    }
    return data;
  }
}

class Halftime {
  int? home;
  int? away;

  Halftime({this.home, this.away});

  Halftime.fromJson(Map<String, dynamic> json) {
    home = json['home'];
    away = json['away'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['home'] = home;
    data['away'] = away;
    return data;
  }
}

class Fulltime {
  int? home;
  int? away;

  Fulltime({this.home, this.away});

  Fulltime.fromJson(Map<String, dynamic> json) {
    home = json['home'];
    away = json['away'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['home'] = home;
    data['away'] = away;
    return data;
  }
}

class Extratime {
  int? home;
  int? away;

  Extratime({this.home, this.away});

  Extratime.fromJson(Map<String, dynamic> json) {
    home = json['home'];
    away = json['away'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['home'] = home;
    data['away'] = away;
    return data;
  }
}

class Penalty {
  int? home;
  int? away;

  Penalty({this.home, this.away});

  Penalty.fromJson(Map<String, dynamic> json) {
    home = json['home'];
    away = json['away'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['home'] = home;
    data['away'] = away;
    return data;
  }
}
