import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_iti_app/core/constant/constant.dart';
import 'package:shop_iti_app/core/func/custom_snack_bar.dart';
import 'package:shop_iti_app/core/styles/styles.dart';
import 'package:shop_iti_app/features/layout/presentation/views/widgets/favorite/presentation/manager/favorite_cubit.dart';

import 'widgets/favorite_item_widget.dart';

class FavoriteBodyView extends StatefulWidget {
  const FavoriteBodyView({super.key});
  @override
  _FavoriteBodyViewState createState() => _FavoriteBodyViewState();
}

class _FavoriteBodyViewState extends State<FavoriteBodyView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavoriteCubit()..getFavoriteData(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ConstantComponents.firstColor,
          title: const Text(
            'My Favorites',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 22.0,
            ),
          ),
          centerTitle: true,
        ),
        body: BlocConsumer<FavoriteCubit, FavortieStates>(
            listener: (context, state) {
          if (state is FavoriteCubitRemoveFavoriteDataSuccess) {
            customSnackBar(
              subTitle: 'success the remove',
              text: 'Remove product',
            );
          }
        }, builder: (context, state) {
          if (state is FavoriteCubitGetFavoriteDataLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is FavoriteCubitGetFavoriteDataFailure) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'An error occurred while fetching data',
                    style: Styles.textStyle20Failure,
                  ),
                ],
              ),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: context.read<FavoriteCubit>().favoriteProduct.isNotEmpty
                  ? ListView.builder(
                      itemCount:
                          context.read<FavoriteCubit>().favoriteProduct.length,
                      itemBuilder: (context, index) {
                        final entry =
                            context.read<FavoriteCubit>().favoriteProduct;

                        return GestureDetector(
                          onTap: () {
                            // Get.toNamed(
                            //   GetPages.kProductDetails,
                            // );
                          },
                          child: FavoriteItemWidget(
                            image: entry[index].product!.image ?? '',
                            price: entry[index].product!.price!,
                            title: entry[index].product!.name ??
                                'This product does not have a name',
                            id: entry[index].product!.id!.toInt(),
                          ),
                        );
                      },
                    )
                  : const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.favorite_border_rounded,
                      size: 100.0,
                      color: ConstantComponents.firstColor,
                    ),
                    SizedBox(height: 20.0),
                    Text(
                      'Add to Favorites',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                    ),
            );
          }
        }),
      ),
    );
  }
}
