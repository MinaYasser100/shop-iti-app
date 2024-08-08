import 'package:flutter/material.dart';
import 'package:shop_iti_app/core/styles/styles.dart';
import 'package:shop_iti_app/features/layout/data/model/proudect_model/product.dart';

class ProductPriceWidget extends StatelessWidget {
  const ProductPriceWidget({
    super.key,
    required this.productItemModel,
  });
  final ProductItemModel productItemModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '\$${productItemModel.price}',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Styles.textStyle18,
          ),
          if (productItemModel.discount != 0)
            Text(
              productItemModel.oldPrice.toString(),
              style: const TextStyle(
                color: Colors.grey,
                decoration: TextDecoration.lineThrough,
              ),
            )
        ],
      ),
    );
  }
}
