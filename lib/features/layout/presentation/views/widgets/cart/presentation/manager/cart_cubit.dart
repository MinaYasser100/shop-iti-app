import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:shop_iti_app/core/api/dio_api.dart';
import 'package:shop_iti_app/core/api/dio_end_point.dart';
import 'package:shop_iti_app/core/api/failures.dart';
import 'package:shop_iti_app/core/constant/constant.dart';
import 'package:shop_iti_app/core/func/custom_snack_bar.dart';
import 'package:shop_iti_app/features/layout/presentation/views/widgets/shop/data/model/carts_model/cart_item.dart';
import 'package:shop_iti_app/features/layout/presentation/views/widgets/shop/data/model/carts_model/carts_model.dart';

part 'cart_states.dart';


class CartCubit extends Cubit<CartStates> {
  CartCubit() : super(CartCubitInitial());
  List<CartItem> cartproduct =[];
  void getCartData() async {
    emit(CartCubitGetCartDataLoading());
  try {
    Response response = await DioApi.getData(
    endPoint: DioEndPoint.dioCarts,
    token: ConstantComponents.token,
    );
    if(response.statusCode==200){
    CartsModel cartModel=CartsModel.fromJson(response.data);
    

    cartproduct=cartModel.data!.cartItems!;

    }
    emit(CartCubitGetCartDataSuccess());
  } catch (e) {
          if(e is DioException){
               customSnackBar(subTitle: ServerFailure.fromDioException(e).errorMessage,
             text: 'server Error',
             );
           }
          emit(CartCubitGetCartDataFailure());

  }
}
}
