import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'cart_states.dart';

class CartCubit extends Cubit<CartStates> {
  CartCubit() : super(CartCubitInitial());

  void getFavoriteData() async {}


}
