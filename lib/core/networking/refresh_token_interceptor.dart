import 'dart:developer';

import 'package:cars_store/core/cache/cache_constants.dart';
import 'package:cars_store/core/cache/cache_helper.dart';
import 'package:cars_store/core/networking/api_keys.dart';
import 'package:cars_store/core/routing/app_router.dart';
import 'package:cars_store/feature/auth/presentation/views/login_view.dart';
import 'package:dio/dio.dart';

class RefreshTokenInterceptor extends Interceptor {
  final Dio dio;
  final accessToken = CacheHelper.getString(key: CacheKeys.accessToken);
  final refreshToken = CacheHelper.getString(key: CacheKeys.refreshToken);

  RefreshTokenInterceptor({required this.dio});

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      final newAccessToken = await getNewToken();
      dio.options.headers['Authorization'] = 'Bearer $newAccessToken';
      return handler.resolve(await dio.fetch(err.requestOptions));
    }
    return handler.next(err);
  }

  Future<String> getNewToken() async {
    try {
      final response = await dio.post(
        ApiKeys.refreshToken,
        data: {"refreshToken": refreshToken},
      );
      final newAccessToken = response.data['token'];
      CacheHelper.setSecureData(
        key: CacheKeys.accessToken,
        value: newAccessToken,
      );
      return newAccessToken;
    } on Exception catch (e) {
      log('Error refreshing token: $e');
      AppRouter.router.goNamed(LoginView.routeName);
      return '';
    } finally {}
  }
}
