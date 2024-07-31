import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_iti_app/features/layout/data/model/proudect_model/product.dart';

import 'widgets/product_details_body_view.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key});
  @override
  Widget build(BuildContext context) {
    final ProductItemModel productItemModel = Get.arguments;
    return Scaffold(
      body: ProductDetailsBodyView(
        productItemModel: productItemModel,
      ),
    );
  }
}
