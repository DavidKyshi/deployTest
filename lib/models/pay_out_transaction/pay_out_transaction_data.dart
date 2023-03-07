import 'dart:convert';

import 'package:collection/collection.dart';

import '../../helper/screen_export.dart';

@immutable
class PayOutTransactionUserData {
  final String? createdAt;
  final String? user;
  final String? ledgerOperation;
  final String? amount;
  final String? currency;
  final String? status;
  final String? processor;
  final String? channel;
  final String? type;
  final String? serviceCharge;
  final dynamic availableBalance;
  final dynamic ledgerBalance;
  final dynamic beneficiary;

  const PayOutTransactionUserData({
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

  @override
  String toString() {
    return 'Datum(createdAt: $createdAt, user: $user, ledgerOperation: $ledgerOperation, amount: $amount, currency: $currency, status: $status, processor: $processor, channel: $channel, type: $type, serviceCharge: $serviceCharge, availableBalance: $availableBalance, ledgerBalance: $ledgerBalance, beneficiary: $beneficiary)';
  }

  factory PayOutTransactionUserData.fromMap(Map<String, dynamic> data) => PayOutTransactionUserData(
        createdAt: data['created_at'] as String?,
        user: data['user'] as String?,
        ledgerOperation: data['ledger_operation'] as String?,
        amount: data['amount'] as String?,
        currency: data['currency'] as String?,
        status: data['status'] as String?,
        processor: data['processor'] as String?,
        channel: data['channel'] as String?,
        type: data['type'] as String?,
        serviceCharge: data['service_charge'] as String?,
        availableBalance: data['available_balance'] as dynamic,
        ledgerBalance: data['ledger_balance'] as dynamic,
        beneficiary: data['beneficiary'] as dynamic,
      );

  Map<String, dynamic> toMap() => {
        'created_at': createdAt,
        'user': user,
        'ledger_operation': ledgerOperation,
        'amount': amount,
        'currency': currency,
        'status': status,
        'processor': processor,
        'channel': channel,
        'type': type,
        'service_charge': serviceCharge,
        'available_balance': availableBalance,
        'ledger_balance': ledgerBalance,
        'beneficiary': beneficiary,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Datum].
  factory PayOutTransactionUserData.fromJson(String data) {
    return PayOutTransactionUserData.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Datum] to a JSON string.
  String toJson() => json.encode(toMap());

  PayOutTransactionUserData copyWith({
    String? createdAt,
    String? user,
    String? ledgerOperation,
    String? amount,
    String? currency,
    String? status,
    String? processor,
    String? channel,
    String? type,
    String? serviceCharge,
    dynamic availableBalance,
    dynamic ledgerBalance,
    dynamic beneficiary,
  }) {
    return PayOutTransactionUserData(
      createdAt: createdAt ?? this.createdAt,
      user: user ?? this.user,
      ledgerOperation: ledgerOperation ?? this.ledgerOperation,
      amount: amount ?? this.amount,
      currency: currency ?? this.currency,
      status: status ?? this.status,
      processor: processor ?? this.processor,
      channel: channel ?? this.channel,
      type: type ?? this.type,
      serviceCharge: serviceCharge ?? this.serviceCharge,
      availableBalance: availableBalance ?? this.availableBalance,
      ledgerBalance: ledgerBalance ?? this.ledgerBalance,
      beneficiary: beneficiary ?? this.beneficiary,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! PayOutTransactionUserData) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      createdAt.hashCode ^
      user.hashCode ^
      ledgerOperation.hashCode ^
      amount.hashCode ^
      currency.hashCode ^
      status.hashCode ^
      processor.hashCode ^
      channel.hashCode ^
      type.hashCode ^
      serviceCharge.hashCode ^
      availableBalance.hashCode ^
      ledgerBalance.hashCode ^
      beneficiary.hashCode;
}