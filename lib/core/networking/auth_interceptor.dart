import 'package:cars_store/core/cache/cache_constants.dart';
import 'package:cars_store/core/cache/cache_helper.dart';
import 'package:cars_store/core/routing/app_router.dart';
import 'package:cars_store/feature/auth/presentation/views/login_view.dart';
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

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    if (err.response?.statusCode == 401) {
      AppRouter.router.goNamed(LoginView.routeName);
    }
    if (err.response?.statusCode == 403) {
      AppRouter.router.goNamed(LoginView.routeName);
    }

    return handler.next(err);
  }
}
