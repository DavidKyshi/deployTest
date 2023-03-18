// To parse this JSON data, do
//
//     final kyshiConnectOverViewResponse = kyshiConnectOverViewResponseFromJson(jsonString);

import 'dart:convert';

KyshiConnectOverViewResponse kyshiConnectOverViewResponseFromJson(String str) =>
    KyshiConnectOverViewResponse.fromJson(json.decode(str));

String kyshiConnectOverViewResponseToJson(KyshiConnectOverViewResponse data) =>
    json.encode(data.toJson());

class KyshiConnectOverViewResponse {
  KyshiConnectOverViewResponse({
    this.data,
    this.status,
  });

  Data? data;
  String? status;

  factory KyshiConnectOverViewResponse.fromJson(Map<String, dynamic> json) =>
      KyshiConnectOverViewResponse(
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
    this.kyshiConnectDataSum,
    this.kyshiConnectDataGbpSum,
    this.kyshiConnectDataUsdSum,
    this.kyshiConnectDataCadSum,
    this.kyshiConnectDataNgnSum,
  });

  int? totalConnectTransaction;
  int? totalConnectTransactionSum;
  int? kyshiConnectDataSum;
  int? kyshiConnectDataGbpSum;
  int? kyshiConnectDataUsdSum;
  int? kyshiConnectDataCadSum;
  int? kyshiConnectDataNgnSum;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        totalConnectTransaction: json["total_connect_transaction"],
        totalConnectTransactionSum: json["total_connect_transaction_sum"],
        kyshiConnectDataSum: json["kyshi_connect_data_sum"],
        kyshiConnectDataGbpSum: json["kyshi_connect_data_gbp_sum"],
        kyshiConnectDataUsdSum: json["kyshi_connect_data_usd_sum"],
        kyshiConnectDataCadSum: json["kyshi_connect_data_cad_sum"],
        kyshiConnectDataNgnSum: json["kyshi_connect_data_ngn_sum"],
      );

  Map<String, dynamic> toJson() => {
        "total_connect_transaction": totalConnectTransaction,
        "total_connect_transaction_sum": totalConnectTransactionSum,
        "kyshi_connect_data_sum": kyshiConnectDataSum,
        "kyshi_connect_data_gbp_sum": kyshiConnectDataGbpSum,
        "kyshi_connect_data_usd_sum": kyshiConnectDataUsdSum,
        "kyshi_connect_data_cad_sum": kyshiConnectDataCadSum,
        "kyshi_connect_data_ngn_sum": kyshiConnectDataNgnSum,
      };
}
