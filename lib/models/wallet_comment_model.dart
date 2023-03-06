// To parse this JSON data, do
//
//     final walletCommentModel = walletCommentModelFromJson(jsonString);

import 'dart:convert';

WalletCommentModel walletCommentModelFromJson(String str) => WalletCommentModel.fromJson(json.decode(str));

String walletCommentModelToJson(WalletCommentModel data) => json.encode(data.toJson());

class WalletCommentModel {
  WalletCommentModel({
    this.data,
  });

  List<CommentDetails>? data;

  factory WalletCommentModel.fromJson(Map<String, dynamic> json) => WalletCommentModel(
    data: json["data"] == null ? [] : List<CommentDetails>.from(json["data"]!.map((x) => CommentDetails.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class CommentDetails {
  CommentDetails({
    this.id,
    this.createdAt,
    this.modifiedAt,
    this.subject,
    this.details,
    this.userId,
    this.metadata,
    this.walletId,
  });

  String? id;
  DateTime? createdAt;
  DateTime? modifiedAt;
  String? subject;
  String? details;
  String? userId;
  dynamic metadata;
  String? walletId;

  factory CommentDetails.fromJson(Map<String, dynamic> json) => CommentDetails(
    id: json["id"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    modifiedAt: json["modified_at"] == null ? null : DateTime.parse(json["modified_at"]),
    subject: json["subject"],
    details: json["details"],
    userId: json["user_id"],
    metadata: json["metadata"],
    walletId: json["wallet_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "created_at": createdAt?.toIso8601String(),
    "modified_at": modifiedAt?.toIso8601String(),
    "subject": subject,
    "details": details,
    "user_id": userId,
    "metadata": metadata,
    "wallet_id": walletId,
  };
}
