import 'package:dio/dio.dart';

class ApiServices {
  late Dio dio;

  ApiServices() {
    BaseOptions baseOptions = BaseOptions(
        // baseUrl: 'https://graph.facebook.com/v15.0/me?fields=id%2Cname%2Cposts%7Bfull_picture%2Cmessage%7D&access_token=EAAMuZBf9MrtsBAOLGkZAiORfyFv8RXRZCcWUWeDrktPZCwj4RV88EDTJJ8yqCNtxQ5igb2zXEZAYOFw7MsMe45WUmgjkmZAxkmGuXwodUPVFbyXQDTPBhmBjEcwWqahCOlSh8ZB3eiFQH69ubC8ZAP9VSVPpNSaqyHUjpu8dZC5bc0CUvPhHsu2OH'
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

  Future<dynamic> getData() async {
    return await dio.get(
        'https://graph.facebook.com/v15.0/me?fields=id%2Cname%2Cposts%7Bfull_picture%2Cmessage%7D&access_token=EAAMuZBf9MrtsBAOLGkZAiORfyFv8RXRZCcWUWeDrktPZCwj4RV88EDTJJ8yqCNtxQ5igb2zXEZAYOFw7MsMe45WUmgjkmZAxkmGuXwodUPVFbyXQDTPBhmBjEcwWqahCOlSh8ZB3eiFQH69ubC8ZAP9VSVPpNSaqyHUjpu8dZC5bc0CUvPhHsu2OH');
  }
}
