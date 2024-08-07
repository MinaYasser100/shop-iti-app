import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:shop_iti_app/core/pages/get_pages.dart';
import 'package:shop_iti_app/features/layout/data/model/proudect_model/product.dart';

import '../../manager/favorite_cubit.dart';
import 'favorite_item_widget.dart';

class FavoriteListViewBuilder extends StatelessWidget {
  const FavoriteListViewBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteCubit, FavortieStates>(
        builder: (context, state) {
      return ListView.builder(
        itemCount: context.read<FavoriteCubit>().favoriteProduct.length,
        itemBuilder: (context, index) {
          final entry = context.read<FavoriteCubit>().favoriteProduct;

          return GestureDetector(
            onTap: () {
              Get.toNamed(
                GetPages.kProductDetails,
                arguments: entry[index] as ProductItemModel,
              );
            },
            child: FavoriteItemWidget(
              image: entry[index].image ?? '',
              price: entry[index].price!,
              title: entry[index].name ?? 'This product does not have a name',
              id: entry[index].id!.toInt(),
            ),
            // child: FavoriteItemWidget(
            //   image: entry[index].product!.image ?? '',
            //   price: entry[index].product!.price!,
            //   title: entry[index].product!.name ??
            //       'This product does not have a name',
            //   id: entry[index].product!.id!.toInt(),
            // ),
          );
        },
      );
    });
  }
}
