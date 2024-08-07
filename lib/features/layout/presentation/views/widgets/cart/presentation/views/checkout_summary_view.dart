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
        centerTitle: true, // لجعل العنوان في المنتصف
        automaticallyImplyLeading: false, // لإخفاء السهم
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // لتوسيط العناصر في العمود
            crossAxisAlignment: CrossAxisAlignment.center, // لتوسيط العناصر في العمود
            children: [
              Text(
                'Total: \$${subtotal.toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 18.0),
              ),
              const SizedBox(height: 8.0),
              Text(
                'Delivery Charge: \$${deliveryCharge.toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 18.0),
              ),
              const SizedBox(height: 8.0),
              Text(
                'Subtotal: \$${total.toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              const Spacer(),
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
      ),
    );
  }
}
