import 'dart:developer';

import 'package:cars_store/core/errors/failure.dart';
import 'package:cars_store/core/networking/api_keys.dart';
import 'package:cars_store/core/networking/api_services.dart';
import 'package:cars_store/feature/profile/data/models/profile_user_model.dart';
import 'package:cars_store/feature/profile/domain/entity/profile_user_entity.dart';
import 'package:cars_store/feature/profile/domain/repo/profile_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class ProfileRepoImpl extends ProfileRepo {
  final ApiService api;

  ProfileRepoImpl({required this.api});
  @override
  Future<Either<Failure, ProfileUserEntity>> getUserData() async {
    try {
      var response = await api.get(ApiKeys.userData);
      var userModel = ProfileUserModel.fromJson(response);
      var userEntity = ProfileUserEntity.fromModel(userModel);
      return right(userEntity);
    } on Exception catch (e) {
      if (e is DioException) {
        log(
          "Error in getUserData in Profile Repo Impl in Dio Exception: ${e.message}",
        );
        return left(ServerFailure.fromDioExeptions(e));
      } else {
        log("Error in getUserData in Profile Repo Impl: ${e.toString()}");
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
