import 'package:flutter/material.dart';
import 'package:shop_iti_app/core/styles/styles.dart';
import 'package:shop_iti_app/features/layout/data/model/proudect_model/product.dart';

class ShopProductWidget extends StatelessWidget {
  const ShopProductWidget({
    super.key,
    required this.productItemModel,
  });
  final ProductItemModel productItemModel;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(
            width: double.infinity,
            height: 180,
            image: NetworkImage(productItemModel.image ?? ''),
            fit: BoxFit.fill,
          ),
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
            padding: const EdgeInsets.only(left: 5),
            child: Text(
              '${productItemModel.price}\$',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Styles.textStyle18,
            ),
          ),
          const SizedBox(
            height: 2,
          ),
        ],
      ),
    );
  }
}
