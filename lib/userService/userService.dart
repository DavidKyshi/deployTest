import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import '../helper/internalDio.dart';

class UserService {
  Future<Response> postUser({required Map<String, dynamic> data}) async {
    try {
      Response response = await customInternalDio.post("the url to call",
          data: data,
          options: Options(headers: {"authorization": "Bearer token"}));
      return response;
    } catch (e) {
      if (e is DioError) {
        throw e.response?.data;
      }
      rethrow;
    }
  }

  Future<Map<String, dynamic>> getAllUsers() async {
    String baseUrl = dotenv.env['API_URL']!;
    final Uri uri = Uri.parse("$baseUrl/ops/users");
    try {
      // customInternalDio.get("/ops/users",)
      Response response = await customInternalDio.get<Map<String, dynamic>>(
        "/ops/users",
      );
      // http.get(uri);
      // print("${response.statusCode} ALL THE RESULT");
      // dynamic data = json.decode(response.body);
      print("$response ALL DATA");
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

  Future<Map<String, dynamic>> getOfferManagement(String type) async {
    String baseUrl = dotenv.env['API_URL']!;
    String url = "";
    if(type== "all"){
       url = "$baseUrl/ops/offers";
   }else if (type == "open"){
      url = "$baseUrl/ops/offers?open_offers=true";
    }else if(type == "closed"){
     url = "$baseUrl/ops/offers?closed_offers=true";
    }else if(type == "accepted"){
     url = "$baseUrl/ops/offers?accepted_offers=true";  
    }else if(type == "withdrawn"){
      url = "$baseUrl/ops/offers?withdrawn_offers=true"; 
    }
    final Uri uri = Uri.parse(url);
    try {
      Response response = await customInternalDio.get<Map<String, dynamic>>(
        url,
      );
      // http.get(uri);
      print("${response.statusCode} ALL THE RESULT");
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
      // http.get(uri);
      // print("${response.statusCode} ALL THE RESULT");
      // dynamic data = json.decode(response.body);
      print("$response ALL DATA");
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

  Future<Map<String, dynamic>> getKyshiConnectTransactions() async {
    String baseUrl = dotenv.env['API_URL']!;
    final Uri uri = Uri.parse("$baseUrl/ops/dashboard/transactions");
    try {
      // customInternalDio.get("/ops/users",)
      Response response = await customInternalDio.get<Map<String, dynamic>>(
          "/ops/dashboard/transactions",
          // queryParameters: {
          //   "user_id":userId
          // }
      );
      // http.get(uri);
      // print("${response.statusCode} ALL THE RESULT");
      // dynamic data = json.decode(response.body);
      print("$response ALL TRANSACTION DATA");
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
      // http.get(uri);
      // print("${response.statusCode} ALL THE RESULT");
      // dynamic data = json.decode(response.body);
      print("$response ALL DATA");
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

}
