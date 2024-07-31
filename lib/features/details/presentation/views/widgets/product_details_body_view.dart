import 'package:flutter/material.dart';
import 'package:shop_iti_app/core/constant/constant.dart';
import 'package:shop_iti_app/core/styles/styles.dart';
import 'package:shop_iti_app/features/layout/data/model/proudect_model/product.dart';

import 'product_details_header_widget.dart';

class ProductDetailsBodyView extends StatelessWidget {
  const ProductDetailsBodyView({super.key, required this.productItemModel});
  final ProductItemModel productItemModel;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ProductDetailsHeaderWidget(),
            const SizedBox(
              height: 20,
            ),
            Container(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Hero(
                tag: 'productImage${productItemModel.id}',
                child: Image(
                  image: NetworkImage(productItemModel.image ?? ''),
                  height: 250,
                  width: MediaQuery.sizeOf(context).width * 0.6,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              productItemModel.name ?? 'This product not have name',
              maxLines: 6,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
            const Text(
              'Price:',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
            Text(
              '\$${productItemModel.price.toString()}',
              style: Styles.textStyle24.copyWith(
                color: ConstantComponents.firstColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
