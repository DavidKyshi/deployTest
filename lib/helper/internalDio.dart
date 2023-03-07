import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

String username = 'azeez@azeez.com';
String password = '12345';

class InternalDioClient {
  String basicAuth =
      'Basic ${base64.encode(utf8.encode('$username:$password'))}';
  late Dio dio;
  InternalDioClient() {
    print("$basicAuth authorized header");
    BaseOptions options = BaseOptions(
        baseUrl: dotenv.env['API_URL']!,
        connectTimeout: const Duration(seconds: 12000),
        headers: {
          "Content-Type": "application/json",
          "Connection": 'keep-alive',
          'authorization': basicAuth
          // "x-api-key": dotenv.env['INTERNAL_TOKEN']
        });
    dio = Dio(options);
  }
}

Dio customInternalDio = InternalDioClient().dio;
