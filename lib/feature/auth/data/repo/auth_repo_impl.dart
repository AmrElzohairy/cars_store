import 'dart:developer';

import 'package:cars_store/core/cache/cache_constants.dart';
import 'package:cars_store/core/cache/cache_helper.dart';
import 'package:cars_store/core/errors/failure.dart';
import 'package:cars_store/core/networking/api_keys.dart';
import 'package:cars_store/core/networking/api_services.dart';
import 'package:cars_store/feature/auth/data/models/sign_in_body.dart';
import 'package:cars_store/feature/auth/data/models/sign_in_response_model.dart';
import 'package:cars_store/feature/auth/data/models/sign_up_body_model.dart';
import 'package:cars_store/feature/auth/domain/entity/user_entity.dart';
import 'package:cars_store/feature/auth/domain/repo/auth_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class AuthRepoImpl extends AuthRepo {
  final ApiService api;
  @override
  AuthRepoImpl({required this.api});
  @override
  Future<Either<Failure, UserEntity>> signIn(SignInBodyModel signInBody) async {
    try {
      var response = await api.post(ApiKeys.signIn, data: signInBody.toJson());
      var data = SignInResponseModel.fromJson(response);
      var user = UserEntity.fromResponse(data);
      setUserData(data, user);
      return right(user);
    } on Exception catch (e) {
      if (e is DioException) {
        log("Error in AuthRepoImpl in signIn method in dio exceptions : $e");
        return left(ServerFailure.fromDioExeptions(e));
      }
      log("Error in AuthRepoImpl in signIn method : $e");
      return left(ServerFailure(e.toString()));
    }
  }

  void setUserData(SignInResponseModel data, UserEntity user) {
    CacheHelper.set(key: CacheKeys.accssToken, value: data.token);
    debugPrint("Access Token: ${data.token}");
    CacheHelper.set(key: CacheKeys.refreshToken, value: data.refreshToken);
    debugPrint("Refresh Token: ${data.refreshToken}");
    CacheHelper.set(key: CacheKeys.userId, value: user.userId);
    debugPrint("User ID: ${user.userId}");
    CacheHelper.set(key: CacheKeys.userName, value: user.userName);
    debugPrint("User Name: ${user.userName}");
    CacheHelper.set(key: CacheKeys.email, value: user.email);
    debugPrint("User Email: ${user.email}");
  }

  @override
  Future<Either<Failure, void>> signUp(SignUpBodyModel signUpBody) async {
    try {
      await api.post(ApiKeys.signUp, data: signUpBody.toJson());
      return right(null);
    } on Exception catch (e) {
      if (e is DioException) {
        log("Error in AuthRepoImpl in signUp method in dio exceptions : $e");
        return left(ServerFailure.fromDioExeptions(e));
      }
      log("Error in AuthRepoImpl in signUp method : $e");
      return left(ServerFailure(e.toString()));
    }
  }
}
