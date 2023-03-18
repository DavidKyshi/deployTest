// // To parse this JSON data, do
// //
// //     final kyshiConnectOverViewResponse = kyshiConnectOverViewResponseFromJson(jsonString);
//
// import 'dart:convert';
//
// KyshiConnectOverViewResponse kyshiConnectOverViewResponseFromJson(String str) => KyshiConnectOverViewResponse.fromJson(json.decode(str));
//
// String kyshiConnectOverViewResponseToJson(KyshiConnectOverViewResponse data) => json.encode(data.toJson());
//
// class KyshiConnectOverViewResponse {
//   KyshiConnectOverViewResponse({
//     this.data,
//     this.status,
//   });
//
//   ConnectData? data;
//   String? status;
//
//   factory KyshiConnectOverViewResponse.fromJson(Map<String, dynamic> json) => KyshiConnectOverViewResponse(
//     data: json["data"] == null ? null : ConnectData.fromJson(json["data"]),
//     status: json["status"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "data": data?.toJson(),
//     "status": status,
//   };
// }


