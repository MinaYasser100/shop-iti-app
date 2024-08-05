import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_iti_app/core/constant/constant.dart';
import 'package:shop_iti_app/core/func/custom_snack_bar.dart';
import 'package:shop_iti_app/core/styles/styles.dart';
import 'package:shop_iti_app/features/details/presentation/manager/cart_states_cubit/cart_states_cubit.dart';
import 'package:shop_iti_app/features/layout/data/model/proudect_model/product.dart';

class ButtonCartStates extends StatelessWidget {
  const ButtonCartStates({
    super.key,
    required this.productItemModel,
  });
  final ProductItemModel productItemModel;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartStatesCubit, CartStatesStates>(
        listener: (context, state) {
      if (state is CartStatesAddOrDeleteProductCartInApifailure) {
        customSnackBar(
          subTitle: 'Error',
          text: state.errorMessage,
          color: Colors.red,
        );
      }
    }, builder: (context, state) {
      if (state is CartStatesToggleCartProductsLoading ||
          state is CartStatesAddOrDeleteProductCartInApiLoading ||
          state is CartStatesAddOrDeleteProductCartInApiSuccess ||
          state is CartStatesAddOrDeleteProductCartInApifailure ||
          state is CartStatesGetCartProductsLoading ||
          state is CartStatesGetCartProductsSuccess ||
          state is CartStatesGetCartProductsFailure) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else {
        return Container(
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: ConstantComponents.firstColor,
          ),
          child: MaterialButton(
            onPressed: () {
              context
                  .read<CartStatesCubit>()
                  .toggleProductInCart(product: productItemModel);
            },
            child: Text(
              context.read<CartStatesCubit>().determineState(productItemModel)
                  ? 'Remove To Cart'
                  : 'Add To Cart',
              style: Styles.textStyle20White.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      }
    });
  }
}
