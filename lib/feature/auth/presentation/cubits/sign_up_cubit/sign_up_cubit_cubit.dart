import 'package:cars_store/feature/auth/data/models/sign_up_body_model.dart';
import 'package:cars_store/feature/auth/domain/repo/auth_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_up_cubit_state.dart';

class SignUpCubitCubit extends Cubit<SignUpCubitState> {
  final AuthRepo authRepo;
  SignUpCubitCubit(this.authRepo) : super(SignUpCubitInitial());

  Future<void> signUp(SignUpBodyModel signUpBody) async {
    emit(SignUpLoading());
    var result = await authRepo.signUp(signUpBody);
    result.fold(
      (failure) => emit(SignUpFailure(failure.message)),
      (success) => emit(const SignUpSuccess()),
    );
  }
}
