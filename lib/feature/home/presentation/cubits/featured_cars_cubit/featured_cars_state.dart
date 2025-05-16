part of 'featured_cars_cubit.dart';

sealed class FeaturedCarsState extends Equatable {
  const FeaturedCarsState();

  @override
  List<Object> get props => [];
}

final class FeaturedCarsInitial extends FeaturedCarsState {}

final class FeaturedCarsLoading extends FeaturedCarsState {}

final class FeaturedCarsLoaded extends FeaturedCarsState {
  final List<HomeFeaturedListEntity> cars;
  const FeaturedCarsLoaded({required this.cars});

  @override
  List<Object> get props => [cars];
}

final class FeaturedCarsError extends FeaturedCarsState {
  final String errMessage;
  const FeaturedCarsError({required this.errMessage});

  @override
  List<Object> get props => [errMessage];
}
