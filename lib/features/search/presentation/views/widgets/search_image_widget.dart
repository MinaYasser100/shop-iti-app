import 'package:flutter/material.dart';
import 'package:shop_iti_app/core/constant/constant.dart';
import 'package:shop_iti_app/core/styles/styles.dart';
import 'package:shop_iti_app/features/layout/data/model/proudect_model/product.dart';

class SearchImageWidget extends StatelessWidget {
  const SearchImageWidget({
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
          fit: BoxFit.fill,
          height: 190,
          width: 140,
          image: NetworkImage(productItemModel.image ?? ''),
        ),
        if (productItemModel.discount != 0)
          Container(
            height: 30,
            width: 140,
            decoration: const BoxDecoration(
              color: ConstantComponents.firstColor,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(40),
              ),
            ),
            child: const Text(
              '  Discount',
              style: Styles.textStyle20White,
            ),
          )
      ],
    );
  }
}
