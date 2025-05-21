import 'dart:developer';

import 'package:cars_store/core/errors/failure.dart';
import 'package:cars_store/core/networking/api_services.dart';
import 'package:cars_store/feature/home/data/models/featured_cars_model/featured_cars_model.dart';
import 'package:cars_store/feature/home/data/models/recommended_cars_model/recommended_cars_model.dart';
import 'package:cars_store/feature/home/data/models/search_model/search_model.dart';
import 'package:cars_store/feature/home/domain/entity/home_featured_list_entity.dart';
import 'package:cars_store/feature/home/domain/entity/recommended_cars_entity.dart';
import 'package:cars_store/feature/home/domain/repo/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/networking/api_keys.dart';

class HomeRepoImpl extends HomeRepo {
  final ApiService api;
  HomeRepoImpl({required this.api});

  @override
  Future<Either<Failure, List<FeaturedCarsEntity>>> getFeaturedCars() async {
    try {
      final response = await api.get(ApiKeys.featuredCars);
      if (response is! List) {
        return left(ServerFailure('Response is not a list'));
      }
      final List<FeaturedCarsModel> carModels =
          response.map((e) => FeaturedCarsModel.fromJson(e)).toList();
      final List<FeaturedCarsEntity> carEntities =
          carModels
              .where((model) => model.isFeatured == true)
              .map((model) => FeaturedCarsEntity.fromFeaturedCarsModel(model))
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
  Future<Either<Failure, List<RecommendedCarsEntity>>>
  getRecommendedCars() async {
    try {
      final response = await api.get(ApiKeys.recommendedCars);
      if (response is! List) {
        return left(ServerFailure('Response is not a list'));
      }
      final List<RecommendedCarsModel> carModels =
          response.map((e) => RecommendedCarsModel.fromJson(e)).toList();
      final List<RecommendedCarsEntity> carEntities =
          carModels
              .where((model) => model.isRecommended == true)
              .map(
                (model) =>
                    RecommendedCarsEntity.fromRecommendedCarsModel(model),
              )
              .toList();
      return right(carEntities);
    } catch (e) {
      if (e is DioException) {
        log(
          "Error in HomeRepoImpl in getRecommendedCars method in dio exceptions : $e",
        );
        return left(ServerFailure.fromDioExeptions(e));
      }
      log("Error in HomeRepoImpl in getRecommendedCars method : $e");
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> toggelFavorite({required String carId}) async {
    try {
      await api.post("${ApiKeys.toggleFavorite}/$carId");
      return right(null);
    } on Exception catch (e) {
      if (e is DioException) {
        log(
          "Error in HomeRepoImpl in toggelFavorite method in dio exceptions : $e",
        );
        return left(ServerFailure.fromDioExeptions(e));
      }
      log("Error in HomeRepoImpl in toggelFavorite method : $e");
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<SearchModel>>> searchCars({
    required String query,
  }) async {
    try {
      var response = await api.get(
        ApiKeys.carSearch,
        queryParameters: {"search": query},
      );
      if (response is! List) {
        return left(ServerFailure('Response is not a list'));
      }
      var searchList = response.map((e) => SearchModel.fromJson(e)).toList();
      return right(searchList);
    } on Exception catch (e) {
      if (e is DioException) {
        log(
          "Error in HomeRepoImpl in searchCars method in dio exceptions : $e",
        );
        return left(ServerFailure.fromDioExeptions(e));
      }
      log("Error in HomeRepoImpl in searchCars method : $e");
      return left(ServerFailure(e.toString()));
    }
  }
}
