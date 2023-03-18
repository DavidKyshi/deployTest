import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:kyshi_operations_dashboard/helper/dialogs.dart';

import '../helper/internalDio.dart';
import '../helper/screen_export.dart';

class UserService {
  Future<Response?> login(
      BuildContext context, Map<String, dynamic> data) async {
    print("$data LOGIN CREDENTILAS");
    try {
      Response response =
          await customInternalDio.post("/ops/login/", data: data);
      print("${response.data} message after login");
      return response;
    } catch (e) {
      if (e is DioError) {
        Provider.of<UsersProvider>(context, listen: false)
            .setLoginError(e.response?.data["detail"]);
        print("${e.response?.data} login errorssssss");
      }
      return null;
    }
  }

  Future<Map<String, dynamic>> enable2FA(BuildContext context) async {
    final token =
        Provider.of<UsersProvider>(context, listen: false).accessToken;
    print("$token admin token");
    try {
      Response response = await customInternalDio.get("/ops/enable-2FA",
          options: Options(headers: {"authorization": "Bearer $token"}));
      print("${response.data["otp_url"]} 2fa url after login");
      return response.data;
    } catch (e) {
      if (e is DioError) {
        throw e.response?.data;
      }
      rethrow;
    }
  }

  Future<Response> verifyOtp(
      {required String data, required BuildContext context}) async {
    final token =
        Provider.of<UsersProvider>(context, listen: false).accessToken;
    try {
      Response response = await customInternalDio.get("/ops/verify-otp",
          queryParameters: {"otp": data},
          options: Options(headers: {"authorization": "Bearer $token"}));
      print("${response.data} RESPONSE FROM OTP ENDPOINT");
      return response;
    } catch (e) {
      if (e is DioError) {
        displayAlert(
            context: context,
            title: "Error",
            success: false,
            content: e.response?.data["error"]);
        print("${e.response?.data} eroor");
      }
      rethrow;
    }
  }

  Future<Map<String, dynamic>> getAllUsers(
      {required BuildContext context,
      String? entrySize,
      int? daysAgo,
      String? startDate,
      String? endDate}) async {
    final token =
        Provider.of<UsersProvider>(context, listen: false).accessToken;
    String baseUrl = dotenv.env['API_URL']!;
    final Uri uri = Uri.parse("$baseUrl/ops/users");

    final Map<String, dynamic> queryPram = {};

// check if entrey size is passed and add to query
    if (entrySize != null) {
      queryPram['entry_size'] = entrySize;
    }
    if (daysAgo != null) {
      queryPram['daysAgo'] = daysAgo;
    }
    if (startDate != null && endDate != null) {
      queryPram['startDate'] = startDate;
      queryPram['endDate'] = endDate;
    }

    print("QUERY PARAM OUTPUT:::::::::::    $queryPram");

    try {
      // customInternalDio.get("/ops/users",)

      Response response = await customInternalDio.get<Map<String, dynamic>>(
          "/ops/users",
          queryParameters: queryPram,
          options: Options(headers: {"authorization": "Bearer $token"}));
      return response.data;
    } catch (e) {
      if (kDebugMode) {
        print("$e An error occurred");
      }
      if (e is DioError) {
        print("${e.response?.data}hkhgjghbjhgbALLUSERS");
        throw e.response?.data;
      }
      rethrow;
    }
  }

  Future getAllKyshiWallet() async {
    String baseUrl = dotenv.env['API_URL']!;
    final Uri uri = Uri.parse("$baseUrl/operations/wallets-datatable/");

    try {
      Response response = await customInternalDio.get(
        "/operations/wallets-datatable/",
      );
      return response.data;
    } catch (e) {
      if (kDebugMode) {
        print("$e An error occurred");
      }
      if (e is DioError) {
        print("${e.response?.data}hkhgjghbjhgb");
        throw e.response?.data;
      }
      rethrow;
    }
  }

//  Future<dynamic> getWalletBalanceResponse({required BuildContext context}) async {
//   final token = Provider.of<UsersProvider>(context, listen: false).accessToken;
//   String baseUrl = dotenv.env['API_URL']!;
//   String url = "$baseUrl/ops/admin/wallet/balance";
//   final Uri uri = Uri.parse(url);
//   try {
//     Response response = await customInternalDio.get<dynamic>(url,
//         options: Options(headers: {"authorization": "Bearer $token"}));

//     return response.data;
//   } catch (e) {
//       if (kDebugMode) {
//         print("$e An error occurred");
//       }
//       if (e is DioError) {
//         print("${e.response?.data}hkhgjghbjhgb");
//         throw e.response?.data;
//       }
//       rethrow;
//     }
//   }

