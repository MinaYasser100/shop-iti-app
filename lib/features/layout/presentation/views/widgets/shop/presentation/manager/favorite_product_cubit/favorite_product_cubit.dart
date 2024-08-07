import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:shop_iti_app/core/api/dio_api.dart';
import 'package:shop_iti_app/core/api/dio_end_point.dart';
import 'package:shop_iti_app/core/api/failures.dart';
import 'package:shop_iti_app/core/constant/constant.dart';
import 'package:shop_iti_app/core/func/custom_snack_bar.dart';
import 'package:shop_iti_app/core/helper/hive_helper.dart';
import 'package:shop_iti_app/features/layout/data/model/proudect_model/product.dart';

part 'favortie_product_states.dart';

class FavoriteProductCubit extends Cubit<FavortieProductStates> {
  FavoriteProductCubit() : super(FavortieProductInitial());
  bool isFavorite(ProductItemModel product) {
    final box = Hive.box<ProductItemModel>(HiveHelper.productItemModelBox);
    return box.containsKey(product.id);
  }

  void toggleFavoriteProduct(ProductItemModel product) async {
    final box =
        await Hive.openBox<ProductItemModel>(HiveHelper.productItemModelBox);
    if (box.containsKey(product.id)) {
      await HiveHelper.removeFavoriteProduct(product.id!);
      await addOrDeleteFavoriteInApi(product.id!);
      customSnackBar(
        subTitle: product.name!,
        text: 'Removed From Favorites',
      );
    } else {
      await HiveHelper.addFavoriteProduct(product);
      await addOrDeleteFavoriteInApi(product.id!);
      customSnackBar(
        subTitle: product.name!,
        text: 'Added To Favorites',
      );
    }
    emit(FavortieProductChangeState());
  }

  Future<void> addOrDeleteFavoriteInApi(int productId) async {
    emit(FavortieProductAddOrDeleteFavoriteProductLoading());
    try {
      Response<dynamic> response = await DioApi.postData(
        endPoint: DioEndPoint.dioFavorites,
        body: {
          'product_id': productId,
        },
        token: ConstantComponents.token,
      );
      emit(
        FavortieProductAddOrDeleteFavoriteProductSuccess(
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
      emit(FavortieProductAddOrDeleteFavoriteProductFaliure());
    }
  }
}
