import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:shop_iti_app/core/constant/constant.dart';
import 'package:shop_iti_app/core/pages/get_pages.dart';
import 'package:shop_iti_app/core/styles/styles.dart';
import 'package:shop_iti_app/features/layout/presentation/views/widgets/shop/presentation/manager/shop_screen_cubit/shop_screen_cubit.dart';

Row shopAppBar(BuildContext context) {
  return Row(
    children: [
      const Expanded(
        child: Text(
          'Find Your Product here...',
          style: Styles.textStyle30,
        ),
      ),
      const SizedBox(
        width: 20,
      ),
      Container(
        height: 70,
        decoration: BoxDecoration(
          color: ConstantComponents.firstColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(22),
        ),
        child: IconButton(
          onPressed: () {
            Get.toNamed(GetPages.kSearchView,
                arguments: context
                    .read<ShopScreenCubit>()
                    .proudectsModel!
                    .data!
                    .products!);
          },
          icon: const Icon(
            FontAwesomeIcons.magnifyingGlass,
            color: ConstantComponents.firstColor,
          ),
        ),
      ),
    ],
  );
}
