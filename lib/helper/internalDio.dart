import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class InternalDioClient {
  late Dio dio;
  InternalDioClient() {
    BaseOptions options = BaseOptions(
        baseUrl: dotenv.env['API_URL']!,
        connectTimeout: const Duration(seconds: 12000),
        headers: {
          "Content-Type": "application/json",
          "Connection": 'keep-alive',
          "x-api-key": dotenv.env['INTERNAL_TOKEN']
        });
    dio = Dio(options);
  }
}

Dio customInternalDio = InternalDioClient().dio;