// To parse this JSON data, do
//
//     final connectAirtime = connectAirtimeFromJson(jsonString);

import 'dart:convert';

ConnectAirtime connectAirtimeFromJson(String str) => ConnectAirtime.fromJson(json.decode(str));

String connectAirtimeToJson(ConnectAirtime data) => json.encode(data.toJson());

class ConnectAirtime {
  ConnectAirtime({
    this.data,
    this.status,
  });

  Data? data;
  String? status;

  factory ConnectAirtime.fromJson(Map<String, dynamic> json) => ConnectAirtime(
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
    this.kyshiConnectAirtimeSum,
    this.kyshiConnectAirtimeNgnSum,
    this.kyshiConnectAirtimeGbpSum,
    this.kyshiConnectAirtimeUsdSum,
    this.kyshiConnectAirtimeCadSum,
  });

  double? totalConnectTransaction;
  double? totalConnectTransactionSum;
  double? kyshiConnectAirtimeSum;
  double? kyshiConnectAirtimeNgnSum;
  double? kyshiConnectAirtimeGbpSum;
  double? kyshiConnectAirtimeUsdSum;
  double? kyshiConnectAirtimeCadSum;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    totalConnectTransaction: json["total_connect_transaction"],
    totalConnectTransactionSum: json["total_connect_transaction_sum"]?.toDouble(),
    kyshiConnectAirtimeSum: json["kyshi_connect_airtime_sum"],
    kyshiConnectAirtimeNgnSum: json["kyshi_connect_airtime_ngn_sum"],
    kyshiConnectAirtimeGbpSum: json["kyshi_connect_airtime_gbp_sum"],
    kyshiConnectAirtimeUsdSum: json["kyshi_connect_airtime_usd_sum"],
    kyshiConnectAirtimeCadSum: json["kyshi_connect_airtime_cad_sum"],
  );

  Map<String, dynamic> toJson() => {
    "total_connect_transaction": totalConnectTransaction,
    "total_connect_transaction_sum": totalConnectTransactionSum,
    "kyshi_connect_airtime_sum": kyshiConnectAirtimeSum,
    "kyshi_connect_airtime_ngn_sum": kyshiConnectAirtimeNgnSum,
    "kyshi_connect_airtime_gbp_sum": kyshiConnectAirtimeGbpSum,
    "kyshi_connect_airtime_usd_sum": kyshiConnectAirtimeUsdSum,
    "kyshi_connect_airtime_cad_sum": kyshiConnectAirtimeCadSum,
  };
}
