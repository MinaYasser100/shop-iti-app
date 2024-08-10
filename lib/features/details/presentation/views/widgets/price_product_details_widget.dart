
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shop_iti_app/core/constant/constant.dart';
import 'package:shop_iti_app/core/styles/styles.dart';
import 'package:shop_iti_app/features/layout/data/model/proudect_model/product.dart';

class PriceProductDetailsWidget extends StatelessWidget {
  const PriceProductDetailsWidget({
    super.key,
    required this.productItemModel,
  });
  final ProductItemModel productItemModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              FontAwesomeIcons.circleDollarToSlot,
              color: ConstantComponents.firstColor,
            ),
            const SizedBox(
              width: 10,
            ),
            const Text(
              'Price:',
              style: Styles.textStyle20,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              '\$${productItemModel.price.toString()}',
              style: Styles.textStyle20,
            ),
          ],
        ),
        if (productItemModel.discount != 0)
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.money_off_csred_rounded,
                color: ConstantComponents.firstColor,
              ),
              const SizedBox(
                width: 10,
              ),
              const Text(
                'Old Price:',
                style: Styles.textStyle20,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                '\$${productItemModel.oldPrice.toString()}',
                style: Styles.textStyle18.copyWith(
                  color: Colors.grey,
                  decoration: TextDecoration.lineThrough,
                ),
              ),
            ],
          ),
      ],
    );
  }
}
