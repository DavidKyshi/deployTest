import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../helper/internalDio.dart';
import '../helper/screen_export.dart';

class OverViewService {
  Future<Map<String, dynamic>> getOverViewOffers(
      {required BuildContext context,
      required String status,
      required String baseCurrency,
      required int daysAgo}) async {
    final token =
        Provider.of<UsersProvider>(context, listen: false).accessToken;
    String baseUrl = dotenv.env['API_URL']!;
    // final Uri uri = Uri.parse("$baseUrl/ops/dashboard/express");
    try {
      // customInternalDio.get("/ops/users",)
      // print("$status $baseCurrency $daysAgo ALL PARAMETERS");
      Response response = await customInternalDio.get<Map<String, dynamic>>(
          "/ops/dashboard/offers",
          queryParameters: {
            "status": status,
            "base_currency": baseCurrency,
            "days_ago": daysAgo
          },
          options: Options(headers: {"authorization": "Bearer $token"}));
      print("OFFER DATA RETURNED");
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

  Future<Map<String, dynamic>> getMarketPlaceOfferOverView(
      {required BuildContext context,
      required String baseCurrency,
      required String quoteCurrency,
      required int daysAgo}) async {
    final token =
        Provider.of<UsersProvider>(context, listen: false).accessToken;
    String baseUrl = dotenv.env['API_URL']!;
    final Uri uri = Uri.parse("$baseUrl/ops/dashboard/marketplace/offer");
    try {
      // customInternalDio.get("/ops/users",)
      // print("$baseCurrency $quoteCurrency $daysAgo ALL PARAMETERS for MARKETPLACE OVERVIEW");
      Response response = await customInternalDio.get<Map<String, dynamic>>(
          "/ops/dashboard/marketplace/offer",
          queryParameters: {
            "base_currency": baseCurrency,
            "quote_currency": quoteCurrency,
            "days_ago": daysAgo
          },
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

  Future<Map<String, dynamic>> getMarketPlaceRevenue(
      {required BuildContext context, required int daysAgo}) async {
    final token =
        Provider.of<UsersProvider>(context, listen: false).accessToken;
    String baseUrl = dotenv.env['API_URL']!;
    final Uri uri = Uri.parse("$baseUrl/ops/dashboard/marketplace/revenue");
    try {
      // customInternalDio.get("/ops/users",)
      // print("$status $baseCurrency $daysAgo ALL PARAMETERS");
      Response response = await customInternalDio.get<Map<String, dynamic>>(
          "/ops/dashboard/marketplace/revenue",
          queryParameters: {"days_ago": daysAgo},
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

  Future<Map<String, dynamic>> getKyshiConnectOverView(
      {required BuildContext context,
      required int daysAgo,
      required String connectService}) async {
    final token =
        Provider.of<UsersProvider>(context, listen: false).accessToken;
    String baseUrl = dotenv.env['API_URL']!;
    final Uri uri = Uri.parse("$baseUrl/ops/dashboard/connect");
    String url = "";
      if(connectService == "airtime"){
        url = "$baseUrl/ops/dashboard/connect?entry_size=$daysAgo&airtime=true";
      }else if(connectService == "data"){
        url = "$baseUrl/ops/dashboard/connect?entry_size=$daysAgo&data=true";
      }else{
        url = "$baseUrl/ops/dashboard/connect?entry_size=$daysAgo&health=true";
      }
      // print("$url CHECKING CONNECT URL");
    try {
      // customInternalDio.get("/ops/users",)
      // print("$status $baseCurrency $daysAgo ALL PARAMETERS");
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

  Future<Map<String, dynamic>> getKyshiConnectGraph(
      {required BuildContext context, required int daysAgo, required String connectService, required String connectBaseCur}) async {
    final token =
        Provider.of<UsersProvider>(context, listen: false).accessToken;
    String baseUrl = dotenv.env['API_URL']!;
    final Uri uri = Uri.parse("$baseUrl/ops/connect/dashboard");
    try {
      // customInternalDio.get("/ops/users",)
      // print("$status $baseCurrency $daysAgo ALL PARAMETERS");
      Response response = await customInternalDio.get<Map<String, dynamic>>(
          "/ops/connect/dashboard",
          queryParameters: {
            "days_ago": daysAgo,
            "connect":connectService,
            "base_currency":connectBaseCur
          },
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
  Future<Map<String, dynamic>> getExpressChart(
      {required BuildContext context,required int daysAgo}) async {
    final token =
        Provider.of<UsersProvider>(context, listen: false).accessToken;
    String baseUrl = dotenv.env['API_URL']!;
    final Uri uri = Uri.parse("$baseUrl/ops/dashboard/express");
    try {
      // customInternalDio.get("/ops/users",)
      Response response = await customInternalDio.get<Map<String, dynamic>>(
          "/ops/dashboard/express",
          queryParameters: {
            "days_ago":daysAgo
          },
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
}
