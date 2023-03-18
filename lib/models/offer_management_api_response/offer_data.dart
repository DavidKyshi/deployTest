import 'dart:convert';

import 'package:collection/collection.dart';

import '../../helper/screen_export.dart';

@immutable
class OfferData {
  final String? id;
  final String? user;
  final String? email;
  final DateTime? createdAt;
  final DateTime? modifiedAt;
  final String? status;
  final String? baseAmount;
  final String? quoteAmount;
  final int? baseFee;
  final int? quoteFee;
  final String? exchangeRate;
  final String? creatorNarration;
  final String? acceptorNarration;
  final dynamic acceptedAt;
  final bool? quoteFundsPaid;
  final bool? baseFundsPaid;
  final bool? eligibleForFreeSwap;
  final DateTime? expiresAt;
  final bool? repostAtKyshiRate;
  final dynamic metadata;
  final String? createdBy;
  final String? baseCurrency;
  final String? quoteCurrency;
  final String? createrBaseWallet;
  final String? createrQuoteWallet;
  final dynamic createrQuoteBeneficiary;
  final dynamic acceptedBy;
  final dynamic accepterBaseBeneficiary;
  final dynamic accepterBaseWallet;
  final dynamic accepterQuoteWallet;
  final List<dynamic>? likedBy;

  const OfferData({
    this.id,
    this.user,
    this.email,
    this.createdAt,
    this.modifiedAt,
    this.status,
    this.baseAmount,
    this.quoteAmount,
    this.baseFee,
    this.quoteFee,
    this.exchangeRate,
    this.creatorNarration,
    this.acceptorNarration,
    this.acceptedAt,
    this.quoteFundsPaid,
    this.baseFundsPaid,
    this.eligibleForFreeSwap,
    this.expiresAt,
    this.repostAtKyshiRate,
    this.metadata,
    this.createdBy,
    this.baseCurrency,
    this.quoteCurrency,
    this.createrBaseWallet,
    this.createrQuoteWallet,
    this.createrQuoteBeneficiary,
    this.acceptedBy,
    this.accepterBaseBeneficiary,
    this.accepterBaseWallet,
    this.accepterQuoteWallet,
    this.likedBy,
  });

  @override
  String toString() {
    return 'Datum(id: $id, user: $user, email:$email, createdAt: $createdAt, modifiedAt: $modifiedAt, status: $status, baseAmount: $baseAmount, quoteAmount: $quoteAmount, baseFee: $baseFee, quoteFee: $quoteFee, exchangeRate: $exchangeRate, creatorNarration: $creatorNarration, acceptorNarration: $acceptorNarration, acceptedAt: $acceptedAt, quoteFundsPaid: $quoteFundsPaid, baseFundsPaid: $baseFundsPaid, eligibleForFreeSwap: $eligibleForFreeSwap, expiresAt: $expiresAt, repostAtKyshiRate: $repostAtKyshiRate, metadata: $metadata, createdBy: $createdBy, baseCurrency: $baseCurrency, quoteCurrency: $quoteCurrency, createrBaseWallet: $createrBaseWallet, createrQuoteWallet: $createrQuoteWallet, createrQuoteBeneficiary: $createrQuoteBeneficiary, acceptedBy: $acceptedBy, accepterBaseBeneficiary: $accepterBaseBeneficiary, accepterBaseWallet: $accepterBaseWallet, accepterQuoteWallet: $accepterQuoteWallet, likedBy: $likedBy)';
  }

  factory OfferData.fromMap(Map<String, dynamic> data) => OfferData(
        id: data['id'] as String?,
        user: data['user'] as String?,
        email: data['email'] as String?,
        createdAt: data['created_at'] == null
            ? null
            : DateTime.parse(data['created_at'] as String),
        modifiedAt: data['modified_at'] == null
            ? null
            : DateTime.parse(data['modified_at'] as String),
        status: data['status'] as String?,
        baseAmount: data['base_amount'] as String?,
        quoteAmount: data['quote_amount'] as String?,
        baseFee: data['base_fee'] as int?,
        quoteFee: data['quote_fee'] as int?,
        exchangeRate: data['exchange_rate'] as String?,
        creatorNarration: data['creator_narration'] as String?,
        acceptorNarration: data['acceptor_narration'] as String?,
        acceptedAt: data['accepted_at'] as dynamic,
        quoteFundsPaid: data['quote_funds_paid'] as bool?,
        baseFundsPaid: data['base_funds_paid'] as bool?,
        eligibleForFreeSwap: data['eligible_for_free_swap'] as bool?,
        expiresAt: data['expires_at'] == null
            ? null
            : DateTime.parse(data['expires_at'] as String),
        repostAtKyshiRate: data['repost_at_kyshi_rate'] as bool?,
        metadata: data['metadata'] as dynamic,
        createdBy: data['created_by'] as String?,
        baseCurrency: data['base_currency'] as String?,
        quoteCurrency: data['quote_currency'] as String?,
        createrBaseWallet: data['creater_base_wallet'] as String?,
        createrQuoteWallet: data['creater_quote_wallet'] as String?,
        createrQuoteBeneficiary: data['creater_quote_beneficiary'] as dynamic,
        acceptedBy: data['accepted_by'] as dynamic,
        accepterBaseBeneficiary: data['accepter_base_beneficiary'] as dynamic,
        accepterBaseWallet: data['accepter_base_wallet'] as dynamic,
        accepterQuoteWallet: data['accepter_quote_wallet'] as dynamic,
        likedBy: data['liked_by'] as List<dynamic>?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'user': user,
        'email':email,
        'created_at': createdAt?.toIso8601String(),
        'modified_at': modifiedAt?.toIso8601String(),
        'status': status,
        'base_amount': baseAmount,
        'quote_amount': quoteAmount,
        'base_fee': baseFee,
        'quote_fee': quoteFee,
        'exchange_rate': exchangeRate,
        'creator_narration': creatorNarration,
        'acceptor_narration': acceptorNarration,
        'accepted_at': acceptedAt,
        'quote_funds_paid': quoteFundsPaid,
        'base_funds_paid': baseFundsPaid,
        'eligible_for_free_swap': eligibleForFreeSwap,
        'expires_at': expiresAt?.toIso8601String(),
        'repost_at_kyshi_rate': repostAtKyshiRate,
        'metadata': metadata,
        'created_by': createdBy,
        'base_currency': baseCurrency,
        'quote_currency': quoteCurrency,
        'creater_base_wallet': createrBaseWallet,
        'creater_quote_wallet': createrQuoteWallet,
        'creater_quote_beneficiary': createrQuoteBeneficiary,
        'accepted_by': acceptedBy,
        'accepter_base_beneficiary': accepterBaseBeneficiary,
        'accepter_base_wallet': accepterBaseWallet,
        'accepter_quote_wallet': accepterQuoteWallet,
        'liked_by': likedBy,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Datum].
  factory OfferData.fromJson(String data) {
    return OfferData.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Datum] to a JSON string.
  String toJson() => json.encode(toMap());

