import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_iti_app/core/func/custom_snack_bar.dart';
import 'package:shop_iti_app/core/styles/styles.dart';
import 'package:shop_iti_app/features/layout/presentation/views/widgets/cart/presentation/manager/cart_cubit.dart';

import '../../../../favorite/presentation/views/widgets/empty_list_widget.dart';
import 'cart_list_view_builder_widget.dart';

class CartBodyBlocConsumer extends StatelessWidget {
  const CartBodyBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartCubit, CartStates>(listener: (context, state) {
      if (state is CartCubitRemoveProductFromCartSuccess) {
        customSnackBar(
          subTitle: 'Success remove product from cart',
          text: 'Remove From Cart',
        );
      }
    }, builder: (context, state) {
      if (State is CartCubitGetCartDataLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (state is CartCubitGetCartDataFailure) {
        return const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'An error occurred while fetching data',
              style: Styles.textStyle20Failure,
            ),
          ],
        );
      } else {
        return context.read<CartCubit>().cartproduct.isNotEmpty
            ? const CartListViewbuilderWidget()
            : const EmptyListWidget(
                icon: Icons.shopping_bag,
                text: 'No Products items in cart',
              );
      }
    });
  }
}
