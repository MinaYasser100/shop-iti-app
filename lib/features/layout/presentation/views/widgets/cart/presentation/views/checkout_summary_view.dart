import 'package:flutter/material.dart';
import 'package:shop_iti_app/core/constant/constant.dart';

class CheckoutSummaryView extends StatelessWidget {
  final double subtotal;
  final double deliveryCharge;
  final double total;

  CheckoutSummaryView({
    required this.subtotal,
    required this.deliveryCharge,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Checkout Summary',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 22.0,
          ),
        ),
        backgroundColor: ConstantComponents.firstColor,
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top:150.0),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Total: \$${subtotal.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 20.0),
                Text(
                  'Delivery Charge: \$${deliveryCharge.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 20.0),
                Text(
                  'Subtotal: \$${total.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: () {

                    Navigator.of(context).popUntil((route) => route.isFirst);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ConstantComponents.firstColor,
                    padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 100.0),
                  ),
                  child: const Text(
                    'Back to Cart',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
