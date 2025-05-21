import 'package:cars_store/feature/home/domain/repo/home_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit({required this.homeRepo}) : super(FavoriteInitial());
  final HomeRepo homeRepo;

  void toggleFavorite({required String carId}) async {
    emit(FavoriteLoading());
    final result = await homeRepo.toggelFavorite(carId: carId);
    result.fold(
      (failure) => emit(FavoriteError(errorMessage: failure.errMessage)),
      (success) => emit(FavoriteSuccess()),
    );
  }
}
