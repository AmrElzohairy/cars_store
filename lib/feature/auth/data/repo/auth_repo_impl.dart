import 'dart:developer';

import 'package:cars_store/core/errors/failure.dart';
import 'package:cars_store/core/networking/api_keys.dart';
import 'package:cars_store/core/networking/api_services.dart';
import 'package:cars_store/feature/auth/data/models/sign_in_body.dart';
import 'package:cars_store/feature/auth/data/models/sign_in_response_model.dart';
import 'package:cars_store/feature/auth/domain/entity/user_entity.dart';
import 'package:cars_store/feature/auth/domain/repo/auth_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class AuthRepoImpl extends AuthRepo {
  final ApiService api;
  @override
  AuthRepoImpl({required this.api});
  @override
  Future<Either<Failure, UserEntity>> signIn(SignInBody signInBody) async {
    try {
      var response = await api.post(ApiKeys.signIn, data: signInBody.toJson());
      var data = SignInResponseModel.fromJson(response);
      var user = UserEntity.fromResponse(data);
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
}
