import 'match_model.dart';

class MyResponse {
  String? get;
  Parameters? parameters;
  List? errors;
  int? results;
  Paging? paging;
  List<MatchModel>? response;

  MyResponse(
      {this.get,
      this.parameters,
      this.errors,
      this.results,
      this.paging,
      this.response});

  MyResponse.fromJson(Map<String, dynamic> json) {
    get = json['get'];
    parameters = json['parameters'] != null
        ? Parameters.fromJson(json['parameters'])
        : null;
    errors = json['errors'];
    results = json['results'];
    paging = json['paging'] != null ? Paging.fromJson(json['paging']) : null;
    response = json['response'] != null
        ? List<MatchModel>.from(
            json['response'].map((x) => MatchModel.fromJson(x)))
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
