import 'dart:developer';

import 'package:auth_app/core/constants/api_routes.dart';
import 'package:dio/dio.dart';

class NetWorkServices {
  late Dio _dio;

  NetWorkServices() {
    _dio = Dio(
      BaseOptions(
        baseUrl: ApiRoute.baseUrl,
      ),
    );
    initlizeInterceptors();
  }

  initlizeInterceptors() {
    _dio.interceptors.add(InterceptorsWrapper(
      onError: (error, handler) {
        print(error.message);
      },
      onRequest: (request, handler) {
        print("${request.method} and ${request.path}");
      },
      onResponse: (response, handler) {
        print("${response.data}");
      },
    ));
  }

  
// ======================================================
//======================== POST ==========================
//=======================================================
  ///Post request
  Future<dynamic> post(
    /// the api route without the base url
    String uri, {

    ///this are query parameters that would
    /// be attached to the url
    /// [e.g]=>{"a":"yes"}
    /// https://she.com/getPeople?a=yes
    Map<String, dynamic> queryParameters = const {},
    Object? body,
  }) async {

    try {
      Response response = await _dio.post(
        uri,
        queryParameters: queryParameters,
        data: body,
      );
      // checkRequest(response);

      log(response.statusCode.toString());
      return response.data;
    } on Exception catch (e) {
      print(e);
      rethrow;
    }
  }
}