  Future getWalletBalanceResponse({required BuildContext context}) async {
    final token =
        Provider.of<UsersProvider>(context, listen: false).accessToken;
    String baseUrl = dotenv.env['API_URL']!;
    String url = "$baseUrl/ops/admin/wallet/balance";
    final Uri uri = Uri.parse(url);
    try {
      Response response = await customInternalDio.get(url,
          options: Options(headers: {"authorization": "Bearer $token"}));

      if (response.data is List) {
        return List<dynamic>.from(response.data);
      }

      return response.data;
    } catch (e) {
      if (kDebugMode) {
        print("$e An error occurred");
      }
      if (e is DioError) {
        print("${e.response?.data}hkhgjghbjhgb");
        throw e.response?.data;
      }
      rethrow;
    }
  }

  Future<Map<String, dynamic>> getExpressChart(
      {required BuildContext context}) async {
    final token =
        Provider.of<UsersProvider>(context, listen: false).accessToken;
    String baseUrl = dotenv.env['API_URL']!;
    final Uri uri = Uri.parse("$baseUrl/ops/dashboard/express");
    try {
      // customInternalDio.get("/ops/users",)
      Response response = await customInternalDio.get<Map<String, dynamic>>(
          "/ops/dashboard/express",
          options: Options(headers: {"authorization": "Bearer $token"}));
      return response.data;
    } catch (e) {
      if (kDebugMode) {
        print("$e An error occurred");
      }
      if (e is DioError) {
        print("${e.response?.data}hkhgjghbjhgb");
        throw e.response?.data;
      }
      rethrow;
    }
  }

  Future<Map<String, dynamic>> getOfferManagement(String type,
      {String? userId, required BuildContext context}) async {
    final token =
        Provider.of<UsersProvider>(context, listen: false).accessToken;
    String baseUrl = dotenv.env['API_URL']!;
    String url = "";
    if (type == "all") {
      url = "$baseUrl/ops/offers";
    } else if (type == "open") {
      url = "$baseUrl/ops/offers?open_offers=true";
    } else if (type == "closed") {
      url = "$baseUrl/ops/offers?closed_offers=true";
    } else if (type == "accepted") {
      url = "$baseUrl/ops/offers?accepted_offers=true";
    } else if (type == "withdrawn") {
      url = "$baseUrl/ops/offers?withdrawn_offers=true";
    } else if (type == "created_offer") {
      url = "$baseUrl/ops/offers?user_id=$userId";
    } else if (type == "accepted_user_offer") {
      url = "$baseUrl/ops/offers?user_id=$userId&accepted_offers=true";
    }
    final Uri uri = Uri.parse(url);
    try {
      Response response = await customInternalDio.get<Map<String, dynamic>>(url,
          options: Options(headers: {"authorization": "Bearer $token"}));
      // http.get(uri);
      // print("${response.statusCode} ALL THE RESULT");
      // dynamic data = json.decode(response.body);
      print(type);
      return response.data;
    } catch (e) {
      if (kDebugMode) {
        print("$e An error occurred");
      }
      if (e is DioError) {
        print("${e.response?.data}hkhgjghbjhgb");
        throw e.response?.data;
      }
      rethrow;
    }
  }

