import 'package:get/get.dart';
import 'package:shop_iti_app/core/constant/constant.dart';

void customSnackBar({required String productName, required String text}) {
  Get.snackbar(
    text,
    productName,
    snackPosition: SnackPosition.TOP,
    backgroundColor: ConstantComponents.firstColor,
    colorText: ConstantComponents.secondColor,
  );
}
