import 'package:match_bet/models/bets/response_model.dart';

class Responsee {
  String? get;
  Parameters? parameters;
  List? errors;
  int? results;
  Paging? paging;
  List<ResponseModel>? response;

  Responsee(
      {this.get,
      this.parameters,
      this.errors,
      this.results,
      this.paging,
      this.response});

  Responsee.fromJson(Map<String, dynamic> json) {
    get = json['get'];
    parameters = json['parameters'] != null
        ? Parameters.fromJson(json['parameters'])
        : null;
    errors = json['errors'] != null ? List<dynamic>.from(json['errors']) : null;
    results = json['results'];
    paging = json['paging'] != null ? Paging.fromJson(json['paging']) : null;
    response = json['response'] != null
        ? List<ResponseModel>.from(
            json['response'].map((x) => ResponseModel.fromJson(x)))
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['get'] = get;
    if (parameters != null) {
      data['parameters'] = parameters!.toJson();
    }
    if (errors != null) {
      data['errors'] = errors!.map((v) => v.toJson()).toList();
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
  String? fixture;
  Parameters({this.fixture});
  Parameters.fromJson(Map<String, dynamic> json) {
    fixture = json['fixture'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['fixture'] = fixture;
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
