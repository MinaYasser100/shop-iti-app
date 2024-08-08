import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_iti_app/core/constant/constant.dart';
import 'package:shop_iti_app/core/func/custom_snack_bar.dart';
import 'package:shop_iti_app/core/styles/styles.dart';
import 'package:shop_iti_app/features/layout/presentation/views/widgets/cart/presentation/manager/cart_cubit.dart';

import 'widgets/cart_item_widget.dart';

class CartBodyView extends StatelessWidget {
  const CartBodyView({super.key});

  // double _calculateSubtotal() {
  //   return cartItems.fold(
  //       0, (sum, item) => sum + (item['price'] * item['quantity']));
  // }

  // double _calculateDeliveryCharge() {
  //   return 10.0; // مثلا يعنى
  // }

  // double _calculateTotal() {
  //   return _calculateSubtotal() + _calculateDeliveryCharge();
  // }

  // void _navigateToCheckout() {
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(
  //       builder: (context) => CheckoutSummaryView(
  //         subtotal: _calculateSubtotal(),
  //         deliveryCharge: _calculateDeliveryCharge(),
  //         total: _calculateTotal(),
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit()..getCartData(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ConstantComponents.firstColor,
          title: const Text(
            'Cart Items',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 22.0,
            ),
          ),
          centerTitle: true,
        ),
        body: BlocConsumer<CartCubit, CartStates>(listener: (context, state) {
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
                ? ListView.builder(
                    itemCount: context.read<CartCubit>().cartproduct.length,
                    itemBuilder: (context, index) {
                      final cartItem =
                          context.read<CartCubit>().cartproduct[index];
                      return CartItemWidget(
                        image: cartItem.product!.image ?? '',
                        price: cartItem.product!.price!,
                        title: cartItem.product!.name ??
                            'This product does not have a name',
                        quantity: cartItem.quantity!,
                        id: cartItem.product!.id!.toInt(),
                      );
                    },
                  )
                : const Center(
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.shopping_bag,
                          size: 100.0,
                          color: ConstantComponents.firstColor,
                        ),
                        SizedBox(height: 20.0),
                        Text(
                          'No Product items in cart',
                          style: Styles.textStyle24,
                        ),
                      ],
                    ),
                  );
          }
        }),
      ),
    );
  }
}
