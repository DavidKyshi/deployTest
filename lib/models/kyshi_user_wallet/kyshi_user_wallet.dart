import 'dart:convert';

import 'package:collection/collection.dart';

import '../../helper/screen_export.dart';
import 'kyshi_user_wallet_data.dart';

@immutable
class KyshiUserWallet {
  final dynamic draw;
  final int? recordsTotal;
  final int? recordsFiltered;
  final List<KyshiUserWalletData>? data;

  const KyshiUserWallet({
    this.draw,
    this.recordsTotal,
    this.recordsFiltered,
    this.data,
  });

  @override
  String toString() {
    return 'KyshiUserWallet(draw: $draw, recordsTotal: $recordsTotal, recordsFiltered: $recordsFiltered, data: $data)';
  }

  factory KyshiUserWallet.fromMap(Map<String, dynamic> data) {
    return KyshiUserWallet(
      draw: data['draw'] as dynamic,
      recordsTotal: data['recordsTotal'] as int?,
      recordsFiltered: data['recordsFiltered'] as int?,
      data: (data['data'] as List<dynamic>?)
          ?.map((e) => KyshiUserWalletData.fromMap(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toMap() => {
        'draw': draw,
        'recordsTotal': recordsTotal,
        'recordsFiltered': recordsFiltered,
        'data': data?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [KyshiUserWallet].
  factory KyshiUserWallet.fromJson(String data) {
    return KyshiUserWallet.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [KyshiUserWallet] to a JSON string.
  String toJson() => json.encode(toMap());

  KyshiUserWallet copyWith({
    dynamic draw,
    int? recordsTotal,
    int? recordsFiltered,
    List<KyshiUserWalletData>? data,
  }) {
    return KyshiUserWallet(
      draw: draw ?? this.draw,
      recordsTotal: recordsTotal ?? this.recordsTotal,
      recordsFiltered: recordsFiltered ?? this.recordsFiltered,
      data: data ?? this.data,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! KyshiUserWallet) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      draw.hashCode ^
      recordsTotal.hashCode ^
      recordsFiltered.hashCode ^
      data.hashCode;
}
