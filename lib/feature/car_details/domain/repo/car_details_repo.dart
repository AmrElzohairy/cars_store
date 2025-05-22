import 'package:cars_store/core/errors/failure.dart';
import 'package:cars_store/feature/car_details/domain/entity/car_details_entity.dart';
import 'package:dartz/dartz.dart';

abstract class CarDetailsRepo {
  Future<Either<Failure, CarDetailsEntity>> getCarDetails(String carId);
}
