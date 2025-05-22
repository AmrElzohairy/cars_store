import 'package:cars_store/core/networking/api_services.dart';
import 'package:cars_store/feature/auth/data/repo/auth_repo_impl.dart';
import 'package:cars_store/feature/auth/domain/repo/auth_repo.dart';
import 'package:cars_store/feature/car_details/data/repo/car_details_repo_impl.dart';
import 'package:cars_store/feature/car_details/domain/repo/car_details_repo.dart';
import 'package:cars_store/feature/favorite/data/repo/favorite_repo_impl.dart';
import 'package:cars_store/feature/favorite/domain/repo/favorite_repo.dart';
import 'package:cars_store/feature/home/data/repo/home_repo_impl.dart';
import 'package:cars_store/feature/home/domain/repo/home_repo.dart';
import 'package:cars_store/feature/profile/data/repo/profile_repo_impl.dart';
import 'package:cars_store/feature/profile/domain/repo/profile_repo.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupDependencies() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  getIt.registerSingleton<AuthRepo>(AuthRepoImpl(api: getIt<ApiService>()));
  getIt.registerSingleton<HomeRepo>(HomeRepoImpl(api: getIt<ApiService>()));
  getIt.registerSingleton<FavoriteRepo>(
    FavoriteRepoImpl(api: getIt<ApiService>()),
  );
  getIt.registerSingleton<ProfileRepo>(
    ProfileRepoImpl(api: getIt<ApiService>()),
  );
  getIt.registerSingleton<CarDetailsRepo>(
    CarDetailsRepoImpl(api: getIt<ApiService>()),
  );
}
