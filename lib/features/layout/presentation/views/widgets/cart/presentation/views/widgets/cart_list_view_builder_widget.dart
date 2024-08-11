
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../manager/cart_cubit.dart';
import 'cart_item_widget.dart';

class CartListViewbuilderWidget extends StatelessWidget {
  const CartListViewbuilderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartStates>(
      builder: (context, state) {
        return ListView.builder(
          itemCount: context.read<CartCubit>().cartproduct.length,
          itemBuilder: (context, index) {
            final cartItem = context.read<CartCubit>().cartproduct[index];
            return CartItemWidget(
              image: cartItem.product!.image ?? '',
              price: cartItem.product!.price!,
              title: cartItem.product!.name ?? 'This product does not have a name',
              quantity: cartItem.quantity!,
              id: cartItem.product!.id!.toInt(),
            );
          },
        );
      },
    );
  }
}
