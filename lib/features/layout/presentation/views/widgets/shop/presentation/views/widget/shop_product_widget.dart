import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shop_iti_app/core/constant/constant.dart';
import 'package:shop_iti_app/core/styles/styles.dart';
import 'package:shop_iti_app/features/layout/data/model/proudect_model/product.dart';

import 'custom_image_grid_item.dart';

class ShopProductWidget extends StatelessWidget {
  const ShopProductWidget({
    super.key,
    required this.productItemModel,
  });
  final ProductItemModel productItemModel;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Card(
          color: Colors.white,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10), // Corner radius
            side: const BorderSide(
              color: ConstantComponents.firstColor, // Border color
              width: 1, // Border width
            ),
          ),
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
              Padding(
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
                    Text(
                      productItemModel.oldPrice.toString(),
                      style: const TextStyle(
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 2,
              ),
            ],
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
