// To parse this JSON data, do
//
//     final connectHealth = connectHealthFromJson(jsonString);

import 'dart:convert';

ConnectHealth connectHealthFromJson(String str) => ConnectHealth.fromJson(json.decode(str));

String connectHealthToJson(ConnectHealth data) => json.encode(data.toJson());

class ConnectHealth {
  ConnectHealth({
    this.data,
    this.status,
  });

  Data? data;
  String? status;

  factory ConnectHealth.fromJson(Map<String, dynamic> json) => ConnectHealth(
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "data": data?.toJson(),
    "status": status,
  };
}

class Data {
  Data({
    this.totalConnectTransaction,
    this.totalConnectTransactionSum,
    this.kyshiConnectHealthSum,
    this.kyshiConnectHealthGbpSum,
    this.kyshiConnectHealthUsdSum,
    this.kyshiConnectHealthCadSum,
    this.kyshiConnectHealthNgnSum,
  });

  double? totalConnectTransaction;
  double? totalConnectTransactionSum;
  double? kyshiConnectHealthSum;
  double? kyshiConnectHealthGbpSum;
  double? kyshiConnectHealthUsdSum;
  double? kyshiConnectHealthCadSum;
  double? kyshiConnectHealthNgnSum;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    totalConnectTransaction: json["total_connect_transaction"],
    totalConnectTransactionSum: json["total_connect_transaction_sum"]?.toDouble(),
    kyshiConnectHealthSum: json["kyshi_connect_health_sum"]?.toDouble(),
    kyshiConnectHealthGbpSum: json["kyshi_connect_health_gbp_sum"]?.toDouble(),
    kyshiConnectHealthUsdSum: json["kyshi_connect_health_usd_sum"]?.toDouble(),
    kyshiConnectHealthCadSum: json["kyshi_connect_health_cad_sum"],
    kyshiConnectHealthNgnSum: json["kyshi_connect_health_ngn_sum"],
  );

  Map<String, dynamic> toJson() => {
    "total_connect_transaction": totalConnectTransaction,
    "total_connect_transaction_sum": totalConnectTransactionSum,
    "kyshi_connect_health_sum": kyshiConnectHealthSum,
    "kyshi_connect_health_gbp_sum": kyshiConnectHealthGbpSum,
    "kyshi_connect_health_usd_sum": kyshiConnectHealthUsdSum,
    "kyshi_connect_health_cad_sum": kyshiConnectHealthCadSum,
    "kyshi_connect_health_ngn_sum": kyshiConnectHealthNgnSum,
  };
}
