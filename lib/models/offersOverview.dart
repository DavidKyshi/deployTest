// To parse this JSON data, do
//
//     final overviewOffersResponse = overviewOffersResponseFromJson(jsonString);

import 'dart:convert';

OverviewOffersResponse overviewOffersResponseFromJson(String str) =>
    OverviewOffersResponse.fromJson(json.decode(str));

String overviewOffersResponseToJson(OverviewOffersResponse data) =>
    json.encode(data.toJson());

class OverviewOffersResponse {
  OverviewOffersResponse({
    this.status,
    this.message,
    this.data,
  });

  String? status;
  String? message;
  List<OverViewdata>? data;

  factory OverviewOffersResponse.fromJson(Map<String, dynamic> json) =>
      OverviewOffersResponse(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<OverViewdata>.from(
                json["data"]!.map((x) => OverViewdata.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class OverViewdata {
  OverViewdata({
    this.day,
    this.totalOffers,
  });

  String? day;
  int? totalOffers;

  factory OverViewdata.fromJson(Map<String, dynamic> json) => OverViewdata(
        day: json["day"],
        totalOffers: json["total_offers"],
      );

  Map<String, dynamic> toJson() => {
        "day": day,
        "total_offers": totalOffers,
      };
}
