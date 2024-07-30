import 'package:flutter/material.dart';
import 'package:shop_iti_app/core/constant/constant.dart';
import 'package:shop_iti_app/features/layout/presentation/manager/layout_cubit/layout_screen_cubit.dart';
import 'package:shop_iti_app/features/layout/presentation/views/func/naviagtion_item_button.dart';

class BottonNavigationBarWidget extends StatelessWidget {
  const BottonNavigationBarWidget({
    super.key,
    required this.icons,
    required this.cubit,
  });

  final List<IconData> icons;
  final LayoutScreenCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      height: 70,
      decoration: const BoxDecoration(
        color: ConstantComponents.firstColor,
        borderRadius: BorderRadius.all(Radius.circular(25)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          for (int i = 0; i < icons.length; i++)
            navigationItemButton(
              icon: icons[i],
              onPressed: () {
                cubit.changeBodyScreen(i);
              },
              isActive: cubit.currentIndex == i,
            ),
        ],
      ),
    );
  }
}
