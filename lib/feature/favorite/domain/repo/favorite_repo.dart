import 'package:cars_store/core/errors/failure.dart';
import 'package:cars_store/feature/favorite/domain/entity/favorite_cars_entity.dart';
import 'package:dartz/dartz.dart';

abstract class FavoriteRepo {
  Future<Either<Failure, List<FavoriteCarsEntity>>> getFavoriteCars();
}
