import 'package:dio/dio.dart';

class DioHelper {
  static var dio = Dio();

  static Future<Response<dynamic>> getData({
    required String url,
    required Map<String, dynamic> query,
}) async{
    dio.options.headers={
      'Content-Type': 'application/json',
    };
    return await dio.get(url, queryParameters: query,);
  }

 static Future<Response<dynamic>> postData({
    required String url,
    required Map<String, dynamic> data,
}) async{
    dio.options.headers={
      'Content-Type': 'application/json',
    };
    return await dio.post(url, data: data,);
  }
}