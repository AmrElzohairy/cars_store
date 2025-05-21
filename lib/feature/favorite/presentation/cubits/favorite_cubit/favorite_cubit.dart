import 'package:cars_store/feature/favorite/domain/entity/favorite_cars_entity.dart';
import 'package:cars_store/feature/favorite/domain/repo/favorite_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  final FavoriteRepo favoriteRepo;
  FavoriteCubit(this.favoriteRepo) : super(FavoriteInitial());

  Future<void> getFavoriteCars() async {
    emit(FavoriteLoading());
    final result = await favoriteRepo.getFavoriteCars();
    result.fold(
      (failure) => emit(FavoriteError(failure.errMessage)),
      (favoriteCars) => emit(FavoriteSuccess(favoriteCars)),
    );
  }
}
