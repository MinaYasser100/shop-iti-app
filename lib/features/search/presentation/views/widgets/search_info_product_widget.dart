import 'package:flutter/material.dart';
import 'package:shop_iti_app/core/constant/constant.dart';
import 'package:shop_iti_app/core/styles/styles.dart';
import 'package:shop_iti_app/features/layout/data/model/proudect_model/product.dart';

class SerachInfoProductWidget extends StatelessWidget {
  const SerachInfoProductWidget({
    super.key,
    required this.productItemModel,
  });
  final ProductItemModel productItemModel;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 190,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            const SizedBox(
              height: 5,
            ),
            Text(
              productItemModel.name ?? 'This product not have name',
              style: Styles.textStyle18.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.normal,
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            const Text(
              'Price : ',
              style: TextStyle(
                color: ConstantComponents.firstColor,
              ),
            ),
            Text(
              '\$${productItemModel.price}',
              style: Styles.textStyle20,
            ),
            if (productItemModel.discount != 0)
              const Text(
                'Old Price : ',
                style: TextStyle(
                  color: ConstantComponents.firstColor,
                ),
              ),
            if (productItemModel.discount != 0)
              Text(
                '\$${productItemModel.oldPrice}',
                style: Styles.textStyle20.copyWith(
                  decoration: TextDecoration.lineThrough,
                  fontWeight: FontWeight.normal,
                  color: Colors.grey,
                ),
              ),
            const SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    );
  }
}
