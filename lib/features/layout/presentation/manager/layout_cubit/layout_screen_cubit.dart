import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_iti_app/features/layout/presentation/views/widgets/cart/presentation/views/cart_body_view.dart';
import 'package:shop_iti_app/features/layout/presentation/views/widgets/favorite/presentation/views/favorite_body_view.dart';
import 'package:shop_iti_app/features/layout/presentation/views/widgets/settings/presentation/views/settings_view.dart';
import 'package:shop_iti_app/features/layout/presentation/views/widgets/settings/presentation/views/widgets/settings_body_view.dart';
import 'package:shop_iti_app/features/layout/presentation/views/widgets/shop/presentation/views/shop_body_view.dart';

part 'layout_screen_state.dart';

class LayoutScreenCubit extends Cubit<LayoutScreenState> {
  LayoutScreenCubit() : super(LayoutScreenInitial());

  int currentIndex = 0;

  List<Widget> layoutScreens = const [
    ShopBodyView(),
    FavoriteBodyView(),
    CartBodyView(),
    SettingsBodyView(),
  ];

  void changeBodyScreen(int index) {
    currentIndex = index;
    emit(LayoutScreenChangeBodyScreen());
  }
}
