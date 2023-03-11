import 'dart:convert';

import 'package:collection/collection.dart';

import '../../helper/screen_export.dart';
import 'transaction_summary_user_data.dart';

@immutable
class TransactionSummaryData {
  final TransactionSummaryUserData? data;
  final String? status;

  const TransactionSummaryData({this.data, this.status});

  @override
  String toString() {
    return 'TransactionSummaryData(data: $data, status: $status)';
  }

  factory TransactionSummaryData.fromMap(Map<String, dynamic> data) {
    return TransactionSummaryData(
      data: data['data'] == null
          ? null
          : TransactionSummaryUserData.fromMap(data['data'] as Map<String, dynamic>),
      status: data['status'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'data': data?.toMap(),
        'status': status,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [TransactionSummaryData].
  factory TransactionSummaryData.fromJson(String data) {
    return TransactionSummaryData.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [TransactionSummaryData] to a JSON string.
  String toJson() => json.encode(toMap());

  TransactionSummaryData copyWith({
    TransactionSummaryUserData? data,
    String? status,
  }) {
    return TransactionSummaryData(
      data: data ?? this.data,
      status: status ?? this.status,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! TransactionSummaryData) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode => data.hashCode ^ status.hashCode;
}
