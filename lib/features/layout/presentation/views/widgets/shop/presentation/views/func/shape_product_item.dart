import 'package:flutter/material.dart';
import 'package:shop_iti_app/core/constant/constant.dart';

RoundedRectangleBorder shapeProductItem() {
  return RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10), // Corner radius
    side: const BorderSide(
      color: ConstantComponents.firstColor, // Border color
      width: 1, // Border width
    ),
  );
}
