import 'dart:convert';

import 'package:collection/collection.dart';

import '../../helper/screen_export.dart';
import 'pay_out_transaction_data.dart';

@immutable
class PayOutTransaction {
  final int? page;
  final int? totalPages;
  final int? totalItems;
  final List<PayOutTransactionUserData>? data;
  final String? status;

  const PayOutTransaction({
    this.page,
    this.totalPages,
    this.totalItems,
    this.data,
    this.status,
  });

  @override
  String toString() {
    return 'PayOutTransaction(page: $page, totalPages: $totalPages, totalItems: $totalItems, data: $data, status: $status)';
  }

  factory PayOutTransaction.fromMap(Map<String, dynamic> data) {
    return PayOutTransaction(
      page: data['page'] as int?,
      totalPages: data['total_pages'] as int?,
      totalItems: data['total_items'] as int?,
      data: (data['data'] as List<dynamic>?)
          ?.map((e) =>
              PayOutTransactionUserData.fromMap(e as Map<String, dynamic>))
          .toList(),
      status: data['status'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'page': page,
        'total_pages': totalPages,
        'total_items': totalItems,
        'data': data?.map((e) => e.toMap()).toList(),
        'status': status,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [PayOutTransaction].
  factory PayOutTransaction.fromJson(String data) {
    return PayOutTransaction.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [PayOutTransaction] to a JSON string.
  String toJson() => json.encode(toMap());

  PayOutTransaction copyWith({
    int? page,
    int? totalPages,
    int? totalItems,
    List<PayOutTransactionUserData>? data,
    String? status,
  }) {
    return PayOutTransaction(
      page: page ?? this.page,
      totalPages: totalPages ?? this.totalPages,
      totalItems: totalItems ?? this.totalItems,
      data: data ?? this.data,
      status: status ?? this.status,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! PayOutTransaction) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      page.hashCode ^
      totalPages.hashCode ^
      totalItems.hashCode ^
      data.hashCode ^
      status.hashCode;
}
