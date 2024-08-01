part of 'favorite_product_cubit.dart';

@immutable
sealed class FavortieProductStates {}

final class FavortieProductInitial extends FavortieProductStates {}

final class FavortieProductChangeState extends FavortieProductStates {}
