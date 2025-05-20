import 'dart:developer';

import 'package:cars_store/core/errors/failure.dart';
import 'package:cars_store/core/networking/api_keys.dart';
import 'package:cars_store/core/networking/api_services.dart';
import 'package:cars_store/feature/favorite/data/models/favorite_cars_model/favorite_cars_model.dart';
import 'package:cars_store/feature/favorite/domain/entity/favorite_cars_entity.dart';
import 'package:cars_store/feature/favorite/domain/repo/favorite_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class FavoriteRepoImpl extends FavoriteRepo {
  final ApiService api;

  FavoriteRepoImpl({required this.api});
  @override
  Future<Either<Failure, List<FavoriteCarsEntity>>> getFavoriteCars() async {
    try {
      var response = await api.get(ApiKeys.favoritesMe);
      if (response is! List) {
        return left(ServerFailure('Response is not a list'));
      }
      final List<FavoriteCarsModel> favoriteCarsModel =
          response.map((e) => FavoriteCarsModel.fromJson(e)).toList();
      final List<FavoriteCarsEntity> favoriteCarsEntity =
          favoriteCarsModel
              .map((e) => FavoriteCarsEntity.fromModel(e))
              .toList();
      return right(favoriteCarsEntity);
    } catch (e) {
      if (e is DioException) {
        log(
          "Error in FavoriteRepoImpl in getFavoriteCars method in dio exceptions : $e",
        );
        return left(ServerFailure.fromDioExeptions(e));
      }
      log("Error in FavoriteRepoImpl in getFavoriteCars method : $e");
      return left(ServerFailure(e.toString()));
    }
  }
}
