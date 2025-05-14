part of 'sign_up_cubit_cubit.dart';

sealed class SignUpCubitState extends Equatable {
  const SignUpCubitState();

  @override
  List<Object> get props => [];
}

final class SignUpCubitInitial extends SignUpCubitState {}

final class SignUpLoading extends SignUpCubitState {}

final class SignUpSuccess extends SignUpCubitState {
  const SignUpSuccess();

  @override
  List<Object> get props => [];
}

final class SignUpFailure extends SignUpCubitState {
  final String errMessage;

  const SignUpFailure(this.errMessage);

  @override
  List<Object> get props => [errMessage];
}
