part of 'favorite_cubit.dart';

sealed class FavoriteState extends Equatable {
  const FavoriteState();

  @override
  List<Object> get props => [];
}

final class FavoriteInitial extends FavoriteState {}
final class FavoriteLoading extends FavoriteState {}
final class FavoriteSuccess extends FavoriteState {
  final List<FavoriteCarsEntity> favoriteCars;

  const FavoriteSuccess(this.favoriteCars);

  @override
  List<Object> get props => [favoriteCars];
}
final class FavoriteError extends FavoriteState {
  final String error;

  const FavoriteError(this.error);

  @override
  List<Object> get props => [error];
}
