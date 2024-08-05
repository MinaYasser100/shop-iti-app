import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_iti_app/features/details/presentation/manager/cart_states_cubit/cart_states_cubit.dart';
import 'package:shop_iti_app/features/details/presentation/views/func/name_product_method.dart';
import 'package:shop_iti_app/features/layout/data/model/proudect_model/product.dart';

import 'button_cart_states.dart';
import 'custom_image_product_details.dart';
import 'description_product_section_widget.dart';
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
          child: BlocProvider(
            create: (context) =>
                CartStatesCubit()..determineState(productItemModel),
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
                DescriptionProductSectionWidget(
                  productItemModel: productItemModel,
                ),
                ButtonCartStates(
                  productItemModel: productItemModel,
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
