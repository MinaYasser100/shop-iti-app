import 'package:flutter/material.dart';
import 'package:shop_iti_app/core/constant/constant.dart';
import 'package:shop_iti_app/core/styles/styles.dart';
import 'package:shop_iti_app/features/layout/data/model/proudect_model/product.dart';

class CustomImageGridItem extends StatelessWidget {
  const CustomImageGridItem({
    super.key,
    required this.productItemModel,
  });

  final ProductItemModel productItemModel;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Image(
          width: double.infinity,
          height: 180,
          image: NetworkImage(productItemModel.image ?? ''),
          fit: BoxFit.fill,
        ),
        if (productItemModel.discount != 0)
          Container(
            height: 30,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: ConstantComponents.firstColor,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(30),
              ),
            ),
            child: const Text(
              'Discount',
              style: Styles.textStyle20White,
            ),
          )
      ],
    );
  }
}
