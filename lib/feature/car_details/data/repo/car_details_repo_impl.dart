import 'dart:developer';

import 'package:cars_store/core/errors/failure.dart';
import 'package:cars_store/core/networking/api_keys.dart';
import 'package:cars_store/core/networking/api_services.dart';
import 'package:cars_store/feature/car_details/data/models/car_details_model.dart';
import 'package:cars_store/feature/car_details/domain/entity/car_details_entity.dart';
import 'package:cars_store/feature/car_details/domain/repo/car_details_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class CarDetailsRepoImpl extends CarDetailsRepo {
  final ApiService api;

  CarDetailsRepoImpl({required this.api});
  @override
  Future<Either<Failure, CarDetailsEntity>> getCarDetails(String carId) async {
    try {
      var response = await api.get("${ApiKeys.carDetails}/$carId");
      var data = CarDetailsModel.fromJson(response);
      var car = CarDetailsEntity.fromModel(data);
      return right(car);
    } on Exception catch (e) {
      if (e is DioException) {
        log(
          "Error in CarDetailsRepoImpl in getCarDetails in dio exception: $e",
        );
        return left(ServerFailure.fromDioExeptions(e));
      }
      log("Error in CarDetailsRepoImpl in getCarDetails in exception: $e");
      return left(ServerFailure(e.toString()));
    }
  }
}