  Future changePassword(
      {required Map<String, dynamic> data,
      required BuildContext context}) async {
    final token =
        Provider.of<UsersProvider>(context, listen: false).accessToken;
    String baseUrl = dotenv.env['API_URL']!;
    final Uri uri = Uri.parse("$baseUrl/ops/change-password");
    // String basicAuth =
    //     'Basic ${base64.encode(utf8.encode('$username:$password'))}';
    try {
      // customInternalDio.get("/ops/users",)
      print("$data ALL THE DATA TO CHANGE PASSWORD");
      final response = await http.post(uri, body: json.encode(data), headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        "authorization": "Bearer $token"
      });
      dynamic res = json.decode(response.body);
      // Response response = await customInternalDio.post<Map<String, dynamic>>(
      //   "/ops/update-wallet",
      //   data:data
      // );
      print("$res ALL DATA changing password");
      return res;
    } catch (e) {
      print("EROORRRRRRRRR");
      if (kDebugMode) {
        print("$e An error occurred");
      }
      if (e is DioError) {
        print("${e.response?.data}ERROR");
        // throw e.response?.data;
      }
      // rethrow;
    }
  }

  Future<Map<String, dynamic>> getTransactionSummary(
      {required String userId, required BuildContext context}) async {
    final token =
        Provider.of<UsersProvider>(context, listen: false).accessToken;
    String baseUrl = dotenv.env['API_URL']!;
    String url = "$baseUrl/ops/user-transaction-summary?user_id=$userId";
    final Uri uri = Uri.parse(url);
    try {
      // customInternalDio.get("/ops/users",)
      Response response = await customInternalDio.get<Map<String, dynamic>>(url,
          options: Options(headers: {"authorization": "Bearer $token"}));
      return response.data;
    } catch (e) {
      if (kDebugMode) {
        print("$e An error occurred");
      }
      if (e is DioError) {
        print("${e.response?.data}hkhgjghbjhgb");
        throw e.response?.data;
      }
      rethrow;
    }
  }

    Future getAccountBeneficiary(
      {required BuildContext context}) async {
    final token =
        Provider.of<UsersProvider>(context, listen: false).accessToken;
    String baseUrl = dotenv.env['API_URL']!;
    String url = "$baseUrl/ops/admin/beneficiary";
    final Uri uri = Uri.parse(url);
    try {
      // customInternalDio.get("/ops/users",)
      Response response = await customInternalDio.get(url,
          options: Options(headers: {"authorization": "Bearer $token"}));
      return response.data;
    } catch (e) {
      if (kDebugMode) {
        print("$e An error occurred");
      }
      if (e is DioError) {
        print("${e.response?.data}hkhgjghbjhgb");
        throw e.response?.data;
      }
      rethrow;
    }
  }

  Future<Map<String, dynamic>> getKyshiConnectServices(
      {required String userId, required BuildContext context}) async {
    final token =
        Provider.of<UsersProvider>(context, listen: false).accessToken;
    String baseUrl = dotenv.env['API_URL']!;
    final Uri uri = Uri.parse("$baseUrl/ops/kyshi-connect");
    try {
      // customInternalDio.get("/ops/users",)
      Response response = await customInternalDio.get<Map<String, dynamic>>(
          "/ops/kyshi-connect",
          queryParameters: {"user_id": userId},
          options: Options(headers: {"authorization": "Bearer $token"}));
      return response.data;
    } catch (e) {
      if (kDebugMode) {
        print("$e An error occurred");
      }
      if (e is DioError) {
        print("${e.response?.data}hkhgjghbjhgb");
        throw e.response?.data;
      }
      rethrow;
    }
  }

  Future<Map<String, dynamic>> getKyshiConnectTransactions(
      {required String userId, required BuildContext context}) async {
    final token =
        Provider.of<UsersProvider>(context, listen: false).accessToken;
    String baseUrl = dotenv.env['API_URL']!;
    final Uri uri = Uri.parse("$baseUrl/ops/dashboard/transactions");
    try {
      // customInternalDio.get("/ops/users",)
      Response response = await customInternalDio.get<Map<String, dynamic>>(
          "/ops/dashboard/transactions",
          queryParameters: {"user_id": userId},
          options: Options(headers: {"authorization": "Bearer $token"}));
      // print("$response ALL TRANSACTION DATA");
      return response.data;
    } catch (e) {
      if (kDebugMode) {
        print("$e An error occurred");
      }
      if (e is DioError) {
        print("${e.response?.data}hkhgjghbjhgb");
        throw e.response?.data;
      }
      rethrow;
    }
  }

  Future<Map<String, dynamic>> getKyshiCard(
      {required String userId, required BuildContext context}) async {
    String baseUrl = dotenv.env['API_URL']!;
    final Uri uri = Uri.parse("$baseUrl/ops/kyshi-cards");
    try {
      // customInternalDio.get("/ops/users",)
      Response response = await customInternalDio.get<Map<String, dynamic>>(
          "/ops/kyshi-cards",
          queryParameters: {"user_id": userId});
      // print("$response ALL DATA");
      return response.data;
    } catch (e) {
      if (kDebugMode) {
        print("$e An error occurred");
      }
      if (e is DioError) {
        print("${e.response?.data}hkhgjghbjhgb");
        throw e.response?.data;
      }
      rethrow;
    }
  }

  Future<Map<String, dynamic>> getWalletManagement(
      {required BuildContext context, required String entrySize}) async {
    final token =
        Provider.of<UsersProvider>(context, listen: false).accessToken;
    String baseUrl = dotenv.env['API_URL']!;
    final Uri uri = Uri.parse("$baseUrl/ops/wallet-management");
    try {
      Response response = await customInternalDio.get<Map<String, dynamic>>(
          "/ops/wallet-management",
          queryParameters: {"entry_size": entrySize},
          options: Options(headers: {"authorization": "Bearer $token"})
          // queryParameters: {
          //   "status":""
          // }
          );
      // print("${response.data} whhhhhhhhhh ALL DATA");
      return response.data;
    } catch (e) {
      if (kDebugMode) {
        print("$e An error occurred");
      }
      if (e is DioError) {
        print("${e.response?.data}ERROR MESSAGE");
        throw e.response?.data;
      }
      rethrow;
    }
  }

  Future updateWalletStatus(
      {required Map<String, dynamic> data,
      required BuildContext context}) async {
    final token =
        Provider.of<UsersProvider>(context, listen: false).accessToken;
    String baseUrl = dotenv.env['API_URL']!;
    final Uri uri = Uri.parse("$baseUrl/ops/wallet-comments");
    String basicAuth =
        'Basic ${base64.encode(utf8.encode('$username:$password'))}';
    try {
      // customInternalDio.get("/ops/users",)
      print("$data ALL THE DATA");
      final response = await http.post(uri, body: json.encode(data), headers: {
        "authorization": "Bearer $token",
        HttpHeaders.contentTypeHeader: 'application/json',
      });
      dynamic res = json.decode(response.body);
      print("$res ALL DATA from updating wallet status");
      return res;
    } catch (e) {
      if (kDebugMode) {
        print("$e An error occurred");
      }
      if (e is DioError) {
        print("${e.response?.data}ERROR");
        // throw e.response?.data;
      }
      rethrow;
    }
  }

  Future<Map<String, dynamic>> getWalletComments(
      {required BuildContext context}) async {
    final token =
        Provider.of<UsersProvider>(context, listen: false).accessToken;
    String baseUrl = dotenv.env['API_URL']!;
    final Uri uri = Uri.parse("$baseUrl/ops/wallet-comments");
    try {
      Response response = await customInternalDio.get<Map<String, dynamic>>(
          "/ops/wallet-management",
          options: Options(headers: {"authorization": "Bearer $token"})
          // queryParameters: {
          //   "status":""
          // }
          );
      // print("$response ALL DATA");
      return response.data;
    } catch (e) {
      if (kDebugMode) {
        print("$e An error occurred");
      }
      if (e is DioError) {
        print("${e.response?.data}ERROR MESSAGE");
        throw e.response?.data;
      }
      rethrow;
    }
  }

  // Future<Map<String, dynamic>> getPayoutTransactions(String type, BuildContext context) async {
  //   final token = Provider.of<UsersProvider>(context, listen: false).accessToken;
  Future<Map<String, dynamic>> getPayoutTransactions(
      String type, BuildContext context) async {
    final token =
        Provider.of<UsersProvider>(context, listen: false).accessToken;
    String baseUrl = dotenv.env['API_URL']!;
    String url = "";
    if (type == "all") {
      url = "$baseUrl/ops/dashboard/transactions";
    } else if (type == "pending") {
      url = "$baseUrl/ops/dashboard/transactions?pending=true";
    } else if (type == "failed") {
      url = "$baseUrl/ops/dashboard/transactions?failed=true";
    } else if (type == "completed") {
      url = "$baseUrl/ops/dashboard/transactions?completed=true";
    } else if (type == "reversed") {
      url = "$baseUrl/ops/offers?reversed=true";
    }
    final Uri uri = Uri.parse(url);
    try {
      Response response = await customInternalDio.get<Map<String, dynamic>>(url,
          options: Options(headers: {"authorization": "Bearer $token"}));
      // http.get(uri);
      // print("${response.statusCode} ALL THE RESULT");
      // dynamic data = json.decode(response.body);
      print(type);
      return response.data;
    } catch (e) {
      if (kDebugMode) {
        print("$e An error occurred");
      }
      if (e is DioError) {
        print("${e.response?.data}hkhgjghbjhgb");
        throw e.response?.data;
      }
      rethrow;
    }
  }

  Future<Map<String, dynamic>> exportCsv(
      {required BuildContext context}) async {
    final token =
        Provider.of<UsersProvider>(context, listen: false).accessToken;
    String baseUrl = dotenv.env['API_URL']!;
    // final Uri uri = Uri.parse("$baseUrl/ops/wallet-comments");
    try {
      Response response = await customInternalDio.get<Map<String, dynamic>>(
          "/ops/user/csv",
          options: Options(headers: {"authorization": "Bearer $token"})
          // queryParameters: {
          //   "status":""
          // }
          );
      print("${response.data} ALL DATA exporting");
      return response.data;
    } catch (e) {
      if (kDebugMode) {
        print("$e An error occurred");
      }
      if (e is DioError) {
        print("${e.response?.data}ERROR MESSAGE");
        throw e.response?.data;
      }
      rethrow;
    }
  }
}
