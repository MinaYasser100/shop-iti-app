import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_iti_app/core/api/dio_api.dart';
import 'package:shop_iti_app/core/api/dio_end_point.dart';
import 'package:shop_iti_app/core/constant/constant.dart';
import 'package:shop_iti_app/core/helper/hive_helper.dart';
import 'package:shop_iti_app/features/layout/data/model/proudect_model/proudect_model.dart';
import 'package:shop_iti_app/features/layout/presentation/views/widgets/shop/data/model/carts_model/cart_item.dart';
import 'package:shop_iti_app/features/layout/presentation/views/widgets/shop/data/model/carts_model/carts_model.dart';
import 'package:shop_iti_app/features/layout/presentation/views/widgets/shop/data/model/favorite_model/datum.dart';
import 'package:shop_iti_app/features/layout/presentation/views/widgets/shop/data/model/favorite_model/favorite_model.dart';

part 'shop_screen_state.dart';

class ShopScreenCubit extends Cubit<ShopScreenState> {
  ShopScreenCubit() : super(ShopScreenInitial());
  ProudectModel? proudectsModel;
  void getShopData() async {
    emit(ShopScreenGetShopDataLoading());
    try {
      Response response = await DioApi.getData(endPoint: DioEndPoint.dioHome);
      if (response.statusCode == 200) {
        proudectsModel = ProudectModel.fromJson(response.data);
        List<Datum> dataFavoriteProduct = await getFavoriteProduct();
        await HiveHelper.delectAllFavProducts();
        for (var element in dataFavoriteProduct) {
          for (var item in proudectsModel!.data!.products!) {
            if (element.product!.id == item.id) {
              await HiveHelper.addFavoriteProduct(item);
            }
          }
        }
        await getCartProducts();
        emit(ShopScreenGetShopDataSuceess(proudectsModel: proudectsModel!));
      } else {
        emit(
          ShopScreenGetShopDataErrorResponse(
            message: response.statusMessage!,
            statusCode: response.statusCode!,
          ),
        );
      }
    } catch (e) {
      emit(ShopScreenGetShopDataFailure(errorMessage: e.toString()));
    }
  }

  Future<List<Datum>> getFavoriteProduct() async {
    Response response = await DioApi.getData(
      endPoint: DioEndPoint.dioFavorites,
      token: ConstantComponents.token,
    );
    List<Datum> data = [];
    if (response.statusCode == 200) {
      try {
        FavoriteModel favoriteModel = FavoriteModel.fromJson(response.data);
        data = favoriteModel.data!.data!;
        return data;
      } catch (e) {
        print(e.toString());
      }
    }
    return data;
  }

  Future<void> getCartProducts() async {
    Response response = await DioApi.getData(
      endPoint: DioEndPoint.dioCarts,
      token: ConstantComponents.token,
    );
    List<CartItem> cartsProducts = [];
    if (response.statusCode == 200) {
      try {
        CartsModel cartsModel = CartsModel.fromJson(response.data);
        if (cartsModel.data!.cartItems!.isNotEmpty) {
          cartsProducts = cartsModel.data!.cartItems!;
          await HiveHelper.delectAllProductsFromCart();
          for (var element in cartsProducts) {
            HiveHelper.addProductToCart(element);
            print(element.product!.name);
          }
        }
      } catch (e) {
        print(e.toString());
      }
    }
  }
}
