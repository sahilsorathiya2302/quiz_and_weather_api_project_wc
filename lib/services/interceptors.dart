import 'package:dio/dio.dart';
import 'package:quiz_api_project_wc/core/secret/api_string.dart';

class DefaultInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers[ApiString.contentType] == ApiString.applicationXWWW;
    options.headers[ApiString.accept] = ApiString.applicationJson;

    options.connectTimeout = Duration(seconds: 30);
    options.sendTimeout = Duration(seconds: 30);
    options.receiveTimeout = Duration(seconds: 30);

    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    handler.next(err);
  }
}
