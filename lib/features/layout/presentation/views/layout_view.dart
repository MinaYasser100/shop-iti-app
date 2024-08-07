import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shop_iti_app/features/layout/presentation/manager/layout_cubit/layout_screen_cubit.dart';

import 'widgets/layout_widget/bottom_navigation_bar_widget.dart';

class LayoutView extends StatelessWidget {
  const LayoutView({super.key});
  static const List<IconData> icons = [
    FontAwesomeIcons.shop,
    FontAwesomeIcons.solidHeart,
    FontAwesomeIcons.cartShopping,
    FontAwesomeIcons.gear,
  ];
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LayoutScreenCubit>();
    return BlocBuilder<LayoutScreenCubit, LayoutScreenState>(
      builder: (context, state) {
        return Scaffold(
          body: cubit.layoutScreens[cubit.currentIndex],
          bottomNavigationBar: BottonNavigationBarWidget(
            icons: icons,
            cubit: cubit,
          ),
        );
      },
    );
  }
}
