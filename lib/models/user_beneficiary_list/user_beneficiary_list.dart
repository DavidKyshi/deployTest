import 'dart:convert';

import 'package:collection/collection.dart';

import '../../helper/screen_export.dart';

@immutable
class UserBeneficiaryList {
  final String? id;
  final String? currency;
  final DateTime? createdAt;
  final DateTime? modifiedAt;
  final String? accountNumber;
  final String? accountName;
  final String? bankName;
  final String? bankCode;
  final dynamic routingNumber;
  final bool? isActive;
  final String? nickName;
  final dynamic externalId;
  final String? externalProvider;
  final String? type;
  final String? channel;
  final String? accountType;
  final dynamic email;
  final String? phoneNumber;
  final String? reason;
  final bool? hide;
  final dynamic metaData;
  final String? user;

  const UserBeneficiaryList({
    this.id,
    this.currency,
    this.createdAt,
    this.modifiedAt,
    this.accountNumber,
    this.accountName,
    this.bankName,
    this.bankCode,
    this.routingNumber,
    this.isActive,
    this.nickName,
    this.externalId,
    this.externalProvider,
    this.type,
    this.channel,
    this.accountType,
    this.email,
    this.phoneNumber,
    this.reason,
    this.hide,
    this.metaData,
    this.user,
  });

  @override
  String toString() {
    return 'UserBeneficiaryList(id: $id, currency: $currency, createdAt: $createdAt, modifiedAt: $modifiedAt, accountNumber: $accountNumber, accountName: $accountName, bankName: $bankName, bankCode: $bankCode, routingNumber: $routingNumber, isActive: $isActive, nickName: $nickName, externalId: $externalId, externalProvider: $externalProvider, type: $type, channel: $channel, accountType: $accountType, email: $email, phoneNumber: $phoneNumber, reason: $reason, hide: $hide, metaData: $metaData, user: $user)';
  }

  factory UserBeneficiaryList.fromMap(Map<String, dynamic> data) {
    return UserBeneficiaryList(
      id: data['id'] as String?,
      currency: data['currency'] as String?,
      createdAt: data['created_at'] == null
          ? null
          : DateTime.parse(data['created_at'] as String),
      modifiedAt: data['modified_at'] == null
          ? null
          : DateTime.parse(data['modified_at'] as String),
      accountNumber: data['account_number'] as String?,
      accountName: data['account_name'] as String?,
      bankName: data['bank_name'] as String?,
      bankCode: data['bank_code'] as String?,
      routingNumber: data['routing_number'] as dynamic,
      isActive: data['is_active'] as bool?,
      nickName: data['nick_name'] as String?,
      externalId: data['external_id'] as dynamic,
      externalProvider: data['external_provider'] as String?,
      type: data['type'] as String?,
      channel: data['channel'] as String?,
      accountType: data['account_type'] as String?,
      email: data['email'] as dynamic,
      phoneNumber: data['phone_number'] as String?,
      reason: data['reason'] as String?,
      hide: data['hide'] as bool?,
      metaData: data['meta_data'] as dynamic,
      user: data['user'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'id': id,
        'currency': currency,
        'created_at': createdAt?.toIso8601String(),
        'modified_at': modifiedAt?.toIso8601String(),
        'account_number': accountNumber,
        'account_name': accountName,
        'bank_name': bankName,
        'bank_code': bankCode,
        'routing_number': routingNumber,
        'is_active': isActive,
        'nick_name': nickName,
        'external_id': externalId,
        'external_provider': externalProvider,
        'type': type,
        'channel': channel,
        'account_type': accountType,
        'email': email,
        'phone_number': phoneNumber,
        'reason': reason,
        'hide': hide,
        'meta_data': metaData,
        'user': user,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [UserBeneficiaryList].
  factory UserBeneficiaryList.fromJson(String data) {
    return UserBeneficiaryList.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [UserBeneficiaryList] to a JSON string.
  String toJson() => json.encode(toMap());

  UserBeneficiaryList copyWith({
    String? id,
    String? currency,
    DateTime? createdAt,
    DateTime? modifiedAt,
    String? accountNumber,
    String? accountName,
    String? bankName,
    String? bankCode,
    dynamic routingNumber,
    bool? isActive,
    String? nickName,
    dynamic externalId,
    String? externalProvider,
    String? type,
    String? channel,
    String? accountType,
    dynamic email,
    String? phoneNumber,
    String? reason,
    bool? hide,
    dynamic metaData,
    String? user,
  }) {
    return UserBeneficiaryList(
      id: id ?? this.id,
      currency: currency ?? this.currency,
      createdAt: createdAt ?? this.createdAt,
      modifiedAt: modifiedAt ?? this.modifiedAt,
      accountNumber: accountNumber ?? this.accountNumber,
      accountName: accountName ?? this.accountName,
      bankName: bankName ?? this.bankName,
      bankCode: bankCode ?? this.bankCode,
      routingNumber: routingNumber ?? this.routingNumber,
      isActive: isActive ?? this.isActive,
      nickName: nickName ?? this.nickName,
      externalId: externalId ?? this.externalId,
      externalProvider: externalProvider ?? this.externalProvider,
      type: type ?? this.type,
      channel: channel ?? this.channel,
      accountType: accountType ?? this.accountType,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      reason: reason ?? this.reason,
      hide: hide ?? this.hide,
      metaData: metaData ?? this.metaData,
      user: user ?? this.user,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! UserBeneficiaryList) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      id.hashCode ^
      currency.hashCode ^
      createdAt.hashCode ^
      modifiedAt.hashCode ^
      accountNumber.hashCode ^
      accountName.hashCode ^
      bankName.hashCode ^
      bankCode.hashCode ^
      routingNumber.hashCode ^
      isActive.hashCode ^
      nickName.hashCode ^
      externalId.hashCode ^
      externalProvider.hashCode ^
      type.hashCode ^
      channel.hashCode ^
      accountType.hashCode ^
      email.hashCode ^
      phoneNumber.hashCode ^
      reason.hashCode ^
      hide.hashCode ^
      metaData.hashCode ^
      user.hashCode;
}
