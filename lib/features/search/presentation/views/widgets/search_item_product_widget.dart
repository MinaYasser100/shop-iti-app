import 'package:flutter/material.dart';
import 'package:shop_iti_app/features/layout/data/model/proudect_model/product.dart';

import 'search_image_widget.dart';
import 'search_info_product_widget.dart';

class SearchItemProductWidget extends StatelessWidget {
  const SearchItemProductWidget({
    super.key,
    required this.productItemModel,
  });
  final ProductItemModel productItemModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),
          child: SearchImageWidget(
            productItemModel: productItemModel,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        SerachInfoProductWidget(
          productItemModel: productItemModel,
        ),
      ],
    );
  }
}
