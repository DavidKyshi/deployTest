import 'dart:convert';

import 'package:collection/collection.dart';

import '../helper/screen_export.dart';

@immutable
class ExpressChart {
  final int? expressTransferSum;
  final int? expressTransferGbpSum;
  final int? expressTransferUsdSum;
  final int? expressTransferCadSum;
  final int? totalCountExpressTransfer;
  final int? totalCountExpressTransferGbp;
  final int? totalCountExpressTransferUsd;
  final int? totalCountExpressTransferCad;
  final int? successfullCountExpressTransfer;
  final int? pendingCountExpressTransfer;
  final int? failedCountExpressTransfer;
  final String? status;

  const ExpressChart({
    this.expressTransferSum,
    this.expressTransferGbpSum,
    this.expressTransferUsdSum,
    this.expressTransferCadSum,
    this.totalCountExpressTransfer,
    this.totalCountExpressTransferGbp,
    this.totalCountExpressTransferUsd,
    this.totalCountExpressTransferCad,
    this.successfullCountExpressTransfer,
    this.pendingCountExpressTransfer,
    this.failedCountExpressTransfer,
    this.status,
  });

  @override
  String toString() {
    return 'ExpressChart(expressTransferSum: $expressTransferSum, expressTransferGbpSum: $expressTransferGbpSum, expressTransferUsdSum: $expressTransferUsdSum, expressTransferCadSum: $expressTransferCadSum, totalCountExpressTransfer: $totalCountExpressTransfer, totalCountExpressTransferGbp: $totalCountExpressTransferGbp, totalCountExpressTransferUsd: $totalCountExpressTransferUsd, totalCountExpressTransferCad: $totalCountExpressTransferCad, successfullCountExpressTransfer: $successfullCountExpressTransfer, pendingCountExpressTransfer: $pendingCountExpressTransfer, failedCountExpressTransfer: $failedCountExpressTransfer, status: $status)';
  }

  factory ExpressChart.fromMap(Map<String, dynamic> data) => ExpressChart(
        expressTransferSum: data['express_transfer_sum'] as int?,
        expressTransferGbpSum: data['express_transfer_gbp_sum'] as int?,
        expressTransferUsdSum: data['express_transfer_usd_sum'] as int?,
        expressTransferCadSum: data['express_transfer_cad_sum'] as int?,
        totalCountExpressTransfer: data['total_count_express_transfer'] as int?,
        totalCountExpressTransferGbp:
            data['total_count_express_transfer_gbp'] as int?,
        totalCountExpressTransferUsd:
            data['total_count_express_transfer_usd'] as int?,
        totalCountExpressTransferCad:
            data['total_count_express_transfer_cad'] as int?,
        successfullCountExpressTransfer:
            data['successfull_count_express_transfer'] as int?,
        pendingCountExpressTransfer:
            data['pending_count_express_transfer'] as int?,
        failedCountExpressTransfer:
            data['failed_count_express_transfer'] as int?,
        status: data['status'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'express_transfer_sum': expressTransferSum,
        'express_transfer_gbp_sum': expressTransferGbpSum,
        'express_transfer_usd_sum': expressTransferUsdSum,
        'express_transfer_cad_sum': expressTransferCadSum,
        'total_count_express_transfer': totalCountExpressTransfer,
        'total_count_express_transfer_gbp': totalCountExpressTransferGbp,
        'total_count_express_transfer_usd': totalCountExpressTransferUsd,
        'total_count_express_transfer_cad': totalCountExpressTransferCad,
        'successfull_count_express_transfer': successfullCountExpressTransfer,
        'pending_count_express_transfer': pendingCountExpressTransfer,
        'failed_count_express_transfer': failedCountExpressTransfer,
        'status': status,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ExpressChart].
  factory ExpressChart.fromJson(String data) {
    return ExpressChart.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ExpressChart] to a JSON string.
  String toJson() => json.encode(toMap());

  ExpressChart copyWith({
    int? expressTransferSum,
    int? expressTransferGbpSum,
    int? expressTransferUsdSum,
    int? expressTransferCadSum,
    int? totalCountExpressTransfer,
    int? totalCountExpressTransferGbp,
    int? totalCountExpressTransferUsd,
    int? totalCountExpressTransferCad,
    int? successfullCountExpressTransfer,
    int? pendingCountExpressTransfer,
    int? failedCountExpressTransfer,
    String? status,
  }) {
    return ExpressChart(
      expressTransferSum: expressTransferSum ?? this.expressTransferSum,
      expressTransferGbpSum:
          expressTransferGbpSum ?? this.expressTransferGbpSum,
      expressTransferUsdSum:
          expressTransferUsdSum ?? this.expressTransferUsdSum,
      expressTransferCadSum:
          expressTransferCadSum ?? this.expressTransferCadSum,
      totalCountExpressTransfer:
          totalCountExpressTransfer ?? this.totalCountExpressTransfer,
      totalCountExpressTransferGbp:
          totalCountExpressTransferGbp ?? this.totalCountExpressTransferGbp,
      totalCountExpressTransferUsd:
          totalCountExpressTransferUsd ?? this.totalCountExpressTransferUsd,
      totalCountExpressTransferCad:
          totalCountExpressTransferCad ?? this.totalCountExpressTransferCad,
      successfullCountExpressTransfer: successfullCountExpressTransfer ??
          this.successfullCountExpressTransfer,
      pendingCountExpressTransfer:
          pendingCountExpressTransfer ?? this.pendingCountExpressTransfer,
      failedCountExpressTransfer:
          failedCountExpressTransfer ?? this.failedCountExpressTransfer,
      status: status ?? this.status,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! ExpressChart) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      expressTransferSum.hashCode ^
      expressTransferGbpSum.hashCode ^
      expressTransferUsdSum.hashCode ^
      expressTransferCadSum.hashCode ^
      totalCountExpressTransfer.hashCode ^
      totalCountExpressTransferGbp.hashCode ^
      totalCountExpressTransferUsd.hashCode ^
      totalCountExpressTransferCad.hashCode ^
      successfullCountExpressTransfer.hashCode ^
      pendingCountExpressTransfer.hashCode ^
      failedCountExpressTransfer.hashCode ^
      status.hashCode;
}
