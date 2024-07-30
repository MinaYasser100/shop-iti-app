import 'package:flutter/material.dart';
import 'package:shop_iti_app/core/styles/styles.dart';

class ShopDataErrorResponseWidget extends StatelessWidget {
  const ShopDataErrorResponseWidget({
    super.key,
    required this.statusCode,
    required this.message,
  });
  final int statusCode;
  final String message;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Text(
          'Error $statusCode: $message',
          style: Styles.textStyle20Failure,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
