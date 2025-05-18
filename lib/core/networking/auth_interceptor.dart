import 'package:cars_store/core/cache/cache_constants.dart';
import 'package:cars_store/core/cache/cache_helper.dart';
import 'package:dio/dio.dart';

class AuthInterceptor extends Interceptor {
  AuthInterceptor();

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = CacheHelper.getString(key: CacheKeys.accssToken);

    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    return handler.next(options);
  }
}
