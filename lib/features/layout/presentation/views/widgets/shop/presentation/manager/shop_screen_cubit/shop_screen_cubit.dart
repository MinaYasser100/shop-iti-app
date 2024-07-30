import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_iti_app/core/api/dio_api.dart';
import 'package:shop_iti_app/core/api/dio_end_point.dart';
import 'package:shop_iti_app/features/layout/data/model/proudect_model/proudect_model.dart';

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
        emit(ShopScreenGetShopDataSuceess());
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
}
