import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_iti_app/core/constant/constant.dart';
import 'package:shop_iti_app/core/styles/styles.dart';
import 'package:shop_iti_app/features/details/presentation/manager/cart_states_cubit/cart_states_cubit.dart';

class ButtonCartStates extends StatelessWidget {
  const ButtonCartStates({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartStatesCubit, CartStatesStates>(
        builder: (context, state) {
      return Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: ConstantComponents.firstColor,
        ),
        child: MaterialButton(
          onPressed: () {
            context.read<CartStatesCubit>().addOrDeleteFormCart();
          },
          child: Text(
            'Add To Cart',
            style: Styles.textStyle20White.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
    });
  }
}
