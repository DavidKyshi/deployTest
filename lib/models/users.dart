// To parse this JSON data, do
//
//     final users = usersFromJson(jsonString);

import 'dart:convert';

Users usersFromJson(String str) => Users.fromJson(json.decode(str));

String usersToJson(Users data) => json.encode(data.toJson());

class Users {
  Users({
    this.page,
    this.totalPages,
    this.totalItems,
    this.data,
  });

  int? page;
  int? totalPages;
  int? totalItems;
  List<Datum>? data;

  factory Users.fromJson(Map<String, dynamic> json) => Users(
    page: json["page"],
    totalPages: json["total_pages"],
    totalItems: json["total_items"],
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "page": page,
    "total_pages": totalPages,
    "total_items": totalItems,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.id,
    this.beneficiaries,
    this.wallets,
    this.lastLogin,
    this.isSuperuser,
    this.isStaff,
    this.isActive,
    this.dateJoined,
    this.createdAt,
    this.modifiedAt,
    this.email,
    this.phoneNumber,
    this.firstName,
    this.lastName,
    this.middleName,
    this.title,
    this.dob,
    this.gender,
    this.nationality1,
    this.nationality2,
    this.countryOfResidence,
    this.bvn,
    this.bvnData,
    this.bvnVerified,
    this.canTransact,
    this.emailVerified,
    this.phoneVerified,
    this.authMethod,
    this.referrerCode,
    this.referralCode,
    this.referralChannel,
    this.occupation,
    this.eligibleForFreeSwap,
    this.deviceImeNumber,
    this.deviceName,
    this.devicePlatform,
    this.deviceModel,
    this.deviceFcmToken,
    this.deviceVerified,
    this.riskRating,
    this.riskScore,
    this.firebaseUid,
    this.profileImage,
    this.groups,
    this.userPermissions,
  });

  String? id;
  List<dynamic>? beneficiaries;
  List<Wallet>? wallets;
  dynamic lastLogin;
  bool? isSuperuser;
  bool? isStaff;
  bool? isActive;
  DateTime? dateJoined;
  DateTime? createdAt;
  DateTime? modifiedAt;
  String? email;
  String? phoneNumber;
  String? firstName;
  String? lastName;
  String? middleName;
  String? title;
  DateTime? dob;
  Gender? gender;
  CountryOfResidence? nationality1;
  String? nationality2;
  CountryOfResidence? countryOfResidence;
  dynamic bvn;
  BvnData? bvnData;
  bool? bvnVerified;
  bool? canTransact;
  bool? emailVerified;
  bool? phoneVerified;
  AuthMethod? authMethod;
  String? referrerCode;
  String? referralCode;
  String? referralChannel;
  String? occupation;
  bool? eligibleForFreeSwap;
  String? deviceImeNumber;
  DeviceName? deviceName;
  DevicePlatform? devicePlatform;
  String? deviceModel;
  String? deviceFcmToken;
  bool? deviceVerified;
  RiskRating? riskRating;
  String? riskScore;
  String? firebaseUid;
  dynamic profileImage;
  List<dynamic>? groups;
  List<dynamic>? userPermissions;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    beneficiaries: json["beneficiaries"] == null ? [] : List<dynamic>.from(json["beneficiaries"]!.map((x) => x)),
    wallets: json["wallets"] == null ? [] : List<Wallet>.from(json["wallets"]!.map((x) => Wallet.fromJson(x))),
    lastLogin: json["last_login"],
    isSuperuser: json["is_superuser"],
    isStaff: json["is_staff"],
    isActive: json["is_active"],
    dateJoined: json["date_joined"] == null ? null : DateTime.parse(json["date_joined"]),
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    modifiedAt: json["modified_at"] == null ? null : DateTime.parse(json["modified_at"]),
    email: json["email"],
    phoneNumber: json["phone_number"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    middleName: json["middle_name"],
    title: json["title"],
    dob: json["dob"] == null ? null : DateTime.parse(json["dob"]),
    gender: genderValues.map[json["gender"]]!,
    nationality1: countryOfResidenceValues.map[json["nationality_1"]]!,
    nationality2: json["nationality_2"],
    countryOfResidence: countryOfResidenceValues.map[json["country_of_residence"]]!,
    bvn: json["bvn"],
    bvnData: json["bvn_data"] == null ? null : BvnData.fromJson(json["bvn_data"]),
    bvnVerified: json["bvn_verified"],
    canTransact: json["can_transact"],
    emailVerified: json["email_verified"],
    phoneVerified: json["phone_verified"],
    authMethod: authMethodValues.map[json["auth_method"]]!,
    referrerCode: json["referrer_code"],
    referralCode: json["referral_code"],
    referralChannel: json["referral_channel"],
    occupation: json["occupation"],
    eligibleForFreeSwap: json["eligible_for_free_swap"],
    deviceImeNumber: json["device_ime_number"],
    deviceName: deviceNameValues.map[json["device_name"]]!,
    devicePlatform: devicePlatformValues.map[json["device_platform"]]!,
    deviceModel: json["device_model"],
    deviceFcmToken: json["device_fcm_token"],
    deviceVerified: json["device_verified"],
    riskRating: riskRatingValues.map[json["risk_rating"]]!,
    riskScore: json["risk_score"],
    firebaseUid: json["firebase_uid"],
    profileImage: json["profile_image"],
    groups: json["groups"] == null ? [] : List<dynamic>.from(json["groups"]!.map((x) => x)),
    userPermissions: json["user_permissions"] == null ? [] : List<dynamic>.from(json["user_permissions"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "beneficiaries": beneficiaries == null ? [] : List<dynamic>.from(beneficiaries!.map((x) => x)),
    "wallets": wallets == null ? [] : List<dynamic>.from(wallets!.map((x) => x.toJson())),
    "last_login": lastLogin,
    "is_superuser": isSuperuser,
    "is_staff": isStaff,
    "is_active": isActive,
    "date_joined": dateJoined?.toIso8601String(),
    "created_at": createdAt?.toIso8601String(),
    "modified_at": modifiedAt?.toIso8601String(),
    "email": email,
    "phone_number": phoneNumber,
    "first_name": firstName,
    "last_name": lastName,
    "middle_name": middleName,
    "title": title,
    "dob": "${dob!.year.toString().padLeft(4, '0')}-${dob!.month.toString().padLeft(2, '0')}-${dob!.day.toString().padLeft(2, '0')}",
    "gender": genderValues.reverse[gender],
    "nationality_1": countryOfResidenceValues.reverse[nationality1],
    "nationality_2": nationality2,
    "country_of_residence": countryOfResidenceValues.reverse[countryOfResidence],
    "bvn": bvn,
    "bvn_data": bvnData?.toJson(),
    "bvn_verified": bvnVerified,
    "can_transact": canTransact,
    "email_verified": emailVerified,
    "phone_verified": phoneVerified,
    "auth_method": authMethodValues.reverse[authMethod],
    "referrer_code": referrerCode,
    "referral_code": referralCode,
    "referral_channel": referralChannel,
    "occupation": occupation,
    "eligible_for_free_swap": eligibleForFreeSwap,
    "device_ime_number": deviceImeNumber,
    "device_name": deviceNameValues.reverse[deviceName],
    "device_platform": devicePlatformValues.reverse[devicePlatform],
    "device_model": deviceModel,
    "device_fcm_token": deviceFcmToken,
    "device_verified": deviceVerified,
    "risk_rating": riskRatingValues.reverse[riskRating],
    "risk_score": riskScore,
    "firebase_uid": firebaseUid,
    "profile_image": profileImage,
    "groups": groups == null ? [] : List<dynamic>.from(groups!.map((x) => x)),
    "user_permissions": userPermissions == null ? [] : List<dynamic>.from(userPermissions!.map((x) => x)),
  };
}

enum AuthMethod { FIREBASE }

final authMethodValues = EnumValues({
  "firebase": AuthMethod.FIREBASE
});

class BvnData {
  BvnData();

  factory BvnData.fromJson(Map<String, dynamic> json) => BvnData(
  );

  Map<String, dynamic> toJson() => {
  };
}

enum CountryOfResidence { NG, GB, US }

final countryOfResidenceValues = EnumValues({
  "GB": CountryOfResidence.GB,
  "NG": CountryOfResidence.NG,
  "US": CountryOfResidence.US
});

enum DeviceName { REDMI_20_NOTE_205, SM_A217_F, TECNO_20_CC7 }

final deviceNameValues = EnumValues({
  "Redmi%20Note%205": DeviceName.REDMI_20_NOTE_205,
  "SM-A217F": DeviceName.SM_A217_F,
  "TECNO%20CC7": DeviceName.TECNO_20_CC7
});

enum DevicePlatform { ANDROID }

final devicePlatformValues = EnumValues({
  "android": DevicePlatform.ANDROID
});

enum Gender { F, M }

final genderValues = EnumValues({
  "F": Gender.F,
  "M": Gender.M
});

enum RiskRating { MEDIUM, HIGH }

final riskRatingValues = EnumValues({
  "high": RiskRating.HIGH,
  "medium": RiskRating.MEDIUM
});

class Wallet {
  Wallet({
    this.id,
    this.currency,
    this.approvedFundingSources,
    this.createdAt,
    this.modifiedAt,
    this.status,
    this.availableBalance,
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
    this.user,
    this.tier,
    this.address,
    this.usernationalidentity,
  });

  String? id;
  String? currency;
  List<dynamic>? approvedFundingSources;
  DateTime? createdAt;
  DateTime? modifiedAt;
  String? status;
  String? availableBalance;
  String? totalBalance;
  String? provider;
  dynamic clientId;
  dynamic accountId;
  dynamic accountNumber;
  dynamic accountName;
  dynamic bankCode;
  dynamic bankName;
  dynamic activationDate;
  String? idvUrl;
  String? user;
  String? tier;
  String? address;
  String? usernationalidentity;

  factory Wallet.fromJson(Map<String, dynamic> json) => Wallet(
    id: json["id"],
    currency: json["currency"],
    approvedFundingSources: json["approved_funding_sources"] == null ? [] : List<dynamic>.from(json["approved_funding_sources"]!.map((x) => x)),
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    modifiedAt: json["modified_at"] == null ? null : DateTime.parse(json["modified_at"]),
    status: json["status"],
    availableBalance: json["available_balance"],
    totalBalance: json["total_balance"],
    provider: json["provider"],
    clientId: json["client_id"],
    accountId: json["account_id"],
    accountNumber: json["account_number"],
    accountName: json["account_name"],
    bankCode: json["bank_code"],
    bankName: json["bank_name"],
    activationDate: json["activation_date"],
    idvUrl: json["idv_url"],
    user: json["user"],
    tier: json["tier"],
    address: json["address"],
    usernationalidentity: json["usernationalidentity"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "currency": currency,
    "approved_funding_sources": approvedFundingSources == null ? [] : List<dynamic>.from(approvedFundingSources!.map((x) => x)),
    "created_at": createdAt?.toIso8601String(),
    "modified_at": modifiedAt?.toIso8601String(),
    "status": status,
    "available_balance": availableBalance,
    "total_balance": totalBalance,
    "provider": provider,
    "client_id": clientId,
    "account_id": accountId,
    "account_number": accountNumber,
    "account_name": accountName,
    "bank_code": bankCode,
    "bank_name": bankName,
    "activation_date": activationDate,
    "idv_url": idvUrl,
    "user": user,
    "tier": tier,
    "address": address,
    "usernationalidentity": usernationalidentity,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
