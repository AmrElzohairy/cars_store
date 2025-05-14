import 'package:cars_store/core/errors/failure.dart';
import 'package:cars_store/feature/auth/data/models/sign_in_body.dart';
import 'package:cars_store/feature/auth/data/models/sign_up_body_model.dart';
import 'package:cars_store/feature/auth/domain/entity/user_entity.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserEntity>> signIn(SignInBodyModel signInBody);

  Future<Either<Failure, void>> signUp(SignUpBodyModel signUpBody);
}
