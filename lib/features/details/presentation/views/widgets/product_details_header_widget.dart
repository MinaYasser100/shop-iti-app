import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_iti_app/core/constant/constant.dart';
import 'package:shop_iti_app/core/styles/styles.dart';

class ProductDetailsHeaderWidget extends StatelessWidget {
  const ProductDetailsHeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const CircleAvatar(
            radius: 18,
            backgroundColor: ConstantComponents.firstColor,
            child: Icon(
              Icons.arrow_back_ios_new,
              color: ConstantComponents.secondColor,
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          'Details',
          style:
              Styles.textStyle30.copyWith(color: ConstantComponents.firstColor),
        )
      ],
    );
  }
}
