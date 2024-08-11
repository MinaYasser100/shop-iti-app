
import 'package:flutter/material.dart';
import 'package:shop_iti_app/features/layout/data/model/proudect_model/product.dart';

class CustomImageProductDetails extends StatelessWidget {
  const CustomImageProductDetails({
    super.key,
    required this.productItemModel,
  });
  final ProductItemModel productItemModel;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
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
    );
  }
}
