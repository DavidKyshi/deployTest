import 'dart:convert';

import 'package:collection/collection.dart';

import '../../helper/screen_export.dart';

@immutable
class TierData {
  final String? id;
  final String? createdAt;
  final DateTime? modifiedAt;
  final int? name;
  final String? maxDailySpendAmount;
  final String? maxWeeklySpendAmount;
  final String? maxMonthlySpendAmount;
  final String? maxAnnualSpendAmount;
  final String? maxBalanceAllowed;
  final String? currency;

  const TierData({
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

  @override
  String toString() {
    return 'Tier(id: $id, createdAt: $createdAt, modifiedAt: $modifiedAt, name: $name, maxDailySpendAmount: $maxDailySpendAmount, maxWeeklySpendAmount: $maxWeeklySpendAmount, maxMonthlySpendAmount: $maxMonthlySpendAmount, maxAnnualSpendAmount: $maxAnnualSpendAmount, maxBalanceAllowed: $maxBalanceAllowed, currency: $currency)';
  }

  factory TierData.fromMap(Map<String, dynamic> data) => TierData(
        id: data['id'] as String?,
        createdAt: data['created_at'] as String?,
        modifiedAt: data['modified_at'] == null
            ? null
            : DateTime.parse(data['modified_at'] as String),
        name: data['name'] as int?,
        maxDailySpendAmount: data['max_daily_spend_amount'] as String?,
        maxWeeklySpendAmount: data['max_weekly_spend_amount'] as String?,
        maxMonthlySpendAmount: data['max_monthly_spend_amount'] as String?,
        maxAnnualSpendAmount: data['max_annual_spend_amount'] as String?,
        maxBalanceAllowed: data['max_balance_allowed'] as String?,
        currency: data['currency'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'created_at': createdAt,
        'modified_at': modifiedAt?.toIso8601String(),
        'name': name,
        'max_daily_spend_amount': maxDailySpendAmount,
        'max_weekly_spend_amount': maxWeeklySpendAmount,
        'max_monthly_spend_amount': maxMonthlySpendAmount,
        'max_annual_spend_amount': maxAnnualSpendAmount,
        'max_balance_allowed': maxBalanceAllowed,
        'currency': currency,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [TierData].
  factory TierData.fromJson(String data) {
    return TierData.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [TierData] to a JSON string.
  String toJson() => json.encode(toMap());

  TierData copyWith({
    String? id,
    String? createdAt,
    DateTime? modifiedAt,
    int? name,
    String? maxDailySpendAmount,
    String? maxWeeklySpendAmount,
    String? maxMonthlySpendAmount,
    String? maxAnnualSpendAmount,
    String? maxBalanceAllowed,
    String? currency,
  }) {
    return TierData(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      modifiedAt: modifiedAt ?? this.modifiedAt,
      name: name ?? this.name,
      maxDailySpendAmount: maxDailySpendAmount ?? this.maxDailySpendAmount,
      maxWeeklySpendAmount: maxWeeklySpendAmount ?? this.maxWeeklySpendAmount,
      maxMonthlySpendAmount:
          maxMonthlySpendAmount ?? this.maxMonthlySpendAmount,
      maxAnnualSpendAmount: maxAnnualSpendAmount ?? this.maxAnnualSpendAmount,
      maxBalanceAllowed: maxBalanceAllowed ?? this.maxBalanceAllowed,
      currency: currency ?? this.currency,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! TierData) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      id.hashCode ^
      createdAt.hashCode ^
      modifiedAt.hashCode ^
      name.hashCode ^
      maxDailySpendAmount.hashCode ^
      maxWeeklySpendAmount.hashCode ^
      maxMonthlySpendAmount.hashCode ^
      maxAnnualSpendAmount.hashCode ^
      maxBalanceAllowed.hashCode ^
      currency.hashCode;
}
