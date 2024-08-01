import 'package:flutter/material.dart';
import 'package:shop_iti_app/core/constant/constant.dart';
import 'package:shop_iti_app/core/styles/styles.dart';
import 'package:shop_iti_app/features/details/presentation/views/func/name_product_method.dart';
import 'package:shop_iti_app/features/layout/data/model/proudect_model/product.dart';

import 'custom_image_product_details.dart';
import 'price_product_details_widget.dart';
import 'product_details_header_widget.dart';

class ProductDetailsBodyView extends StatelessWidget {
  const ProductDetailsBodyView({super.key, required this.productItemModel});
  final ProductItemModel productItemModel;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ProductDetailsHeaderWidget(),
              const SizedBox(
                height: 20,
              ),
              CustomImageProductDetails(productItemModel: productItemModel),
              const SizedBox(
                height: 20,
              ),
              nameProductMehtod(
                  productItemModel.name ?? 'This product not have name'),
              const SizedBox(
                height: 10,
              ),
              PriceProductDetailsWidget(
                productItemModel: productItemModel,
              ),
              const SizedBox(
                height: 10,
              ),
              const Row(
                children: [
                  Icon(
                    Icons.description_rounded,
                    color: ConstantComponents.firstColor,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Description: ',
                    style: Styles.textStyle24,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 34),
                child:
                    Text(productItemModel.description ?? 'NO have description'),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: ConstantComponents.firstColor,
                ),
                child: MaterialButton(
                  onPressed: () {},
                  child: Text(
                    'Add To Cart',
                    style: Styles.textStyle20White.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
