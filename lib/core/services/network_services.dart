import 'dart:developer';
import 'package:auth_app/core/constants/api_routes.dart';
import 'package:dio/dio.dart';

class NetWorkServices {
  Dio _dio = Dio();

  NetWorkServices() {
    _dio = Dio(BaseOptions(
      baseUrl: ApiRoute.baseUrl,
      receiveTimeout: 30000, // 15 seconds
      connectTimeout: 30000,
      sendTimeout: 30000,
    ));
    initializeInterceptors();
  }

  initializeInterceptors() {
    _dio.interceptors.add(InterceptorsWrapper(
      onError: (error, handler) {
        log(error.message);
        handler.next(error);
      },
      onRequest: (request, handler) {
        log("${request.method} and ${request.path}");
        handler.next(request);
      },
      onResponse: (response, handler) {
        log("${response.data}");
        handler.next(response);
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
    } on DioError catch (e) {
      log(e.message);
      throw Exception(e.message);
    }
  }
}
