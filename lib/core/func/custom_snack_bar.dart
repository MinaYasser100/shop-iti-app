
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_iti_app/core/constant/constant.dart';

void customSnackBar(
    {required String subTitle, required String text, Color? color}) {

  Get.snackbar(
    text,
    subTitle,
    snackPosition: SnackPosition.TOP,
    backgroundColor: color ?? ConstantComponents.firstColor,
    colorText: ConstantComponents.secondColor,

  );
}
