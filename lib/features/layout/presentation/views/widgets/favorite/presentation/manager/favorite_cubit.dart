import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_iti_app/core/api/dio_api.dart';
import 'package:shop_iti_app/core/api/dio_end_point.dart';
import 'package:shop_iti_app/core/api/failures.dart';
import 'package:shop_iti_app/core/constant/constant.dart';
import 'package:shop_iti_app/core/func/custom_snack_bar.dart';
import 'package:shop_iti_app/core/helper/hive_helper.dart';
import 'package:shop_iti_app/features/layout/presentation/views/widgets/shop/data/model/favorite_model/favorite_model.dart';
import '../../../shop/data/model/favorite_model/datum.dart';
part 'favorite_states.dart';


class FavoriteCubit extends Cubit<FavortieStates> {
  FavoriteCubit() : super(FavoriteCubitInitial());
  List<Datum> favoriteProduct = [];
  void getFavoriteData() async {
    emit(FavoriteCubitGetFavoriteDataLoading());
    try {
      Response response = await DioApi.getData(
        endPoint: DioEndPoint.dioFavorites,
        token: ConstantComponents.token,
      );
      if (response.statusCode == 200) {
        FavoriteModel favoriteModel = FavoriteModel.fromJson(response.data);
        favoriteProduct = favoriteModel.data!.data!;
      }
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
