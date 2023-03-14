// import 'dart:convert';
//
// import 'package:collection/collection.dart';
//
// import '../helper/screen_export.dart';
//
// @immutable
// class ExpressChart {
//   final double? expressTransferSum;
//   final double? expressTransferGbpSum;
//   final double? expressTransferUsdSum;
//   final double? expressTransferCadSum;
//   final double? totalCountExpressTransfer;
//   final double? totalCountExpressTransferGbp;
//   final double? totalCountExpressTransferUsd;
//   final double? totalCountExpressTransferCad;
//   final double? successfullCountExpressTransfer;
//   final double? pendingCountExpressTransfer;
//   final double? failedCountExpressTransfer;
//   final String? status;
//
//   const ExpressChart({
//     this.expressTransferSum,
//     this.expressTransferGbpSum,
//     this.expressTransferUsdSum,
//     this.expressTransferCadSum,
//     this.totalCountExpressTransfer,
//     this.totalCountExpressTransferGbp,
//     this.totalCountExpressTransferUsd,
//     this.totalCountExpressTransferCad,
//     this.successfullCountExpressTransfer,
//     this.pendingCountExpressTransfer,
//     this.failedCountExpressTransfer,
//     this.status,
//   });
//
//   @override
//   String toString() {
//     return 'ExpressChart(expressTransferSum: $expressTransferSum, expressTransferGbpSum: $expressTransferGbpSum, expressTransferUsdSum: $expressTransferUsdSum, expressTransferCadSum: $expressTransferCadSum, totalCountExpressTransfer: $totalCountExpressTransfer, totalCountExpressTransferGbp: $totalCountExpressTransferGbp, totalCountExpressTransferUsd: $totalCountExpressTransferUsd, totalCountExpressTransferCad: $totalCountExpressTransferCad, successfullCountExpressTransfer: $successfullCountExpressTransfer, pendingCountExpressTransfer: $pendingCountExpressTransfer, failedCountExpressTransfer: $failedCountExpressTransfer, status: $status)';
//   }
//
//   factory ExpressChart.fromMap(Map<String, dynamic> data) => ExpressChart(
//         expressTransferSum: data['express_transfer_sum'] ?? 0,
//         expressTransferGbpSum: data['express_transfer_gbp_sum'] ?? 0,
//         expressTransferUsdSum: data['express_transfer_usd_sum']  ?? 0,
//         expressTransferCadSum: data['express_transfer_cad_sum'] ?? 0,
//         totalCountExpressTransfer: data['total_count_express_transfer'] ?? 0,
//         totalCountExpressTransferGbp:
//             data['total_count_express_transfer_gbp'] ?? 0,
//         totalCountExpressTransferUsd:
//             data['total_count_express_transfer_usd'] ?? 0,
//         totalCountExpressTransferCad:
//             data['total_count_express_transfer_cad'] ?? 0,
//         successfullCountExpressTransfer:
//             data['successfull_count_express_transfer'] ?? 0,
//         pendingCountExpressTransfer:
//             data['pending_count_express_transfer'] ?? 0,
//         failedCountExpressTransfer:
//             data['failed_count_express_transfer'] ?? 0,
//         status: data['status'] as String?,
//       );
//
//   Map<String, dynamic> toMap() => {
//         'express_transfer_sum': expressTransferSum,
//         'express_transfer_gbp_sum': expressTransferGbpSum,
//         'express_transfer_usd_sum': expressTransferUsdSum,
//         'express_transfer_cad_sum': expressTransferCadSum,
//         'total_count_express_transfer': totalCountExpressTransfer,
//         'total_count_express_transfer_gbp': totalCountExpressTransferGbp,
//         'total_count_express_transfer_usd': totalCountExpressTransferUsd,
//         'total_count_express_transfer_cad': totalCountExpressTransferCad,
//         'successfull_count_express_transfer': successfullCountExpressTransfer,
//         'pending_count_express_transfer': pendingCountExpressTransfer,
//         'failed_count_express_transfer': failedCountExpressTransfer,
//         'status': status,
//       };
//
//   /// `dart:convert`
//   ///
//   /// Parses the string and returns the resulting Json object as [ExpressChart].
//   factory ExpressChart.fromJson(String data) {
//     return ExpressChart.fromMap(json.decode(data) as Map<String, dynamic>);
//   }
//
//   /// `dart:convert`
//   ///
//   /// Converts [ExpressChart] to a JSON string.
//   String toJson() => json.encode(toMap());
//
//   ExpressChart copyWith({
//     double? expressTransferSum,
//     double? expressTransferGbpSum,
//     double? expressTransferUsdSum,
//     double? expressTransferCadSum,
//     double? totalCountExpressTransfer,
//     double? totalCountExpressTransferGbp,
//     double? totalCountExpressTransferUsd,
//     double? totalCountExpressTransferCad,
//     double? successfullCountExpressTransfer,
//     double? pendingCountExpressTransfer,
//     double? failedCountExpressTransfer,
//     String? status,
//   }) {
//     return ExpressChart(
//       expressTransferSum: expressTransferSum ?? this.expressTransferSum,
//       expressTransferGbpSum:
//           expressTransferGbpSum ?? this.expressTransferGbpSum,
//       expressTransferUsdSum:
//           expressTransferUsdSum ?? this.expressTransferUsdSum,
//       expressTransferCadSum:
//           expressTransferCadSum ?? this.expressTransferCadSum,
//       totalCountExpressTransfer:
//           totalCountExpressTransfer ?? this.totalCountExpressTransfer,
//       totalCountExpressTransferGbp:
//           totalCountExpressTransferGbp ?? this.totalCountExpressTransferGbp,
//       totalCountExpressTransferUsd:
//           totalCountExpressTransferUsd ?? this.totalCountExpressTransferUsd,
//       totalCountExpressTransferCad:
//           totalCountExpressTransferCad ?? this.totalCountExpressTransferCad,
//       successfullCountExpressTransfer: successfullCountExpressTransfer ??
//           this.successfullCountExpressTransfer,
//       pendingCountExpressTransfer:
//           pendingCountExpressTransfer ?? this.pendingCountExpressTransfer,
//       failedCountExpressTransfer:
//           failedCountExpressTransfer ?? this.failedCountExpressTransfer,
//       status: status ?? this.status,
//     );
//   }
//
//   @override
//   bool operator ==(Object other) {
//     if (identical(other, this)) return true;
//     if (other is! ExpressChart) return false;
//     final mapEquals = const DeepCollectionEquality().equals;
//     return mapEquals(other.toMap(), toMap());
//   }
//
//   @override
//   int get hashCode =>
//       expressTransferSum.hashCode ^
//       expressTransferGbpSum.hashCode ^
//       expressTransferUsdSum.hashCode ^
//       expressTransferCadSum.hashCode ^
//       totalCountExpressTransfer.hashCode ^
//       totalCountExpressTransferGbp.hashCode ^
//       totalCountExpressTransferUsd.hashCode ^
//       totalCountExpressTransferCad.hashCode ^
//       successfullCountExpressTransfer.hashCode ^
//       pendingCountExpressTransfer.hashCode ^
//       failedCountExpressTransfer.hashCode ^
//       status.hashCode;
// }
// To parse this JSON data, do
//
//     final expressChart = expressChartFromJson(jsonString);

