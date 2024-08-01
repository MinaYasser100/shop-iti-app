import 'package:flutter/material.dart';

Text nameProductMehtod(String productName) {
  return Text(
    productName,
    maxLines: 6,
    overflow: TextOverflow.ellipsis,
    style: const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w500,
    ),
    textAlign: TextAlign.center,
  );
}
