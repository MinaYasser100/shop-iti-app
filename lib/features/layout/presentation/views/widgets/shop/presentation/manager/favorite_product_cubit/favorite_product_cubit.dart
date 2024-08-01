import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
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
      HiveHelper.removeFavoriteProduct(product);
    } else {
      await HiveHelper.addFavoriteProduct(product);
    }
    emit(FavortieProductChangeState());
  }
}
