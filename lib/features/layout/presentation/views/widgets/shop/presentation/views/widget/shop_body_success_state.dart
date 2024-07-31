import 'package:flutter/material.dart';
import 'package:shop_iti_app/features/layout/data/model/proudect_model/banner_model.dart';
import 'package:shop_iti_app/features/layout/data/model/proudect_model/proudect_model.dart';

import 'shop_banners_widget.dart';

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
          child: SizedBox(
            height: 20,
          ),
        ),
        SliverToBoxAdapter(
          child: ShopBannersWidget(banners: banners),
        ),
      ],
    );
  }
}
