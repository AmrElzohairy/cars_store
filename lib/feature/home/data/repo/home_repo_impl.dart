import 'dart:developer';

import 'package:cars_store/core/errors/failure.dart';
import 'package:cars_store/core/networking/api_services.dart';
import 'package:cars_store/feature/home/data/models/featured_cars_model.dart';
import 'package:cars_store/feature/home/domain/entity/home_featured_list_entity.dart';
import 'package:cars_store/feature/home/domain/repo/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/networking/api_keys.dart';

class HomeRepoImpl extends HomeRepo {
  final ApiService api;
  HomeRepoImpl({required this.api});
  @override
  @override
  Future<Either<Failure, List<HomeFeaturedListEntity>>>
  getFeaturedCars() async {
    try {
      final response = await api.get(ApiKeys.featuredCars);
      final carModels =
          response.map((e) => FeaturedCarsModel.fromJson(e)).toList();
      final carEntities =
          carModels
              .where((model) => model.isFeatured == true)
              .map(
                (model) => HomeFeaturedListEntity.fromFeaturedCarsModel(model),
              )
              .toList();

      return right(carEntities);
    } catch (e) {
      if (e is DioException) {
        log(
          "Error in HomeRepoImpl in getFeaturedCars method in dio exceptions : $e",
        );
        return left(ServerFailure.fromDioExeptions(e));
      }
      log("Error in HomeRepoImpl in getFeaturedCars method : $e");
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  getRecommendedCars() {
    throw UnimplementedError();
  }
}
