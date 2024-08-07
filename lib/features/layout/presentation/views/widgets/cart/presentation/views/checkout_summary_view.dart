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
        padding: const EdgeInsets.only(top: 80.0),
        child: Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Total: \$${subtotal.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 20.0),
                Text(
                  'Delivery Charge: \$${deliveryCharge.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
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
                Center(
                  child: Column(
                    children: [

                      Icon(
                        Icons.calculate,
                        size: 100.0,
                        color: ConstantComponents.firstColor,
                      ),
                      const SizedBox(height: 10.0),
                      const Text(
                        'Review your items and proceed to Cart',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 50.0),
                      ElevatedButton(
                        onPressed: () {
                          // Navigate back to the home page
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
