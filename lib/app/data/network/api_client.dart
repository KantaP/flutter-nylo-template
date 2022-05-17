import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_app/app/data/network/constants/endpoints.dart';
import 'package:flutter_app/app/di/components/injection.dart';
import 'package:flutter_app/app/models/post.dart';
import 'package:retrofit/retrofit.dart';

part 'api_client.g.dart';

@RestApi()
abstract class ApiClient {
  
  factory ApiClient(Dio dio, String baseUrl) {
    dio.options = BaseOptions(receiveTimeout: 30000, connectTimeout: 30000);
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          if (kDebugMode) {
            logger.i(
              'REQUEST[${options.method}] ===> PATH: ${options.baseUrl}${options.path} \nREQUEST HEADERS: ${options.headers} \nREQUEST PARAMS: ${options.queryParameters.toString()} \nREQUEST BODY: ${options.data.toString()}',
            );
          }

          return handler.next(options);
        },
        onResponse: (e, handler) {
          if (kDebugMode) {
            logger.i(
              'RESPONSE[${e.requestOptions.method}] <=== PATH: ${e.requestOptions.baseUrl}${e.requestOptions.path} \nRAW RESPONSE: $e',
            );
          }

          return handler.next(e);
        },
        onError: (DioError e, handler) {
          if (kDebugMode) {
            logger.e(
              'ERROR[${e.requestOptions.method}] <=== PATH: ${e.requestOptions.baseUrl}${e.requestOptions.path} \nRAW ERROR RESPONSE: ${e.response}',
            );
          }

          return handler.next(e);
        },
      ),
    );
    return _ApiClient(dio, baseUrl: baseUrl);
  }

  @GET(Endpoints.getPost)
  Future<List<Post>> getPost();
}
