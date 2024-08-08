import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_iti_app/core/func/custom_snack_bar.dart';

import '../../manager/favorite_cubit.dart';
import 'empty_list_widget.dart';
import 'favorite_error_widget.dart';
import 'favorite_list_view_builder.dart';

class FavoritesBodyBlocConsumer extends StatelessWidget {
  const FavoritesBodyBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FavoriteCubit, FavortieStates>(
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
              : const EmptyListWidget(
                  icon: Icons.favorite_border,
                  text: 'No favorites items',
                ),
        );
      }
    });
  }
}
