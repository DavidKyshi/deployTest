// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    this.refresh,
    this.access,
    this.email,
    this.firstName,
    this.lastName,
    this.isActive,
    this.isComplianceAdmin,
    this.isAdminChangedPassword,
    this.is2FaEnabled,
    this.status,
  });

  String? refresh;
  String? access;
  String? email;
  dynamic firstName;
  dynamic lastName;
  bool? isActive;
  bool? isComplianceAdmin;
  bool? isAdminChangedPassword;
  bool? is2FaEnabled;
  bool? status;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        refresh: json["refresh"],
        access: json["access"],
        email: json["email"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        isActive: json["is_active"],
        isComplianceAdmin: json["is_compliance_admin"],
        isAdminChangedPassword: json["is_admin_changed_password"],
        is2FaEnabled: json["is_2fa_enabled"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "refresh": refresh,
        "access": access,
        "email": email,
        "first_name": firstName,
        "last_name": lastName,
        "is_active": isActive,
        "is_compliance_admin": isComplianceAdmin,
        "is_admin_changed_password": isAdminChangedPassword,
        "is_2fa_enabled": is2FaEnabled,
        "status": status,
      };
}
