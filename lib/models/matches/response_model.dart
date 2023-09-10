// class ResponseMatchesModel {
//   String? get;
//   Parameters? parameters;
//   List<Null>? errors;
//   int? results;
//   Paging? paging;
//   List? response;
//
//   ResponseMatchesModel(
//       {this.get,
//       this.parameters,
//       this.errors,
//       this.results,
//       this.paging,
//       this.response});
//
//   ResponseMatchesModel.fromJson(Map<String, dynamic> json) {
//     get = json['get'];
//     parameters = json['parameters'] != null
//         ? new Parameters.fromJson(json['parameters'])
//         : null;
//     if (json['errors'] != null) {
//       errors = <Null>[];
//       json['errors'].forEach((v) {
//         errors!.add(new Null.fromJson(v));
//       });
//     }
//     results = json['results'];
//     paging =
//         json['paging'] != null ? new Paging.fromJson(json['paging']) : null;
//     if (json['response'] != null) {
//       response = [];
//       json['response'].forEach((v) {
//         response!.add(Null.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['get'] = this.get;
//     if (this.parameters != null) {
//       data['parameters'] = this.parameters!.toJson();
//     }
//     if (this.errors != null) {
//       data['errors'] = this.errors!.map((v) => v.toJson()).toList();
//     }
//     data['results'] = this.results;
//     if (this.paging != null) {
//       data['paging'] = this.paging!.toJson();
//     }
//     if (this.response != null) {
//       data['response'] = this.response!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class Parameters {
//   String? live;
//
//   Parameters({this.live});
//
//   Parameters.fromJson(Map<String, dynamic> json) {
//     live = json['live'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['live'] = this.live;
//     return data;
//   }
// }
//
// class Paging {
//   int? current;
//   int? total;
//
//   Paging({this.current, this.total});
//
//   Paging.fromJson(Map<String, dynamic> json) {
//     current = json['current'];
//     total = json['total'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['current'] = this.current;
//     data['total'] = this.total;
//     return data;
//   }
// }
