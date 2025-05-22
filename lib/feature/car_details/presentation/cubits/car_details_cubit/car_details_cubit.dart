import 'package:cars_store/feature/car_details/domain/entity/car_details_entity.dart';
import 'package:cars_store/feature/car_details/domain/repo/car_details_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'car_details_state.dart';

class CarDetailsCubit extends Cubit<CarDetailsState> {
  CarDetailsCubit(this.carDetailsRepo) : super(CarDetailsInitial());
  final CarDetailsRepo carDetailsRepo;
  Future<void> getCarDetails(String carId) async {
    emit(CarDetailsLoading());
    var result = await carDetailsRepo.getCarDetails(carId);
    result.fold(
      (failure) => emit(CarDetailsError(failure.errMessage)),
      (carDetails) => emit(CarDetailsLoaded(carDetails)),
    );
  }
}
