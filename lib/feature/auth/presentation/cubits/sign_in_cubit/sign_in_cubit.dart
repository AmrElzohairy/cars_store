import 'package:cars_store/feature/auth/data/models/sign_in_body.dart';
import 'package:cars_store/feature/auth/domain/entity/user_entity.dart';
import 'package:cars_store/feature/auth/domain/repo/auth_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit({required this.authRepo}) : super(SignInInitial());
  final AuthRepo authRepo;

  Future<void> signIn(SignInBodyModel signInBody) async {
    emit(SignInLoading());
    var result = await authRepo.signIn(signInBody);
    result.fold(
      (failure) => emit(SignInFailure(failure.errMessage)),
      (user) => emit(SignInSuccess(user)),
    );
  }
}
