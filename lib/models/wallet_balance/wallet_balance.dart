import 'dart:convert';

import 'package:collection/collection.dart';

import '../../helper/screen_export.dart';
import 'tier.dart';

@immutable
class WalletBalance {
  final String? id;
  final String? currency;
  final List<dynamic>? approvedFundingSources;
  final String? createdAt;
  final double? availableBalance;
  final double? ledgerBalance;
  final String? user;
  final TierData? tierdata;
  final int? totalDebitForTheYear;
  final int? totalCreditForTheYear;
  final int? totalDebitForTheMonth;
  final int? totalCreditForTheMonth;
  final int? totalDebitForTheWeek;
  final int? totalCreditForTheWeek;
  final int? totalDebitForTheDay;
  final int? totalCreditForTheDay;
  final DateTime? modifiedAt;
  final String? status;
  final String? totalBalance;
  final String? provider;
  final dynamic clientId;
  final dynamic accountId;
  final String? accountNumber;
  final String? accountName;
  final dynamic bankCode;
  final dynamic bankName;
  final dynamic activationDate;
  final dynamic idvUrl;
  final dynamic address;
  final dynamic usernationalidentity;

  const WalletBalance({
    this.id,
    this.currency,
    this.approvedFundingSources,
    this.createdAt,
    this.availableBalance,
    this.ledgerBalance,
    this.user,
    this.tierdata,
    this.totalDebitForTheYear,
    this.totalCreditForTheYear,
    this.totalDebitForTheMonth,
    this.totalCreditForTheMonth,
    this.totalDebitForTheWeek,
    this.totalCreditForTheWeek,
    this.totalDebitForTheDay,
    this.totalCreditForTheDay,
    this.modifiedAt,
    this.status,
    this.totalBalance,
    this.provider,
    this.clientId,
    this.accountId,
    this.accountNumber,
    this.accountName,
    this.bankCode,
    this.bankName,
    this.activationDate,
    this.idvUrl,
    this.address,
    this.usernationalidentity,
  });

  @override
  String toString() {
    return 'WalletBalance(id: $id, currency: $currency, approvedFundingSources: $approvedFundingSources, createdAt: $createdAt, availableBalance: $availableBalance, ledgerBalance: $ledgerBalance, user: $user, tierdata: $tierdata, totalDebitForTheYear: $totalDebitForTheYear, totalCreditForTheYear: $totalCreditForTheYear, totalDebitForTheMonth: $totalDebitForTheMonth, totalCreditForTheMonth: $totalCreditForTheMonth, totalDebitForTheWeek: $totalDebitForTheWeek, totalCreditForTheWeek: $totalCreditForTheWeek, totalDebitForTheDay: $totalDebitForTheDay, totalCreditForTheDay: $totalCreditForTheDay, modifiedAt: $modifiedAt, status: $status, totalBalance: $totalBalance, provider: $provider, clientId: $clientId, accountId: $accountId, accountNumber: $accountNumber, accountName: $accountName, bankCode: $bankCode, bankName: $bankName, activationDate: $activationDate, idvUrl: $idvUrl, address: $address, usernationalidentity: $usernationalidentity)';
  }

