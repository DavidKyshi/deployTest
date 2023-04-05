// To parse this JSON data, do
//
//     final cardDetails = cardDetailsFromJson(jsonString);

import 'dart:convert';

List<CardTransactions> cardDetailsFromJson(String str) => List<CardTransactions>.from(json.decode(str).map((x) => CardTransactions.fromJson(x)));

String cardDetailsToJson(List<CardTransactions> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CardTransactions {
  CardTransactions({
    this.createdAt,
    this.id,
    this.channel,
    this.processor,
    this.currency,
    this.amount,
    this.status,
  });

  String? createdAt;
  String? id;
  String? channel;
  String? processor;
  String? currency;
  String? amount;
  String? status;

  factory CardTransactions.fromJson(Map<String, dynamic> json) => CardTransactions(
    createdAt: json["created_at"],
    id: json["id"],
    channel: json["channel"],
    processor: json["processor"],
    currency: json["currency"],
    amount: json["amount"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "created_at": createdAt,
    "id": id,
    "channel": channelValues.reverse[channel],
    "processor": processorValues.reverse[processor],
    "currency": currencyValues.reverse[currency],
    "amount": amount,
    "status": statusValues.reverse[status],
  };
}

enum Channel { CARD_TOPUP }

final channelValues = EnumValues({
  "CARD_TOPUP": Channel.CARD_TOPUP
});

enum Currency { USD }

final currencyValues = EnumValues({
  "USD": Currency.USD
});

enum Processor { SUDO }

final processorValues = EnumValues({
  "SUDO": Processor.SUDO
});

enum Status { PENDING, SUCCESS }

final statusValues = EnumValues({
  "PENDING": Status.PENDING,
  "SUCCESS": Status.SUCCESS
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
