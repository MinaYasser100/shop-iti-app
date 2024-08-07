part of 'favorite_cubit.dart';

@immutable
sealed class FavortieStates {}

final class FavoriteCubitInitial extends FavortieStates {}

final class FavoriteCubitGetFavoriteDataLoading extends FavortieStates {}

final class FavoriteCubitGetFavoriteDataSuccess extends FavortieStates {}

final class FavoriteCubitGetFavoriteDataFailure extends FavortieStates {}

final class FavoriteCubitRemoveFavoriteDataLoading extends FavortieStates {}

final class FavoriteCubitRemoveFavoriteDataSuccess extends FavortieStates {
  final String message;

  FavoriteCubitRemoveFavoriteDataSuccess({required this.message});
}

final class FavoriteCubitRemoveFavoriteDataFailure extends FavortieStates {}
