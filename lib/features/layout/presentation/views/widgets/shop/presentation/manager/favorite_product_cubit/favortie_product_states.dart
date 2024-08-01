part of 'favorite_product_cubit.dart';

@immutable
sealed class FavortieProductStates {}

final class FavortieProductInitial extends FavortieProductStates {}

final class FavortieProductChangeState extends FavortieProductStates {}

final class FavortieProductAddOrDeleteFavoriteProductLoading
    extends FavortieProductStates {}

final class FavortieProductAddOrDeleteFavoriteProductSuccess
    extends FavortieProductStates {
  final String message;

  FavortieProductAddOrDeleteFavoriteProductSuccess({required this.message});
}

final class FavortieProductAddOrDeleteFavoriteProductErrorStatus
    extends FavortieProductStates {}

final class FavortieProductAddOrDeleteFavoriteProductFaliure
    extends FavortieProductStates {}
