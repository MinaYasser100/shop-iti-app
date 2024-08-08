import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_iti_app/core/constant/constant.dart';
import 'package:shop_iti_app/features/layout/presentation/views/widgets/cart/presentation/manager/cart_cubit.dart';

import 'widgets/cart_body_bloc_consumer.dart';

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
        body: const CartBodyBlocConsumer(),
      ),
    );
  }
}
