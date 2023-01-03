import 'package:dio/dio.dart';

class ApiServices {
  late Dio dio;

  ApiServices() {
    BaseOptions baseOptions = BaseOptions();
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

  Future getData({required String url}) async {
    return await dio.get(url);
  }
}
