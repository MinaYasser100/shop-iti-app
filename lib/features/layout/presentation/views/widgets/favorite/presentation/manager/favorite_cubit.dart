import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_iti_app/core/api/dio_api.dart';
import 'package:shop_iti_app/core/api/dio_end_point.dart';
import 'package:shop_iti_app/core/api/failures.dart';
import 'package:shop_iti_app/core/constant/constant.dart';
import 'package:shop_iti_app/core/func/custom_snack_bar.dart';
import 'package:shop_iti_app/core/helper/hive_helper.dart';
import 'package:shop_iti_app/features/layout/data/model/proudect_model/product.dart';

part 'favorite_states.dart';

class FavoriteCubit extends Cubit<FavortieStates> {
  FavoriteCubit() : super(FavoriteCubitInitial());
  //List<Datum> favoriteProduct = [];
  List<ProductItemModel> favoriteProduct = [];
  void getFavoriteData() async {
    emit(FavoriteCubitGetFavoriteDataLoading());
    try {
      favoriteProduct = HiveHelper.getFavoriteProducts();
      emit(FavoriteCubitGetFavoriteDataSuccess());
    } catch (e) {
      if (e is DioException) {
        customSnackBar(
          subTitle: ServerFailure.fromDioException(e).errorMessage,
          text: 'Server Error',
          color: Colors.red,
        );
      }
      emit(FavoriteCubitGetFavoriteDataFailure());
    }
  }

  Future<void> addOrDeleteFavoriteInApi(int productId) async {
    emit(FavoriteCubitRemoveFavoriteDataLoading());
    try {
      Response<dynamic> response = await DioApi.postData(
        endPoint: DioEndPoint.dioFavorites,
        body: {
          'product_id': productId,
        },
        token: ConstantComponents.token,
      );
      await HiveHelper.removeFavoriteProduct(productId);
      getFavoriteData();
      emit(
        FavoriteCubitRemoveFavoriteDataSuccess(
          message: response.data['message'],
        ),
      );
    } catch (e) {
      if (e is DioException) {
        customSnackBar(
          subTitle: 'Server Error',
          text: ServerFailure.fromDioException(e).toString(),
          color: Colors.red,
        );
      }
      emit(FavoriteCubitRemoveFavoriteDataFailure());
    }
  }
}
