import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'shop_screen_state.dart';

class ShopScreenCubit extends Cubit<ShopScreenState> {
  ShopScreenCubit() : super(ShopScreenInitial());
}
