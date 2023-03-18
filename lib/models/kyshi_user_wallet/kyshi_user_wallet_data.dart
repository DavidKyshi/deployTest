import 'dart:convert';

import 'package:collection/collection.dart';

import '../../helper/screen_export.dart';

@immutable
class KyshiUserWalletData {
  final String? id;
  final DateTime? createdAt;
  final String? currency;
  final String? status;
  final double? availableBalance;
  final double? totalBalance;
  final int? tierName;
  final String? userId;
  final String? userFirstName;
  final String? userLastName;
  final String? userEmail;
  final String? provider;
  final String? userDob;

  const KyshiUserWalletData({
    this.id,
    this.createdAt,
    this.currency,
    this.status,
    this.availableBalance,
    this.totalBalance,
    this.tierName,
    this.userId,
    this.userFirstName,
    this.userLastName,
    this.userEmail,
    this.provider,
    this.userDob,
  });

  @override
  String toString() {
    return 'Datum(id: $id, createdAt: $createdAt, currency: $currency, status: $status, availableBalance: $availableBalance, totalBalance: $totalBalance, tierName: $tierName, userId: $userId, userFirstName: $userFirstName, userLastName: $userLastName, userEmail: $userEmail, provider: $provider, userDob: $userDob)';
  }

  factory KyshiUserWalletData.fromMap(Map<String, dynamic> data) =>
      KyshiUserWalletData(
        id: data['id'] as String?,
        createdAt: data['created_at'] == null
            ? null
            : DateTime.parse(data['created_at'] as String),
        currency: data['currency'] as String?,
        status: data['status'] as String?,
        availableBalance: (data['available_balance'] as num?)?.toDouble(),
        totalBalance: (data['total_balance'] as num?)?.toDouble(),
        tierName: data['tier__name'] as int?,
        userId: data['user__id'] as String?,
        userFirstName: data['user__first_name'] as String?,
        userLastName: data['user__last_name'] as String?,
        userEmail: data['user__email'] as String?,
        provider: data['provider'] as String?,
        userDob: data['user__dob'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'created_at': createdAt?.toIso8601String(),
        'currency': currency,
        'status': status,
        'available_balance': availableBalance,
        'total_balance': totalBalance,
        'tier__name': tierName,
        'user__id': userId,
        'user__first_name': userFirstName,
        'user__last_name': userLastName,
        'user__email': userEmail,
        'provider': provider,
        'user__dob': userDob,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [KyshiUserWalletData].
  factory KyshiUserWalletData.fromJson(String data) {
    return KyshiUserWalletData.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [KyshiUserWalletData] to a JSON string.
  String toJson() => json.encode(toMap());

  KyshiUserWalletData copyWith({
    String? id,
    DateTime? createdAt,
    String? currency,
    String? status,
    double? availableBalance,
    double? totalBalance,
    int? tierName,
    String? userId,
    String? userFirstName,
    String? userLastName,
    String? userEmail,
    String? provider,
    String? userDob,
  }) {
    return KyshiUserWalletData(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      currency: currency ?? this.currency,
      status: status ?? this.status,
      availableBalance: availableBalance ?? this.availableBalance,
      totalBalance: totalBalance ?? this.totalBalance,
      tierName: tierName ?? this.tierName,
      userId: userId ?? this.userId,
      userFirstName: userFirstName ?? this.userFirstName,
      userLastName: userLastName ?? this.userLastName,
      userEmail: userEmail ?? this.userEmail,
      provider: provider ?? this.provider,
      userDob: userDob ?? this.userDob,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! KyshiUserWalletData) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      id.hashCode ^
      createdAt.hashCode ^
      currency.hashCode ^
      status.hashCode ^
      availableBalance.hashCode ^
      totalBalance.hashCode ^
      tierName.hashCode ^
      userId.hashCode ^
      userFirstName.hashCode ^
      userLastName.hashCode ^
      userEmail.hashCode ^
      provider.hashCode ^
      userDob.hashCode;
}