  factory WalletBalance.fromMap(Map<String, dynamic> data) => WalletBalance(
        id: data['id'] as String?,
        currency: data['currency'] as String?,
        approvedFundingSources:
            data['approved_funding_sources'] as List<dynamic>?,
        createdAt: data['created_at'] as String?,
        availableBalance: data['available_balance'] as double?,
        ledgerBalance: data['ledger_balance'] as double?,
        user: data['user'] as String?,
        tierdata: data['tier'] == null
            ? null
            : TierData.fromMap(data['tier'] as Map<String, dynamic>),
        totalDebitForTheYear: data['total_debit_for_the_year'] as int?,
        totalCreditForTheYear: data['total_credit_for_the_year'] as int?,
        totalDebitForTheMonth: data['total_debit_for_the_month'] as int?,
        totalCreditForTheMonth: data['total_credit_for_the_month'] as int?,
        totalDebitForTheWeek: data['total_debit_for_the_week'] as int?,
        totalCreditForTheWeek: data['total_credit_for_the_week'] as int?,
        totalDebitForTheDay: data['total_debit_for_the_day'] as int?,
        totalCreditForTheDay: data['total_credit_for_the_day'] as int?,
        modifiedAt: data['modified_at'] == null
            ? null
            : DateTime.parse(data['modified_at'] as String),
        status: data['status'] as String?,
        totalBalance: data['total_balance'] as String?,
        provider: data['provider'] as String?,
        clientId: data['client_id'] as dynamic,
        accountId: data['account_id'] as dynamic,
        accountNumber: data['account_number'] as String?,
        accountName: data['account_name'] as String?,
        bankCode: data['bank_code'] as dynamic,
        bankName: data['bank_name'] as dynamic,
        activationDate: data['activation_date'] as dynamic,
        idvUrl: data['idv_url'] as dynamic,
        address: data['address'] as dynamic,
        usernationalidentity: data['usernationalidentity'] as dynamic,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'currency': currency,
        'approved_funding_sources': approvedFundingSources,
        'created_at': createdAt,
        'available_balance': availableBalance,
        'ledger_balance': ledgerBalance,
        'user': user,
        'tierdata': tierdata?.toMap(),
        'total_debit_for_the_year': totalDebitForTheYear,
        'total_credit_for_the_year': totalCreditForTheYear,
        'total_debit_for_the_month': totalDebitForTheMonth,
        'total_credit_for_the_month': totalCreditForTheMonth,
        'total_debit_for_the_week': totalDebitForTheWeek,
        'total_credit_for_the_week': totalCreditForTheWeek,
        'total_debit_for_the_day': totalDebitForTheDay,
        'total_credit_for_the_day': totalCreditForTheDay,
        'modified_at': modifiedAt?.toIso8601String(),
        'status': status,
        'total_balance': totalBalance,
        'provider': provider,
        'client_id': clientId,
        'account_id': accountId,
        'account_number': accountNumber,
        'account_name': accountName,
        'bank_code': bankCode,
        'bank_name': bankName,
        'activation_date': activationDate,
        'idv_url': idvUrl,
        'address': address,
        'usernationalidentity': usernationalidentity,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [WalletBalance].
  factory WalletBalance.fromJson(String data) {
    return WalletBalance.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [WalletBalance] to a JSON string.
  String toJson() => json.encode(toMap());

  WalletBalance copyWith({
    String? id,
    String? currency,
    List<dynamic>? approvedFundingSources,
    String? createdAt,
    double? availableBalance,
    double? ledgerBalance,
    String? user,
    TierData? tierdata,
    int? totalDebitForTheYear,
    int? totalCreditForTheYear,
    int? totalDebitForTheMonth,
    int? totalCreditForTheMonth,
    int? totalDebitForTheWeek,
    int? totalCreditForTheWeek,
    int? totalDebitForTheDay,
    int? totalCreditForTheDay,
    DateTime? modifiedAt,
    String? status,
    String? totalBalance,
    String? provider,
    dynamic clientId,
    dynamic accountId,
    String? accountNumber,
    String? accountName,
    dynamic bankCode,
    dynamic bankName,
    dynamic activationDate,
    dynamic idvUrl,
    dynamic address,
    dynamic usernationalidentity,
  }) {
    return WalletBalance(
      id: id ?? this.id,
      currency: currency ?? this.currency,
      approvedFundingSources:
          approvedFundingSources ?? this.approvedFundingSources,
      createdAt: createdAt ?? this.createdAt,
      availableBalance: availableBalance ?? this.availableBalance,
      ledgerBalance: ledgerBalance ?? this.ledgerBalance,
      user: user ?? this.user,
      tierdata: tierdata ?? this.tierdata,
      totalDebitForTheYear: totalDebitForTheYear ?? this.totalDebitForTheYear,
      totalCreditForTheYear:
          totalCreditForTheYear ?? this.totalCreditForTheYear,
      totalDebitForTheMonth:
          totalDebitForTheMonth ?? this.totalDebitForTheMonth,
      totalCreditForTheMonth:
          totalCreditForTheMonth ?? this.totalCreditForTheMonth,
      totalDebitForTheWeek: totalDebitForTheWeek ?? this.totalDebitForTheWeek,
      totalCreditForTheWeek:
          totalCreditForTheWeek ?? this.totalCreditForTheWeek,
      totalDebitForTheDay: totalDebitForTheDay ?? this.totalDebitForTheDay,
      totalCreditForTheDay: totalCreditForTheDay ?? this.totalCreditForTheDay,
      modifiedAt: modifiedAt ?? this.modifiedAt,
      status: status ?? this.status,
      totalBalance: totalBalance ?? this.totalBalance,
      provider: provider ?? this.provider,
      clientId: clientId ?? this.clientId,
      accountId: accountId ?? this.accountId,
      accountNumber: accountNumber ?? this.accountNumber,
      accountName: accountName ?? this.accountName,
      bankCode: bankCode ?? this.bankCode,
      bankName: bankName ?? this.bankName,
      activationDate: activationDate ?? this.activationDate,
      idvUrl: idvUrl ?? this.idvUrl,
      address: address ?? this.address,
      usernationalidentity: usernationalidentity ?? this.usernationalidentity,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! WalletBalance) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      id.hashCode ^
      currency.hashCode ^
      approvedFundingSources.hashCode ^
      createdAt.hashCode ^
      availableBalance.hashCode ^
      ledgerBalance.hashCode ^
      user.hashCode ^
      tierdata.hashCode ^
      totalDebitForTheYear.hashCode ^
      totalCreditForTheYear.hashCode ^
      totalDebitForTheMonth.hashCode ^
      totalCreditForTheMonth.hashCode ^
      totalDebitForTheWeek.hashCode ^
      totalCreditForTheWeek.hashCode ^
      totalDebitForTheDay.hashCode ^
      totalCreditForTheDay.hashCode ^
      modifiedAt.hashCode ^
      status.hashCode ^
      totalBalance.hashCode ^
      provider.hashCode ^
      clientId.hashCode ^
      accountId.hashCode ^
      accountNumber.hashCode ^
      accountName.hashCode ^
      bankCode.hashCode ^
      bankName.hashCode ^
      activationDate.hashCode ^
      idvUrl.hashCode ^
      address.hashCode ^
      usernationalidentity.hashCode;
}
