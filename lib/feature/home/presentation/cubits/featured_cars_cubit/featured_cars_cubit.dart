import 'package:cars_store/feature/home/domain/entity/home_featured_list_entity.dart';
import 'package:cars_store/feature/home/domain/repo/home_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'featured_cars_state.dart';

class FeaturedCarsCubit extends Cubit<FeaturedCarsState> {
  FeaturedCarsCubit(this.homeRepo) : super(FeaturedCarsInitial());
  final HomeRepo homeRepo;

  void getFeaturedCars() async {
    emit(FeaturedCarsLoading());
    final result = await homeRepo.getFeaturedCars();
    result.fold(
      (failure) => emit(FeaturedCarsError(errMessage: failure.message)),
      (cars) => emit(FeaturedCarsLoaded(cars: cars)),
    );
  }
}
