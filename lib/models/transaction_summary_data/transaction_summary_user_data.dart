import 'dart:convert';

import 'package:collection/collection.dart';

import '../../helper/screen_export.dart';

@immutable
class TransactionSummaryUserData {
  final int? successfulExpressTransactions;
  final int? failedExpressTransactions;
  final int? successfulSwapsTransactions;
  final int? failedSwapsTransactions;
  final int? successfulWithdrawalsTransactions;
  final int? failedWithdrawalsTransactions;
  final int? successfulConnectTransactions;
  final int? failedConnectTransactions;
  final int? successfulCardTransactions;
  final int? failedCardTransactions;
  final int? successfulCreditTransactions;
  final int? failedCreditTransactions;
  final int? totalSuccessfulTransactions;
  final int? totalFailedTransactions;

  const TransactionSummaryUserData({
    this.successfulExpressTransactions,
    this.failedExpressTransactions,
    this.successfulSwapsTransactions,
    this.failedSwapsTransactions,
    this.successfulWithdrawalsTransactions,
    this.failedWithdrawalsTransactions,
    this.successfulConnectTransactions,
    this.failedConnectTransactions,
    this.successfulCardTransactions,
    this.failedCardTransactions,
    this.successfulCreditTransactions,
    this.failedCreditTransactions,
    this.totalSuccessfulTransactions,
    this.totalFailedTransactions,
  });

  @override
  String toString() {
    return 'Data(successfulExpressTransactions: $successfulExpressTransactions, failedExpressTransactions: $failedExpressTransactions, successfulSwapsTransactions: $successfulSwapsTransactions, failedSwapsTransactions: $failedSwapsTransactions, successfulWithdrawalsTransactions: $successfulWithdrawalsTransactions, failedWithdrawalsTransactions: $failedWithdrawalsTransactions, successfulConnectTransactions: $successfulConnectTransactions, failedConnectTransactions: $failedConnectTransactions, successfulCardTransactions: $successfulCardTransactions, failedCardTransactions: $failedCardTransactions, successfulCreditTransactions: $successfulCreditTransactions, failedCreditTransactions: $failedCreditTransactions, totalSuccessfulTransactions: $totalSuccessfulTransactions, totalFailedTransactions: $totalFailedTransactions)';
  }

  factory TransactionSummaryUserData.fromMap(Map<String, dynamic> data) =>
      TransactionSummaryUserData(
        successfulExpressTransactions:
            data['successful_express_transactions'] as int?,
        failedExpressTransactions: data['failed_express_transactions'] as int?,
        successfulSwapsTransactions:
            data['successful_swaps_transactions'] as int?,
        failedSwapsTransactions: data['failed_swaps_transactions'] as int?,
        successfulWithdrawalsTransactions:
            data['successful_withdrawals_transactions'] as int?,
        failedWithdrawalsTransactions:
            data['failed_withdrawals_transactions'] as int?,
        successfulConnectTransactions:
            data['successful_connect_transactions'] as int?,
        failedConnectTransactions: data['failed_connect_transactions'] as int?,
        successfulCardTransactions:
            data['successful_card_transactions'] as int?,
        failedCardTransactions: data['failed_card_transactions'] as int?,
        successfulCreditTransactions:
            data['successful_credit_transactions'] as int?,
        failedCreditTransactions: data['failed_credit_transactions'] as int?,
        totalSuccessfulTransactions:
            data['total_successful_transactions'] as int?,
        totalFailedTransactions: data['total_failed_transactions'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'successful_express_transactions': successfulExpressTransactions,
        'failed_express_transactions': failedExpressTransactions,
        'successful_swaps_transactions': successfulSwapsTransactions,
        'failed_swaps_transactions': failedSwapsTransactions,
        'successful_withdrawals_transactions':
            successfulWithdrawalsTransactions,
        'failed_withdrawals_transactions': failedWithdrawalsTransactions,
        'successful_connect_transactions': successfulConnectTransactions,
        'failed_connect_transactions': failedConnectTransactions,
        'successful_card_transactions': successfulCardTransactions,
        'failed_card_transactions': failedCardTransactions,
        'successful_credit_transactions': successfulCreditTransactions,
        'failed_credit_transactions': failedCreditTransactions,
        'total_successful_transactions': totalSuccessfulTransactions,
        'total_failed_transactions': totalFailedTransactions,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Data].
  factory TransactionSummaryUserData.fromJson(String data) {
    return TransactionSummaryUserData.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Data] to a JSON string.
  String toJson() => json.encode(toMap());

  TransactionSummaryUserData copyWith({
    int? successfulExpressTransactions,
    int? failedExpressTransactions,
    int? successfulSwapsTransactions,
    int? failedSwapsTransactions,
    int? successfulWithdrawalsTransactions,
    int? failedWithdrawalsTransactions,
    int? successfulConnectTransactions,
    int? failedConnectTransactions,
    int? successfulCardTransactions,
    int? failedCardTransactions,
    int? successfulCreditTransactions,
    int? failedCreditTransactions,
    int? totalSuccessfulTransactions,
    int? totalFailedTransactions,
  }) {
    return TransactionSummaryUserData(
      successfulExpressTransactions:
          successfulExpressTransactions ?? this.successfulExpressTransactions,
      failedExpressTransactions:
          failedExpressTransactions ?? this.failedExpressTransactions,
      successfulSwapsTransactions:
          successfulSwapsTransactions ?? this.successfulSwapsTransactions,
      failedSwapsTransactions:
          failedSwapsTransactions ?? this.failedSwapsTransactions,
      successfulWithdrawalsTransactions: successfulWithdrawalsTransactions ??
          this.successfulWithdrawalsTransactions,
      failedWithdrawalsTransactions:
          failedWithdrawalsTransactions ?? this.failedWithdrawalsTransactions,
      successfulConnectTransactions:
          successfulConnectTransactions ?? this.successfulConnectTransactions,
      failedConnectTransactions:
          failedConnectTransactions ?? this.failedConnectTransactions,
      successfulCardTransactions:
          successfulCardTransactions ?? this.successfulCardTransactions,
      failedCardTransactions:
          failedCardTransactions ?? this.failedCardTransactions,
      successfulCreditTransactions:
          successfulCreditTransactions ?? this.successfulCreditTransactions,
      failedCreditTransactions:
          failedCreditTransactions ?? this.failedCreditTransactions,
      totalSuccessfulTransactions:
          totalSuccessfulTransactions ?? this.totalSuccessfulTransactions,
      totalFailedTransactions:
          totalFailedTransactions ?? this.totalFailedTransactions,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! TransactionSummaryUserData) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      successfulExpressTransactions.hashCode ^
      failedExpressTransactions.hashCode ^
      successfulSwapsTransactions.hashCode ^
      failedSwapsTransactions.hashCode ^
      successfulWithdrawalsTransactions.hashCode ^
      failedWithdrawalsTransactions.hashCode ^
      successfulConnectTransactions.hashCode ^
      failedConnectTransactions.hashCode ^
      successfulCardTransactions.hashCode ^
      failedCardTransactions.hashCode ^
      successfulCreditTransactions.hashCode ^
      failedCreditTransactions.hashCode ^
      totalSuccessfulTransactions.hashCode ^
      totalFailedTransactions.hashCode;
}
