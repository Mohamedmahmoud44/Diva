import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    BaseOptions baseOptions = BaseOptions(
        baseUrl: 'https://divanice.com/rest/',
        // // receiveDataWhenStatusError: true,
        // headers: {
        //   'Content-Type': 'application/json',
        // });
    );
    dio = Dio(baseOptions);
    dio.interceptors.add(
      LogInterceptor(
        request: true,
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        responseBody: true,
        error: true,
        logPrint: print,
      ),
    );
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
    };
    return await dio.get(url, queryParameters: query);
  }

  static Future postData({
    required String url,
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
    };
    return dio.post(
      url,
      queryParameters: query,
      data: data,
    );
  }
}
