import 'package:cars_store/core/errors/failure.dart';
import 'package:cars_store/feature/auth/data/models/sign_in_body.dart';
import 'package:cars_store/feature/auth/data/models/sign_in_response_model.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepo {
  Future<Either<Failure, SignInResponseModel>> signIn(SignInBody signInBody);
}
