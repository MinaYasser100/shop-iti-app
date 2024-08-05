import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_iti_app/features/layout/data/model/proudect_model/product.dart';

part 'search_states.dart';

class SearchCubit extends Cubit<SearchStates> {
  SearchCubit(this.proudctsList) : super(SearchCubitInitial());
  final List<ProductItemModel> proudctsList;

  void searchForProdcute(String text) {
    emit(SearchCubitSearchDataLoading());
    try {
      List<ProductItemModel> restult = proudctsList
          .where((element) =>
              element.name!.toLowerCase().contains(text.toLowerCase()))
          .toList();
      emit(SearchCubitSearchDataSuccess(resultProducts: restult));
    } catch (e) {
      emit(SearchCubitSearchDataFailure());
    }
  }
}
