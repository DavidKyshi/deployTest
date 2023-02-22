import 'dart:convert';

import 'package:collection/collection.dart';

import '../../helper/screen_export.dart';
import 'offer_data.dart';

@immutable
class OfferManagementApiResponse {
  final int? page;
  final int? totalPages;
  final int? totalItems;
  final List<OfferData>? data;
  final String? status;

  const OfferManagementApiResponse({
    this.page,
    this.totalPages,
    this.totalItems,
    this.data,
    this.status,
  });

  @override
  String toString() {
    return 'OfferManagementApiResponse(page: $page, totalPages: $totalPages, totalItems: $totalItems, data: $data, status: $status)';
  }

  factory OfferManagementApiResponse.fromMap(Map<String, dynamic> data) {
    return OfferManagementApiResponse(
      page: data['page'] as int?,
      totalPages: data['total_pages'] as int?,
      totalItems: data['total_items'] as int?,
      data: (data['data'] as List<dynamic>?)
          ?.map((e) => OfferData.fromMap(e as Map<String, dynamic>))
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
  /// Parses the string and returns the resulting Json object as [OfferManagementApiResponse].
  factory OfferManagementApiResponse.fromJson(String data) {
    return OfferManagementApiResponse.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [OfferManagementApiResponse] to a JSON string.
  String toJson() => json.encode(toMap());

  OfferManagementApiResponse copyWith({
    int? page,
    int? totalPages,
    int? totalItems,
    List<OfferData>? data,
    String? status,
  }) {
    return OfferManagementApiResponse(
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
    if (other is! OfferManagementApiResponse) return false;
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
