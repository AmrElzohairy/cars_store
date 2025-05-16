import 'package:cars_store/core/errors/failure.dart';
import 'package:cars_store/feature/home/domain/entity/home_featured_list_entity.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<HomeFeaturedListEntity>>> getFeaturedCars();
  getRecommendedCars();
}
