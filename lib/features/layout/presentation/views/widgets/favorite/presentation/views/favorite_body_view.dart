import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_iti_app/core/constant/constant.dart';
import 'package:shop_iti_app/core/func/custom_snack_bar.dart';
import 'package:shop_iti_app/features/layout/presentation/views/widgets/favorite/presentation/manager/favorite_cubit.dart';

import 'widgets/empty_favorites_list_widget.dart';
import 'widgets/favorite_error_widget.dart';
import 'widgets/favorite_list_view_builder.dart';

class FavoriteBodyView extends StatelessWidget {
  const FavoriteBodyView({super.key});

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
              child: FavoriteErrorWidget(),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: context.read<FavoriteCubit>().favoriteProduct.isNotEmpty
                  ? const FavoriteListViewBuilder()
                  : const EmptyFavoritesListWidget(),
            );
          }
        }),
      ),
    );
  }
}
