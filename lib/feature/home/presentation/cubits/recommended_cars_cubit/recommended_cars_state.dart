part of 'recommended_cars_cubit.dart';

sealed class RecommendedCarsState extends Equatable {
  const RecommendedCarsState();

  @override
  List<Object> get props => [];
}

final class RecommendedCarsInitial extends RecommendedCarsState {}

final class RecommendedCarsLoading extends RecommendedCarsState {}

final class RecommendedCarsLoaded extends RecommendedCarsState {
  final List<RecommendedCarsEntity> cars;
  const RecommendedCarsLoaded({required this.cars});
  @override
  List<Object> get props => [cars];
}

final class RecommendedCarsError extends RecommendedCarsState {
  final String errMessage;
  const RecommendedCarsError({required this.errMessage});
  @override
  List<Object> get props => [errMessage];
}
