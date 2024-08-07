part of 'cart_cubit.dart';

@immutable
      sealed class CartStates {}
        final class CartCubitInitial extends CartStates {}

final class CartCubitGetCartDataLoading extends CartStates {}

final class CartCubitGetCartDataSuccess extends CartStates {}

final class CartCubitGetCartDataFailure extends CartStates {}

