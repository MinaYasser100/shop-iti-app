

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:shop_iti_app/core/api/dio_api.dart';
import 'package:shop_iti_app/core/api/dio_end_point.dart';
import 'package:shop_iti_app/core/api/failures.dart';
import 'package:shop_iti_app/core/constant/constant.dart';
import 'package:shop_iti_app/core/func/check_internet_connection.dart';
import 'package:shop_iti_app/core/func/custom_snack_bar.dart';
import 'package:shop_iti_app/core/helper/hive_helper.dart';
import 'package:shop_iti_app/features/layout/data/model/proudect_model/product.dart';
import 'package:shop_iti_app/features/layout/presentation/views/widgets/shop/data/model/carts_model/cart_item.dart';
import 'package:shop_iti_app/features/layout/presentation/views/widgets/shop/data/model/carts_model/carts_model.dart';

part 'cart_states_states.dart';

class CartStatesCubit extends Cubit<CartStatesStates> {
  CartStatesCubit() : super(CartStatesInitial());

  void toggleProductInCart({required ProductItemModel product}) async {
    bool isConnection = await checkInternetConnection();
    if (isConnection) {
      emit(CartStatesToggleCartProductsLoading());
      final box = await Hive.openBox<CartItem>(HiveHelper.cartBox);
      try {
        if (box.containsKey(product.id)) {
          await HiveHelper.removeProductFromCart(product.id!);
          await addOrDeleteProductCartInApi(product.id!);
          customSnackBar(
            subTitle: product.name!,
            text: 'Removed From Cart',
          );
        } else {
          await addOrDeleteProductCartInApi(product.id!);
          await getCartProducts();
          customSnackBar(
            subTitle: product.name!,
            text: 'Added To Cart',
          );
        }
        emit(CartStatesToggleCartProductsSuccess());
      } catch (e) {
        emit(CartStatesToggleCartProductsFailure());
      }
    } else {
      customSnackBar(
        text: 'No Internet Connection',
        subTitle: 'Please connect to the internet and try again',
        color: Colors.red,
      );
    }
  }
  Future<void> addOrDeleteProductCartInApi(int productId) async {
    emit(CartStatesAddOrDeleteProductCartInApiLoading());
    try {
      Response<dynamic> response = await DioApi.postData(
        endPoint: DioEndPoint.dioCarts,
        body: {
          'product_id': productId,
        },
        token: ConstantComponents.token,
      );
      emit(
        CartStatesAddOrDeleteProductCartInApiSuccess(
          message: response.data['message'],
        ),
      );
    }
    catch (e) {
      if (e is DioException) {
        customSnackBar(
          subTitle: 'Server Error',
          text: ServerFailure.fromDioException(e).toString(),
          color: Colors.red,
        );
      }
      emit(
        CartStatesAddOrDeleteProductCartInApifailure(
            errorMessage: e.toString()),
      );
    }
  }
  Future<void> getCartProducts() async {
    emit(CartStatesGetCartProductsLoading());
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
          }
        }
        emit(CartStatesGetCartProductsSuccess());
      }
      catch (e) {
        if (e is DioException) {
          customSnackBar(
            subTitle: 'Server Error',
            text: ServerFailure.fromDioException(e).toString(),
            color: Colors.red,
          );
        }
        emit(CartStatesGetCartProductsFailure());
      }
    }
  }
  bool determineState(ProductItemModel product) {
    List<CartItem> list = HiveHelper.getCartProducts();
    if (list.isNotEmpty) {
      for (var element in list) {
        if (element.product!.id == product.id) {
          return true;
        }
      }
      return false;
    } else {
      return false;
    }
  }
}
