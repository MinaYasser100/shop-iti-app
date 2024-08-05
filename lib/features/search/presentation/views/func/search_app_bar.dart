import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_iti_app/core/constant/constant.dart';
import 'package:shop_iti_app/core/styles/styles.dart';

AppBar searchAppBar() {
  return AppBar(
    backgroundColor: ConstantComponents.secondColor,
    leading: Padding(
      padding: const EdgeInsets.only(left: 5),
      child: IconButton(
        onPressed: () {
          Get.back();
        },
        icon: const Icon(
          Icons.arrow_back_ios,
          color: ConstantComponents.firstColor,
        ),
      ),
    ),
    title: Text(
      'Search',
      style: Styles.textStyle24.copyWith(
        color: ConstantComponents.firstColor,
      ),
    ),
    titleSpacing: 0,
  );
}
