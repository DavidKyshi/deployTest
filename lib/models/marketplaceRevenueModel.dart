// To parse this JSON data, do
//
//     final marketPlaceRevenueModel = marketPlaceRevenueModelFromJson(jsonString);

import 'dart:convert';

MarketPlaceRevenueModel marketPlaceRevenueModelFromJson(String str) =>
    MarketPlaceRevenueModel.fromJson(json.decode(str));

String marketPlaceRevenueModelToJson(MarketPlaceRevenueModel data) =>
    json.encode(data.toJson());

class MarketPlaceRevenueModel {
  MarketPlaceRevenueModel({
    this.ngnRevenue,
    this.gbpRevenue,
    this.usdRevenue,
    this.cadRevenue,
  });

  Revenue? ngnRevenue;
  Revenue? gbpRevenue;
  Revenue? usdRevenue;
  Revenue? cadRevenue;

  factory MarketPlaceRevenueModel.fromJson(Map<String, dynamic> json) =>
      MarketPlaceRevenueModel(
        ngnRevenue: json["ngn_revenue"] == null
            ? null
            : Revenue.fromJson(json["ngn_revenue"]),
        gbpRevenue: json["gbp_revenue"] == null
            ? null
            : Revenue.fromJson(json["gbp_revenue"]),
        usdRevenue: json["usd_revenue"] == null
            ? null
            : Revenue.fromJson(json["usd_revenue"]),
        cadRevenue: json["cad_revenue"] == null
            ? null
            : Revenue.fromJson(json["cad_revenue"]),
      );

  Map<String, dynamic> toJson() => {
        "ngn_revenue": ngnRevenue?.toJson(),
        "gbp_revenue": gbpRevenue?.toJson(),
        "usd_revenue": usdRevenue?.toJson(),
        "cad_revenue": cadRevenue?.toJson(),
      };
}

class Revenue {
  Revenue({
    this.serviceChargeSum,
  });

  double? serviceChargeSum;

  factory Revenue.fromJson(Map<String, dynamic> json) => Revenue(
        serviceChargeSum: json["service_charge__sum"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "service_charge__sum": serviceChargeSum,
      };
}
