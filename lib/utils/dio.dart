import 'package:dio/dio.dart';
import 'package:e_library_nama_elib_mobile/config/base_url.dart';

class DioInstance {
  static Dio instance = Dio();
  static configureDio() {
    instance.options.baseUrl = BaseUrl.baseUrl;
    instance.options.connectTimeout = Duration(seconds: 5);
    instance.options.receiveTimeout = Duration(seconds: 3);
    instance.interceptors.add(InterceptorsWrapper(
      onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
        return handler.next(options);
      },
      onResponse: (Response response, ResponseInterceptorHandler handler) {
        return handler.next(response);
      },
      onError: (DioException error, ErrorInterceptorHandler handler) {
        return handler.reject(error);
      },
    ));
  }
}
