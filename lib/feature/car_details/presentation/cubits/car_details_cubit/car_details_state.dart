part of 'car_details_cubit.dart';

sealed class CarDetailsState extends Equatable {
  const CarDetailsState();

  @override
  List<Object> get props => [];
}

final class CarDetailsInitial extends CarDetailsState {}

final class CarDetailsLoading extends CarDetailsState {}

final class CarDetailsLoaded extends CarDetailsState {
  final CarDetailsEntity carDetails;

  const CarDetailsLoaded(this.carDetails);

  @override
  List<Object> get props => [carDetails];
}

final class CarDetailsError extends CarDetailsState {
  final String errMessage;

  const CarDetailsError(this.errMessage);

  @override
  List<Object> get props => [errMessage];
}
