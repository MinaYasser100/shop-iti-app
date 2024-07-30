import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_iti_app/features/layout/presentation/views/widgets/cart/presentation/views/cart_body_view.dart';
import 'package:shop_iti_app/features/layout/presentation/views/widgets/favorite/presentation/views/favorite_body_view.dart';
import 'package:shop_iti_app/features/layout/presentation/views/widgets/shop/presentation/views/shop_body_view.dart';

part 'layout_screen_state.dart';

class LayoutScreenCubit extends Cubit<LayoutScreenState> {
  LayoutScreenCubit() : super(LayoutScreenInitial());

  List<Widget> layoutScreens = const [
    ShopBodyView(),
    FavoriteBodyView(),
    CartBodyView(),
  ];
}
