import 'package:flutter/material.dart';
import 'package:shop_iti_app/features/layout/data/model/proudect_model/product.dart';

import 'search_item_product_widget.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({
    super.key,
    required this.resultProducts,
  });
  final List<ProductItemModel> resultProducts;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => SearchItemProductWidget(
        productItemModel: resultProducts[index],
      ),
      separatorBuilder: (context, index) => const SizedBox(
        height: 10,
      ),
      itemCount: resultProducts.length,
    );
  }
}
