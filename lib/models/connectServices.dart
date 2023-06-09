// To parse this JSON data, do
//
//     final connectServices = connectServicesFromJson(jsonString);

import 'dart:convert';

ConnectServices connectServicesFromJson(String str) =>
    ConnectServices.fromJson(json.decode(str));

String connectServicesToJson(ConnectServices data) =>
    json.encode(data.toJson());

class ConnectServices {
  ConnectServices({
    this.page,
    this.totalPages,
    this.totalItems,
    this.data,
    this.status,
  });

  int? page;
  int? totalPages;
  int? totalItems;
  List<Services>? data;
  String? status;

  factory ConnectServices.fromJson(Map<String, dynamic> json) =>
      ConnectServices(
        page: json["page"],
        totalPages: json["total_pages"],
        totalItems: json["total_items"],
        data: json["data"] == null
            ? []
            : List<Services>.from(
                json["data"]!.map((x) => Services.fromJson(x))),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "total_pages": totalPages,
        "total_items": totalItems,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "status": status,
      };
}

class Services {
  Services({
    this.createdAt,
    this.beneficiary,
    this.channel,
    this.currency,
    this.amount,
    this.status,
    this.id,
    this.processor,
    this.phoneNumber
  });

  String? createdAt;
  String? beneficiary;
  String? channel;
  String? currency;
  String? amount;
  String? status;
  String? id;
  String? processor;
  String? phoneNumber;

  factory Services.fromJson(Map<String, dynamic> json) => Services(
        createdAt: json["created_at"],
        beneficiary: json["beneficiary"],
        channel: json["channel"],
        currency: json["currency"],
        amount: json["amount"],
        status: json["status"],
       id: json["id"],
       processor: json["processor"],
    phoneNumber: json["phone_number"]
      );

  Map<String, dynamic> toJson() => {
        "created_at": createdAt,
        "beneficiary": beneficiary,
        "channel": channel,
        "currency": currency,
        "amount": amount,
        "status": status,
    "id":id,
    "processor":processor,
    "phoneNumber":phoneNumber
      };
}
