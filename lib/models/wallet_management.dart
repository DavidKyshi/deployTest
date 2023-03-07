// To parse this JSON data, do
//
//     final walletManagementModel = walletManagementModelFromJson(jsonString);

import 'dart:convert';

WalletManagementModel walletManagementModelFromJson(String str) =>
    WalletManagementModel.fromJson(json.decode(str));

String walletManagementModelToJson(WalletManagementModel data) =>
    json.encode(data.toJson());

class WalletManagementModel {
  WalletManagementModel({
    this.page,
    this.totalPages,
    this.totalItems,
    this.data,
    this.status,
  });

  int? page;
  int? totalPages;
  int? totalItems;
  List<WalletResponse>? data;
  String? status;

  factory WalletManagementModel.fromJson(Map<String, dynamic> json) =>
      WalletManagementModel(
        page: json["page"],
        totalPages: json["total_pages"],
        totalItems: json["total_items"],
        data: json["data"] == null
            ? []
            : List<WalletResponse>.from(
                json["data"]!.map((x) => WalletResponse.fromJson(x))),
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

class WalletResponse {
  WalletResponse({
    this.createdAt,
    this.currency,
    this.availableBalance,
    this.ledgerBalance,
    this.user,
    this.provider,
    this.status,
    this.tier,
  });

  String? createdAt;
  String? currency;
  int? availableBalance;
  int? ledgerBalance;
  String? user;
  dynamic provider;
  String? status;
  Tier? tier;

  factory WalletResponse.fromJson(Map<String, dynamic> json) => WalletResponse(
        createdAt: json["created_at"] ?? "",
        currency: json["currency"] ?? "",
        availableBalance: json["available_balance"] ?? "",
        ledgerBalance: json["ledger_balance"] ?? 0,
        user: json["user"] ?? "",
        provider: json["provider"] ?? "",
        status: json["status"],
        tier: json["tier"] == null ? null : Tier.fromJson(json["tier"]),
      );

  Map<String, dynamic> toJson() => {
        "created_at": createdAt,
        "currency": currency,
        "available_balance": availableBalance,
        "ledger_balance": ledgerBalance,
        "user": user,
        "provider": provider,
        "status": status,
        "tier": tier?.toJson(),
      };
}

class Tier {
  Tier({
    this.id,
    this.createdAt,
    this.modifiedAt,
    this.name,
    this.maxDailySpendAmount,
    this.maxWeeklySpendAmount,
    this.maxMonthlySpendAmount,
    this.maxAnnualSpendAmount,
    this.maxBalanceAllowed,
    this.currency,
  });

  String? id;
  String? createdAt;
  String? modifiedAt;
  int? name;
  String? maxDailySpendAmount;
  String? maxWeeklySpendAmount;
  String? maxMonthlySpendAmount;
  String? maxAnnualSpendAmount;
  String? maxBalanceAllowed;
  String? currency;

  factory Tier.fromJson(Map<String, dynamic> json) => Tier(
        id: json["id"],
        createdAt: json["created_at"] ?? "",
        modifiedAt: json["modified_at"] ?? "",
        name: json["name"],
        maxDailySpendAmount: json["max_daily_spend_amount"] ?? "",
        maxWeeklySpendAmount: json["max_weekly_spend_amount"] ?? "",
        maxMonthlySpendAmount: json["max_monthly_spend_amount"] ?? "",
        maxAnnualSpendAmount: json["max_annual_spend_amount"] ?? "",
        maxBalanceAllowed: json["max_balance_allowed"] ?? "",
        currency: json["currency"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "created_at": createdAt,
        "modified_at": modifiedAt,
        "name": name,
        "max_daily_spend_amount": maxDailySpendAmount,
        "max_weekly_spend_amount": maxWeeklySpendAmount,
        "max_monthly_spend_amount": maxMonthlySpendAmount,
        "max_annual_spend_amount": maxAnnualSpendAmount,
        "max_balance_allowed": maxBalanceAllowed,
        "currency": currency,
      };
}
