import 'package:cars_store/core/errors/failure.dart';
import 'package:cars_store/feature/profile/domain/entity/profile_user_entity.dart';
import 'package:dartz/dartz.dart';

abstract class ProfileRepo {
  Future<Either<Failure, ProfileUserEntity>> getUserData();
}
