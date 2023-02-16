import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import '../helper/internalDio.dart';

class UserService{
  Future<Response> postUser ({required Map<String, dynamic> data})async{
    try{
      Response response = await customInternalDio.post("the url to call",
      data: data,
        options: Options(
          headers: {
            "authorization": "Bearer token"
          }
        )
      );
      return response;
    }catch(e){
      if (e is DioError){
        throw e.response?.data;
      }
      rethrow;
    }
  }

  Future<Response> getAllUsers ()async{
    String baseUrl = dotenv.env['API_URL']!;
    final Uri uri = Uri.parse("$baseUrl/ops/users");
    try{
      // customInternalDio.get("/ops/users",)
      final response = await http.get(uri);
      dynamic data = json.decode(response.body);
      return data;
    }catch(e){
      if (kDebugMode) {
        print("$e An error occurred");
      }
      if (e is DioError){
        print("${e.response?.data}hkhgjghbjhgb");
        throw e.response?.data;
      }
      rethrow;
    }
  }

}