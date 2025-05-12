import 'package:cars_store/core/networking/api_services.dart';
import 'package:cars_store/feature/auth/data/repo/auth_repo_impl.dart';
import 'package:cars_store/feature/auth/domain/repo/auth_repo.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupDependencies() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  getIt.registerSingleton<AuthRepo>(AuthRepoImpl(api: getIt<ApiService>()));
}
