import 'package:dio/dio.dart';

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

  Future<Response> getPosts ({required Map<String, dynamic> data})async{
    try{
      Response response = await customInternalDio.get("the url to call",);
      return response.data;
    }catch(e){
      if (e is DioError){
        throw e.response?.data;
      }
      rethrow;
    }
  }

}