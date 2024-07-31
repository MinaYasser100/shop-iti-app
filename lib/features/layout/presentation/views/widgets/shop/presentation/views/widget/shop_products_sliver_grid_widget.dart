import 'package:flutter/material.dart';
import 'package:shop_iti_app/features/layout/data/model/proudect_model/proudect_model.dart';

import 'shop_product_widget.dart';

class ShopProductsSliverGridWidget extends StatelessWidget {
  const ShopProductsSliverGridWidget({
    super.key,
    required this.proudectsModel,
  });

  final ProudectModel proudectsModel;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of columns in the grid
          mainAxisSpacing: 5.0, // Vertical spacing between items
          crossAxisSpacing: 5.0, // Horizontal spacing between items
          childAspectRatio: 0.63, // Aspect ratio of each item
        ),
        delegate: SliverChildBuilderDelegate(
          (context, index) => ShopProductWidget(
            productItemModel: proudectsModel.data!.products![index],
          ),
          childCount: proudectsModel.data!.products!.length,
        ),
      ),
    );
  }
}
