


part of 'cart_states_cubit.dart';

@immutable
sealed class CartStatesStates {}

final class CartStatesInitial extends CartStatesStates {}
final class CartStatesAddOrDeleteProductCartInApiLoading
    extends CartStatesStates {}
final class CartStatesAddOrDeleteProductCartInApiSuccess
    extends CartStatesStates {
  final String message;
  CartStatesAddOrDeleteProductCartInApiSuccess({required this.message});
}
final class CartStatesAddOrDeleteProductCartInApifailure
    extends CartStatesStates {
  final String errorMessage;
  CartStatesAddOrDeleteProductCartInApifailure({required this.errorMessage});
}
final class CartStatesGetCartProductsLoading extends CartStatesStates {}
final class CartStatesGetCartProductsSuccess extends CartStatesStates {}
final class CartStatesGetCartProductsFailure extends CartStatesStates {}
final class CartStatesToggleCartProductsLoading extends CartStatesStates {}
final class CartStatesToggleCartProductsSuccess extends CartStatesStates {}
final class CartStatesToggleCartProductsFailure extends CartStatesStates {}