import 'dart:convert';

ExpressChart expressChartFromJson(String str) => ExpressChart.fromJson(json.decode(str));

String expressChartToJson(ExpressChart data) => json.encode(data.toJson());

class ExpressChart {
  ExpressChart({
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

  double? expressTransferSum;
  double? expressTransferGbpSum;
  double? expressTransferUsdSum;
  double? expressTransferCadSum;
  double? totalCountExpressTransfer;
  double? totalCountExpressTransferGbp;
  double? totalCountExpressTransferUsd;
  double? totalCountExpressTransferCad;
  double? successfullCountExpressTransfer;
  double? pendingCountExpressTransfer;
  double? failedCountExpressTransfer;
  String? status;

  factory ExpressChart.fromJson(Map<String, dynamic> json) => ExpressChart(
    expressTransferSum: json["express_transfer_sum"],
    expressTransferGbpSum: json["express_transfer_gbp_sum"],
    expressTransferUsdSum: json["express_transfer_usd_sum"],
    expressTransferCadSum: json["express_transfer_cad_sum"],
    totalCountExpressTransfer: json["total_count_express_transfer"],
    totalCountExpressTransferGbp: json["total_count_express_transfer_gbp"],
    totalCountExpressTransferUsd: json["total_count_express_transfer_usd"],
    totalCountExpressTransferCad: json["total_count_express_transfer_cad"],
    successfullCountExpressTransfer: json["successfull_count_express_transfer"],
    pendingCountExpressTransfer: json["pending_count_express_transfer"],
    failedCountExpressTransfer: json["failed_count_express_transfer"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "express_transfer_sum": expressTransferSum,
    "express_transfer_gbp_sum": expressTransferGbpSum,
    "express_transfer_usd_sum": expressTransferUsdSum,
    "express_transfer_cad_sum": expressTransferCadSum,
    "total_count_express_transfer": totalCountExpressTransfer,
    "total_count_express_transfer_gbp": totalCountExpressTransferGbp,
    "total_count_express_transfer_usd": totalCountExpressTransferUsd,
    "total_count_express_transfer_cad": totalCountExpressTransferCad,
    "successfull_count_express_transfer": successfullCountExpressTransfer,
    "pending_count_express_transfer": pendingCountExpressTransfer,
    "failed_count_express_transfer": failedCountExpressTransfer,
    "status": status,
  };
}

