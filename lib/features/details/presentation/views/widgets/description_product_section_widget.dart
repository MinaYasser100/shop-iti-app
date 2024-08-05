import 'package:flutter/material.dart';
import 'package:shop_iti_app/core/constant/constant.dart';
import 'package:shop_iti_app/core/styles/styles.dart';
import 'package:shop_iti_app/features/layout/data/model/proudect_model/product.dart';

class DescriptionProductSectionWidget extends StatelessWidget {
  const DescriptionProductSectionWidget({
    super.key,
    required this.productItemModel,
  });

  final ProductItemModel productItemModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          children: [
            Icon(
              Icons.description_rounded,
              color: ConstantComponents.firstColor,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Description: ',
              style: Styles.textStyle24,
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 34),
          child: Text(productItemModel.description ?? 'NO have description'),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
