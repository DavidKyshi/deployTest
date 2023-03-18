import 'dart:convert';

import 'package:collection/collection.dart';

import '../../helper/screen_export.dart';

@immutable
class PayOutTransactionUserData {
  final String? id;
  final String? createdAt;
  final String? user;
  final String? email;
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
  final dynamic offerId;

  const PayOutTransactionUserData({
    this.id,
    this.createdAt,
    this.user,
    this.email,
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
    this.offerId,
  });

  @override
  String toString() {
    return 'PayOutTransactionUserData(id: $id, createdAt: $createdAt, user: $user,email:$email, ledgerOperation: $ledgerOperation, amount: $amount, currency: $currency, status: $status, processor: $processor, channel: $channel, type: $type, serviceCharge: $serviceCharge, availableBalance: $availableBalance, ledgerBalance: $ledgerBalance, beneficiary: $beneficiary, offerId: $offerId)';
  }

  factory PayOutTransactionUserData.fromMap(Map<String, dynamic> data) =>
      PayOutTransactionUserData(
        id: data['id'] as String?,
        createdAt: data['created_at'] as String?,
        user: data['user'] as String?,
        email:data['email'] as String?,
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
        offerId: data['offer_id'] as dynamic,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'created_at': createdAt,
        'user': user,
        'email':email,
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
        'offer_id': offerId,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Datum].
  factory PayOutTransactionUserData.fromJson(String data) {
    return PayOutTransactionUserData.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Datum] to a JSON string.
  String toJson() => json.encode(toMap());

  PayOutTransactionUserData copyWith({
    String? id,
    String? createdAt,
    String? user,
    String? email,
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
    dynamic offerId,
  }) {
    return PayOutTransactionUserData(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      user: user ?? this.user,
      email:email??this.email,
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
      offerId: offerId ?? this.offerId,
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
      id.hashCode ^
      createdAt.hashCode ^
      user.hashCode ^
      email.hashCode ^
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
      beneficiary.hashCode ^
      offerId.hashCode;
}
