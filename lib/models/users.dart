// To parse this JSON data, do
//
//     final users = usersFromJson(jsonString);

import 'dart:convert';

UserApiResponse usersFromJson(String str) =>
    UserApiResponse.fromJson(json.decode(str));

String usersToJson(UserApiResponse data) => json.encode(data.toJson());

class UserApiResponse {
  UserApiResponse({
    this.page,
    this.totalPages,
    this.totalItems,
    this.data,
  });

  int? page;
  int? totalPages;
  int? totalItems;
  List<User>? data;

  factory UserApiResponse.fromJson(Map<String, dynamic> json) =>
      UserApiResponse(
        page: json["page"],
        totalPages: json["total_pages"],
        totalItems: json["total_items"],
        data: json["data"] == null
            ? []
            : List<User>.from(json["data"]!.map((x) => User.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "total_pages": totalPages,
        "total_items": totalItems,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class User {
  User({
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
  String? dateJoined;
  String? createdAt;
  String? modifiedAt;
  String? email;
  String? phoneNumber;
  String? firstName;
  String? lastName;
  String? middleName;
  String? title;
  String? dob;
  String? gender;
  String? nationality1;
  String? nationality2;
  String? countryOfResidence;
  dynamic bvn;
  BvnData? bvnData;
  bool? bvnVerified;
  bool? canTransact;
  bool? emailVerified;
  bool? phoneVerified;
  String? authMethod;
  String? referrerCode;
  String? referralCode;
  String? referralChannel;
  String? occupation;
  bool? eligibleForFreeSwap;
  String? deviceImeNumber;
  String? deviceName;
  String? devicePlatform;
  String? deviceModel;
  String? deviceFcmToken;
  bool? deviceVerified;
  String? riskRating;
  String? riskScore;
  String? firebaseUid;
  dynamic profileImage;
  List<dynamic>? groups;
  List<dynamic>? userPermissions;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        beneficiaries: json["beneficiaries"] == null
            ? []
            : List<dynamic>.from(json["beneficiaries"]!.map((x) => x)),
        wallets: json["wallets"] == null
            ? []
            : List<Wallet>.from(
                json["wallets"]!.map((x) => Wallet.fromJson(x))),
        lastLogin: json["last_login"] ?? "",
        isSuperuser: json["is_superuser"],
        isStaff: json["is_staff"] ?? false,
        isActive: json["is_active"] ?? false,
        dateJoined: json["date_joined"] ?? "",
        createdAt: json["created_at"] ?? "",
        modifiedAt: json["modified_at"] ?? "",
        email: json["email"] ?? "",
        phoneNumber: json["phone_number"] ?? "",
        firstName: json["first_name"],
        lastName: json["last_name"],
        middleName: json["middle_name"],
        title: json["title"],
        dob: json["dob"] ?? "",
        gender: json["gender"] ?? "",
        nationality1: json["nationality_1"] ?? "",
        nationality2: json["nationality_2"] ?? "",
        countryOfResidence: json["country_of_residence"] ?? "",
        bvn: json["bvn"] ?? "",
        bvnData: json["bvn_data"] == null
            ? null
            : BvnData.fromJson(json["bvn_data"]),
        bvnVerified: json["bvn_verified"] ?? false,
        canTransact: json["can_transact"] ?? false,
        emailVerified: json["email_verified"] ?? false,
        phoneVerified: json["phone_verified"] ?? false,
        authMethod: json["auth_method"],
        referrerCode: json["referrer_code"],
        referralCode: json["referral_code"],
        referralChannel: json["referral_channel"],
        occupation: json["occupation"],
        eligibleForFreeSwap: json["eligible_for_free_swap"],
        deviceImeNumber: json["device_ime_number"],
        deviceName: json["device_name"] ?? "",
        devicePlatform: json["device_platform"] ?? "",
        deviceModel: json["device_model"] ?? "",
        deviceFcmToken: json["device_fcm_token"] ?? "",
        deviceVerified: json["device_verified"],
        riskRating: json["risk_rating"] ?? "",
        riskScore: json["risk_score"] ?? "",
        firebaseUid: json["firebase_uid"] ?? "",
        profileImage: json["profile_image"] ?? "",
        groups: json["groups"] == null
            ? []
            : List<dynamic>.from(json["groups"]!.map((x) => x)),
        userPermissions: json["user_permissions"] == null
            ? []
            : List<dynamic>.from(json["user_permissions"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "beneficiaries": beneficiaries == null
            ? []
            : List<dynamic>.from(beneficiaries!.map((x) => x)),
        "wallets": wallets == null
            ? []
            : List<dynamic>.from(wallets!.map((x) => x.toJson())),
        "last_login": lastLogin,
        "is_superuser": isSuperuser,
        "is_staff": isStaff,
        "is_active": isActive,
        "date_joined": dateJoined ?? "",
        "created_at": createdAt ?? "",
        "modified_at": modifiedAt ?? "",
        "email": email,
        "phone_number": phoneNumber,
        "first_name": firstName,
        "last_name": lastName,
        "middle_name": middleName,
        "title": title,
        "dob": dob ?? "",
        "gender": genderValues.reverse[gender],
        "nationality_1": countryOfResidenceValues.reverse[nationality1],
        "nationality_2": nationality2,
        "country_of_residence":
            countryOfResidenceValues.reverse[countryOfResidence],
        "bvn": bvn,
        "bvn_data": bvnData?.toJson(),
        "bvn_verified": bvnVerified,
        "can_transact": canTransact,
        "email_verified": emailVerified,
        "phone_verified": phoneVerified,
        "auth_method": authMethod,
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
        "groups":
            groups == null ? [] : List<dynamic>.from(groups!.map((x) => x)),
        "user_permissions": userPermissions == null
            ? []
            : List<dynamic>.from(userPermissions!.map((x) => x)),
      };
}

enum AuthMethod { FIREBASE }

final authMethodValues = EnumValues({"firebase": AuthMethod.FIREBASE});

class BvnData {
  BvnData();

  factory BvnData.fromJson(Map<String, dynamic> json) => BvnData();

  Map<String, dynamic> toJson() => {};
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

final devicePlatformValues = EnumValues({"android": DevicePlatform.ANDROID});

enum Gender { F, M }

final genderValues = EnumValues({"F": Gender.F, "M": Gender.M});

enum RiskRating { MEDIUM, HIGH }

final riskRatingValues =
    EnumValues({"high": RiskRating.HIGH, "medium": RiskRating.MEDIUM});

class Wallet {
  Wallet({
    this.id,
    this.currency,
    this.approvedFundingSources,
    this.createdAt,
    this.availableBalance,
    this.ledgerBalance,
    this.user,
    this.tier,
    this.totalDebitForTheYear,
    this.totalCreditForTheYear,
    this.totalDebitForTheMonth,
    this.totalCreditForTheMonth,
    this.totalDebitForTheWeek,
    this.totalCreditForTheWeek,
    this.totalDebitForTheDay,
    this.totalCreditForTheDay,
    this.modifiedAt,
    this.status,
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
    this.address,
    this.usernationalidentity,
  });

  String? id;
  String? currency;
  List<dynamic>? approvedFundingSources;
  DateTime? createdAt;
  int? availableBalance;
  int? ledgerBalance;
  String? user;
  Tier? tier;
  int? totalDebitForTheYear;
  int? totalCreditForTheYear;
  int? totalDebitForTheMonth;
  int? totalCreditForTheMonth;
  int? totalDebitForTheWeek;
  int? totalCreditForTheWeek;
  int? totalDebitForTheDay;
  int? totalCreditForTheDay;
  DateTime? modifiedAt;
  String? status;
  String? totalBalance;
  String? provider;
  String? clientId;
  String? accountId;
  String? accountNumber;
  String? accountName;
  String? bankCode;
  String? bankName;
  DateTime? activationDate;
  String? idvUrl;
  String? address;
  String? usernationalidentity;

  factory Wallet.fromJson(Map<String, dynamic> json) => Wallet(
    id: json["id"],
    currency: json["currency"] ?? "",
    approvedFundingSources: json["approved_funding_sources"] == null ? [] : List<dynamic>.from(json["approved_funding_sources"]!.map((x) => x)),
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    availableBalance: json["available_balance"],
    ledgerBalance: json["ledger_balance"],
    user: json["user"],
    tier: json["tier"] == null ? null : Tier.fromJson(json["tier"]),
    totalDebitForTheYear: json["total_debit_for_the_year"],
    totalCreditForTheYear: json["total_credit_for_the_year"],
    totalDebitForTheMonth: json["total_debit_for_the_month"],
    totalCreditForTheMonth: json["total_credit_for_the_month"],
    totalDebitForTheWeek: json["total_debit_for_the_week"],
    totalCreditForTheWeek: json["total_credit_for_the_week"],
    totalDebitForTheDay: json["total_debit_for_the_day"],
    totalCreditForTheDay: json["total_credit_for_the_day"],
    modifiedAt: json["modified_at"] == null ? null : DateTime.parse(json["modified_at"]),
    status: json["status"] ??"",
    totalBalance: json["total_balance"],
    provider: json["provider"] ?? "",
    clientId: json["client_id"],
    accountId: json["account_id"],
    accountNumber: json["account_number"],
    accountName: json["account_name"],
    bankCode: json["bank_code"] ?? "",
    bankName: json["bank_name"] ?? "",
    activationDate: json["activation_date"] == null ? null : DateTime.parse(json["activation_date"]),
    idvUrl: json["idv_url"],
    address: json["address"],
    usernationalidentity: json["usernationalidentity"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "currency": currency,
    "approved_funding_sources": approvedFundingSources == null ? [] : List<dynamic>.from(approvedFundingSources!.map((x) => x)),
    "created_at": createdAt?.toIso8601String(),
    "available_balance": availableBalance,
    "ledger_balance": ledgerBalance,
    "user": user,
    "tier": tier?.toJson(),
    "total_debit_for_the_year": totalDebitForTheYear,
    "total_credit_for_the_year": totalCreditForTheYear,
    "total_debit_for_the_month": totalDebitForTheMonth,
    "total_credit_for_the_month": totalCreditForTheMonth,
    "total_debit_for_the_week": totalDebitForTheWeek,
    "total_credit_for_the_week": totalCreditForTheWeek,
    "total_debit_for_the_day": totalDebitForTheDay,
    "total_credit_for_the_day": totalCreditForTheDay,
    "modified_at": modifiedAt?.toIso8601String(),
    "status": status,
    "total_balance": totalBalance,
    "provider": provider,
    "client_id": clientId,
    "account_id": accountId,
    "account_number": accountNumber,
    "account_name": accountName,
    "bank_code": bankCode,
    "bank_name": bankName,
    "activation_date": activationDate?.toIso8601String(),
    "idv_url": idvUrl,
    "address": address,
    "usernationalidentity": usernationalidentity,
  };
}
class Tier {
  Tier({
    this.id,
    this.createdAt,
    this.modifiedAt,
    this.name,
    this.maxDailySpendAmount,
    this.maxWeeklySpendAmount,
    this.maxMonthlySpendAmount,
    this.maxAnnualSpendAmount,
    this.maxBalanceAllowed,
    this.currency,
  });

  String? id;
  DateTime? createdAt;
  DateTime? modifiedAt;
  int? name;
  String? maxDailySpendAmount;
  String? maxWeeklySpendAmount;
  String? maxMonthlySpendAmount;
  String? maxAnnualSpendAmount;
  String? maxBalanceAllowed;
  String? currency;

  factory Tier.fromJson(Map<String, dynamic> json) => Tier(
    id: json["id"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    modifiedAt: json["modified_at"] == null ? null : DateTime.parse(json["modified_at"]),
    name: json["name"],
    maxDailySpendAmount: json["max_daily_spend_amount"],
    maxWeeklySpendAmount: json["max_weekly_spend_amount"],
    maxMonthlySpendAmount: json["max_monthly_spend_amount"],
    maxAnnualSpendAmount: json["max_annual_spend_amount"],
    maxBalanceAllowed: json["max_balance_allowed"],
    currency: json["currency"] ??"",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "created_at": createdAt?.toIso8601String(),
    "modified_at": modifiedAt?.toIso8601String(),
    "name": name,
    "max_daily_spend_amount": maxDailySpendAmount,
    "max_weekly_spend_amount": maxWeeklySpendAmount,
    "max_monthly_spend_amount": maxMonthlySpendAmount,
    "max_annual_spend_amount": maxAnnualSpendAmount,
    "max_balance_allowed": maxBalanceAllowed,
    "currency": currency ?? "",
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
