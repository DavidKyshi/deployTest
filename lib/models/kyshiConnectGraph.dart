// To parse this JSON data, do
//
//     final kyshiConnectGraph = kyshiConnectGraphFromJson(jsonString);

import 'dart:convert';

KyshiConnectGraph kyshiConnectGraphFromJson(String str) => KyshiConnectGraph.fromJson(json.decode(str));

String kyshiConnectGraphToJson(KyshiConnectGraph data) => json.encode(data.toJson());

class KyshiConnectGraph {
  KyshiConnectGraph({
    this.status,
    this.message,
    this.data,
  });

  String? status;
  String? message;
  List<ConnectOverViewGraph>? data;

  factory KyshiConnectGraph.fromJson(Map<String, dynamic> json) => KyshiConnectGraph(
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? [] : List<ConnectOverViewGraph>.from(json["data"]!.map((x) => ConnectOverViewGraph.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class ConnectOverViewGraph {
  ConnectOverViewGraph({
    this.day,
    this.totalTrans,
  });

  String? day;
  int? totalTrans;

  factory ConnectOverViewGraph.fromJson(Map<String, dynamic> json) => ConnectOverViewGraph(
    day: json["day"],
    totalTrans: json["total_trans"],
  );

  Map<String, dynamic> toJson() => {
    "day": day,
    "total_trans": totalTrans,
  };
}
