// To parse this JSON data, do
//
//     final transactions = transactionsFromJson(jsonString);

import 'dart:convert';

Transactions transactionsFromJson(String str) => Transactions.fromJson(json.decode(str));

String transactionsToJson(Transactions data) => json.encode(data.toJson());

class Transactions {
  Transactions({
    this.page,
    this.totalPages,
    this.totalItems,
    this.data,
    this.status,
  });

  int? page;
  int? totalPages;
  int? totalItems;
  List<TransactionsData>? data;
  String? status;

  factory Transactions.fromJson(Map<String, dynamic> json) => Transactions(
    page: json["page"],
    totalPages: json["total_pages"],
    totalItems: json["total_items"],
    data: json["data"] == null ? [] : List<TransactionsData>.from(json["data"]!.map((x) => TransactionsData.fromJson(x))),
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "page": page,
    "total_pages": totalPages,
    "total_items": totalItems,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "status": status,
  };
}

class TransactionsData {
  TransactionsData({
    this.createdAt,
    this.user,
    this.ledgerOperation,
    this.amount,
    this.currency,
    this.status,
    this.processor,
    this.channel,
    this.type,
    this.serviceCharge,
    this.availableBalance,
    this.ledgerBalance,
    this.beneficiary,
  });

  String? createdAt;
  String? user;
  String? ledgerOperation;
  String? amount;
  String? currency;
  String? status;
  String? processor;
  String? channel;
  String? type;
  String? serviceCharge;
  double? availableBalance;
  double? ledgerBalance;
  String? beneficiary;

  factory TransactionsData.fromJson(Map<String, dynamic> json) => TransactionsData(
    createdAt: json["created_at"],
    user: json["user"],
    ledgerOperation: json["ledger_operation"],
    amount: json["amount"],
    currency: json["currency"],
    status: json["status"],
    processor: json["processor"],
    channel: json["channel"],
    type: json["type"],
    serviceCharge: json["service_charge"],
    availableBalance: json["available_balance"]?.toDouble(),
    ledgerBalance: json["ledger_balance"]?.toDouble(),
    beneficiary: json["beneficiary"],
  );

  Map<String, dynamic> toJson() => {
    "created_at": createdAt,
    "user": user,
    "ledger_operation": ledgerOperation,
    "amount": amount,
    "currency": currency,
    "status": status,
    "processor": processor,
    "channel": channel,
    "type": type,
    "service_charge": serviceCharge,
    "available_balance": availableBalance,
    "ledger_balance": ledgerBalance,
    "beneficiary": beneficiary,
  };
}
