part of 'shop_screen_cubit.dart';

@immutable
sealed class ShopScreenState {}

final class ShopScreenInitial extends ShopScreenState {}

final class ShopScreenGetShopDataLoading extends ShopScreenState {}

final class ShopScreenGetShopDataSuceess extends ShopScreenState {
  final ProudectModel proudectsModel;

  ShopScreenGetShopDataSuceess({required this.proudectsModel});
}

final class ShopScreenGetShopDataFailure extends ShopScreenState {
  final String errorMessage;

  ShopScreenGetShopDataFailure({required this.errorMessage});
}

final class ShopScreenGetShopDataErrorResponse extends ShopScreenState {
  final int statusCode;
  final String message;

  ShopScreenGetShopDataErrorResponse(
      {required this.statusCode, required this.message});
}
