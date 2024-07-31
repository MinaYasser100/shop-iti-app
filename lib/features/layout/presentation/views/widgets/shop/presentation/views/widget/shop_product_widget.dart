import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:shop_iti_app/core/constant/constant.dart';
import 'package:shop_iti_app/core/pages/get_pages.dart';
import 'package:shop_iti_app/features/layout/data/model/proudect_model/product.dart';

import '../func/shape_product_item.dart';
import 'custom_image_grid_item.dart';
import 'product_price_widget.dart';

class ShopProductsWidget extends StatelessWidget {
  const ShopProductsWidget({
    super.key,
    required this.productItemModel,
  });
  final ProductItemModel productItemModel;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        GestureDetector(
          onTap: () {
            Get.toNamed(GetPages.kProductDetails, arguments: productItemModel);
          },
          child: Card(
            color: Colors.white,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            shape: shapeProductItem(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomImageGridItem(productItemModel: productItemModel),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Text(
                    productItemModel.name ?? 'This proudct not has name',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const Spacer(),
                ProductPriceWidget(
                  productItemModel: productItemModel,
                ),
                const SizedBox(
                  height: 2,
                ),
              ],
            ),
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const CircleAvatar(
            radius: 15,
            backgroundColor: ConstantComponents.firstColor,
            child: Icon(
              FontAwesomeIcons.solidHeart,
              size: 20,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
