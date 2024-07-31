import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_iti_app/core/constant/constant.dart';
import 'package:shop_iti_app/core/styles/styles.dart';

import '../manager/shop_screen_cubit/shop_screen_cubit.dart';
import 'widget/shop_body_success_state.dart';
import 'widget/shop_data_error_response_widget.dart';
import 'widget/shop_data_failure_widget.dart';

class ShopBodyView extends StatelessWidget {
  const ShopBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: BlocBuilder<ShopScreenCubit, ShopScreenState>(
            builder: (context, state) {
              if (state is ShopScreenGetShopDataLoading ||
                  context.read<ShopScreenCubit>().proudectsModel == null) {
                return Center(
                  child: Text(
                    'Loading...',
                    style: Styles.textStyle30.copyWith(
                      color: ConstantComponents.firstColor,
                    ),
                  ),
                );
              } else if (state is ShopScreenGetShopDataSuceess &&
                  context.read<ShopScreenCubit>().proudectsModel != null) {
                return ShopBodySuceessState(
                    proudectsModel: state.proudectsModel);
              } else if (state is ShopScreenGetShopDataErrorResponse) {
                return ShopDataErrorResponseWidget(
                  message: state.message,
                  statusCode: state.statusCode,
                );
              } else {
                return const ShopDataFailureWidget();
              }
            },
          ),
        ),
      ],
    );
  }
}
