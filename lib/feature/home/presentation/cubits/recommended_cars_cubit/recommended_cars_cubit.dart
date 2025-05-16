import 'package:cars_store/feature/home/domain/entity/recommended_cars_entity.dart';
import 'package:cars_store/feature/home/domain/repo/home_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'recommended_cars_state.dart';

class RecommendedCarsCubit extends Cubit<RecommendedCarsState> {
  RecommendedCarsCubit({required this.homeRepo})
    : super(RecommendedCarsInitial());
  final HomeRepo homeRepo;

  void getRecommendedCars() async {
    emit(RecommendedCarsLoading());
    final result = await homeRepo.getRecommendedCars();
    result.fold(
      (failure) => emit(RecommendedCarsError(errMessage: failure.message)),
      (cars) => emit(RecommendedCarsLoaded(cars: cars)),
    );
  }
}
