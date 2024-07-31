import 'package:flutter/material.dart';
import 'package:shop_iti_app/features/layout/data/model/proudect_model/banner_model.dart';
import 'package:shop_iti_app/features/layout/data/model/proudect_model/proudect_model.dart';
import 'package:shop_iti_app/features/layout/presentation/views/widgets/shop/presentation/views/widget/shop_header.dart';

import '../func/shop_products_header.dart';
import 'shop_banners_widget.dart';
import 'shop_products_sliver_grid_widget.dart';

class ShopBodySuceessState extends StatelessWidget {
  const ShopBodySuceessState({
    super.key,
    required this.proudectsModel,
  });
  final ProudectModel proudectsModel;
  @override
  Widget build(BuildContext context) {
    List<BannerModel>? banners = proudectsModel.data!.banners;
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(
          child: ShopHeader(),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 20,
          ),
        ),
        SliverToBoxAdapter(
          child: ShopBannersWidget(banners: banners),
        ),
        SliverToBoxAdapter(
          child: shopProductsHeader(),
        ),
        ShopProductsSliverGridWidget(proudectsModel: proudectsModel),
      ],
    );
  }
}
