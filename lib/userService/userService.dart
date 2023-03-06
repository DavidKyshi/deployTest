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

  Future<Response?> login(BuildContext context, Map<String,dynamic> data) async {
    print("$data LOGIN CREDENTILAS");
    try {
      Response response = await customInternalDio.post("/ops/login/",
        data: data
      );
      print("${response.data} message after login");
      return response;
    } catch (e) {
      if (e is DioError) {
        // showMessageDialog(
        //   context,
        //   error,
        //   "Error",
        //   btnFunction: () {
        //     Navigator.pop(context);
        //   },
        //   additionalBtnFunction: () {},
        //   additionalButtonColor: Colors.red,
        //   headline: 'Error',
        //   message:
        //   "Please check your auth app",
        //   subMessage: "Passwords must be be 8-32 Numbers"
        //       "Capital Letter and should be alphanumeric e.g, Alsdty123",
        //   name: ' Olamide',
        // );
        print("${e.response?.data} login errorssssss");
      }
      return null;
    }

  }
  Future<Map<String, dynamic>> enable2FA( BuildContext context) async {
    final token = Provider.of<UsersProvider>(context, listen: false).accessToken;
    print("$token admin token");
    try {
      Response response = await customInternalDio.get("/ops/enable-2FA",
        options: Options(headers: {
          "authorization": "Bearer $token"
        })
      );
      print("${response.data["otp_url"]} 2fa url after login");
      return response.data;
    } catch (e) {
      if (e is DioError) {
        throw e.response?.data;
      }
      rethrow;
    }
  }
  Future<Response> verifyOtp({required String data,required BuildContext context}) async {
    final token = Provider.of<UsersProvider>(context, listen: false).accessToken;
    try {
      Response response = await customInternalDio.get("/ops/verify-otp",
        queryParameters: {"otp":data},
        options: Options(
          headers: {
            "authorization":"Bearer $token"
          }
        )
      );
      print("${response.data} RESPONSE FROM OTP ENDPOINT");
      return response;
    } catch (e) {
      if (e is DioError) {
       displayAlert(context: context,title: "Error",success: false,content: e.response?.data["error"]);
       print("${ e.response?.data} eroor");
      }
      rethrow;
    }
  }

  Future<Map<String, dynamic>> getAllUsers({required BuildContext context}) async {
    final token = Provider.of<UsersProvider>(context, listen: false).accessToken;
    String baseUrl = dotenv.env['API_URL']!;
    final Uri uri = Uri.parse("$baseUrl/ops/users");
    try {
      // customInternalDio.get("/ops/users",)
      Response response = await customInternalDio.get<Map<String, dynamic>>(
        "/ops/users",
        queryParameters: {
          "entry_size":"30"
        },
          options: Options(
              headers: {
                "authorization":"Bearer $token"
              }
          )
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

  Future<Map<String, dynamic>> getOfferManagement() async {
    String baseUrl = dotenv.env['API_URL']!;
    final Uri uri = Uri.parse("$baseUrl/ops/offers");
    try {
      Response response = await customInternalDio.get<Map<String, dynamic>>(
        "/ops/offers",
        // queryParameters:{
        //   "open_offer":false,
        //   "closed_offers":false,
        //   "accepted_offers":false,
        //   "withdrawn_offers":false,
        //   "expired_offers":false,
        //   "offer_id":false
        //   }
      );
      // http.get(uri);
      // print("${response.statusCode} ALL THE RESULT");
      // dynamic data = json.decode(response.body);
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

  Future<Map<String, dynamic>> getKyshiConnectServices({required String userId}) async {
    String baseUrl = dotenv.env['API_URL']!;
    final Uri uri = Uri.parse("$baseUrl/ops/kyshi-connect");
    try {
      // customInternalDio.get("/ops/users",)
      Response response = await customInternalDio.get<Map<String, dynamic>>(
        "/ops/kyshi-connect",
        queryParameters: {
          "user_id":userId
        }
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

  Future<Map<String, dynamic>> getKyshiConnectTransactions({required String userId}) async {
    String baseUrl = dotenv.env['API_URL']!;
    final Uri uri = Uri.parse("$baseUrl/ops/dashboard/transactions");
    try {
      // customInternalDio.get("/ops/users",)
      Response response = await customInternalDio.get<Map<String, dynamic>>(
          "/ops/dashboard/transactions",
          queryParameters: {
            "user_id":userId
          }
      );
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

  Future<Map<String, dynamic>> getKyshiCard({required String userId}) async {
    String baseUrl = dotenv.env['API_URL']!;
    final Uri uri = Uri.parse("$baseUrl/ops/kyshi-cards");
    try {
      // customInternalDio.get("/ops/users",)
      Response response = await customInternalDio.get<Map<String, dynamic>>(
          "/ops/kyshi-cards",
          queryParameters: {
            "user_id":userId
          }
      );
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
  Future<Map<String, dynamic>> getWalletManagement() async {
    String baseUrl = dotenv.env['API_URL']!;
    final Uri uri = Uri.parse("$baseUrl/ops/wallet-management");
    try {
      Response response = await customInternalDio.get<Map<String, dynamic>>(
          "/ops/wallet-management",
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
  Future updateWalletStatus({required Map<String, dynamic> data}) async {
    String baseUrl = dotenv.env['API_URL']!;
    final Uri uri = Uri.parse("$baseUrl/ops/wallet-comments");
    String basicAuth =
        'Basic ${base64.encode(utf8.encode('$username:$password'))}';
    try {
      // customInternalDio.get("/ops/users",)
      print("$data ALL THE DATA");
    final response = await http.post(uri,body: json.encode(data),headers: {
      "authorization":basicAuth
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
  Future<Map<String, dynamic>> getWalletComments() async {
    String baseUrl = dotenv.env['API_URL']!;
    final Uri uri = Uri.parse("$baseUrl/ops/wallet-comments");
    try {
      Response response = await customInternalDio.get<Map<String, dynamic>>(
        "/ops/wallet-management",
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
  Future changePassword({required Map<String, dynamic> data, required BuildContext context}) async {
    final token = Provider.of<UsersProvider>(context, listen: false).accessToken;
    String baseUrl = dotenv.env['API_URL']!;
    final Uri uri = Uri.parse("$baseUrl/ops/change-password");
    // String basicAuth =
    //     'Basic ${base64.encode(utf8.encode('$username:$password'))}';
    try {
      // customInternalDio.get("/ops/users",)
      print("$data ALL THE DATA TO CHANGE PASSWORD");
      final response = await http.post(uri,body: json.encode(data),headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        "authorization":"Bearer $token"
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
}