  OfferData copyWith({
    String? id,
    String? user,
    DateTime? createdAt,
    DateTime? modifiedAt,
    String? status,
    String? baseAmount,
    String? quoteAmount,
    int? baseFee,
    int? quoteFee,
    String? exchangeRate,
    String? creatorNarration,
    String? acceptorNarration,
    dynamic acceptedAt,
    bool? quoteFundsPaid,
    bool? baseFundsPaid,
    bool? eligibleForFreeSwap,
    DateTime? expiresAt,
    bool? repostAtKyshiRate,
    dynamic metadata,
    String? createdBy,
    String? baseCurrency,
    String? quoteCurrency,
    String? createrBaseWallet,
    String? createrQuoteWallet,
    dynamic createrQuoteBeneficiary,
    dynamic acceptedBy,
    dynamic accepterBaseBeneficiary,
    dynamic accepterBaseWallet,
    dynamic accepterQuoteWallet,
    List<dynamic>? likedBy,
  }) {
    return OfferData(
      id: id ?? this.id,
      user: user ?? this.user,
      email:email?? this.email,
      createdAt: createdAt ?? this.createdAt,
      modifiedAt: modifiedAt ?? this.modifiedAt,
      status: status ?? this.status,
      baseAmount: baseAmount ?? this.baseAmount,
      quoteAmount: quoteAmount ?? this.quoteAmount,
      baseFee: baseFee ?? this.baseFee,
      quoteFee: quoteFee ?? this.quoteFee,
      exchangeRate: exchangeRate ?? this.exchangeRate,
      creatorNarration: creatorNarration ?? this.creatorNarration,
      acceptorNarration: acceptorNarration ?? this.acceptorNarration,
      acceptedAt: acceptedAt ?? this.acceptedAt,
      quoteFundsPaid: quoteFundsPaid ?? this.quoteFundsPaid,
      baseFundsPaid: baseFundsPaid ?? this.baseFundsPaid,
      eligibleForFreeSwap: eligibleForFreeSwap ?? this.eligibleForFreeSwap,
      expiresAt: expiresAt ?? this.expiresAt,
      repostAtKyshiRate: repostAtKyshiRate ?? this.repostAtKyshiRate,
      metadata: metadata ?? this.metadata,
      createdBy: createdBy ?? this.createdBy,
      baseCurrency: baseCurrency ?? this.baseCurrency,
      quoteCurrency: quoteCurrency ?? this.quoteCurrency,
      createrBaseWallet: createrBaseWallet ?? this.createrBaseWallet,
      createrQuoteWallet: createrQuoteWallet ?? this.createrQuoteWallet,
      createrQuoteBeneficiary:
          createrQuoteBeneficiary ?? this.createrQuoteBeneficiary,
      acceptedBy: acceptedBy ?? this.acceptedBy,
      accepterBaseBeneficiary:
          accepterBaseBeneficiary ?? this.accepterBaseBeneficiary,
      accepterBaseWallet: accepterBaseWallet ?? this.accepterBaseWallet,
      accepterQuoteWallet: accepterQuoteWallet ?? this.accepterQuoteWallet,
      likedBy: likedBy ?? this.likedBy,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! OfferData) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      id.hashCode ^
      user.hashCode ^
      email.hashCode ^
      createdAt.hashCode ^
      modifiedAt.hashCode ^
      status.hashCode ^
      baseAmount.hashCode ^
      quoteAmount.hashCode ^
      baseFee.hashCode ^
      quoteFee.hashCode ^
      exchangeRate.hashCode ^
      creatorNarration.hashCode ^
      acceptorNarration.hashCode ^
      acceptedAt.hashCode ^
      quoteFundsPaid.hashCode ^
      baseFundsPaid.hashCode ^
      eligibleForFreeSwap.hashCode ^
      expiresAt.hashCode ^
      repostAtKyshiRate.hashCode ^
      metadata.hashCode ^
      createdBy.hashCode ^
      baseCurrency.hashCode ^
      quoteCurrency.hashCode ^
      createrBaseWallet.hashCode ^
      createrQuoteWallet.hashCode ^
      createrQuoteBeneficiary.hashCode ^
      acceptedBy.hashCode ^
      accepterBaseBeneficiary.hashCode ^
      accepterBaseWallet.hashCode ^
      accepterQuoteWallet.hashCode ^
      likedBy.hashCode;
}
