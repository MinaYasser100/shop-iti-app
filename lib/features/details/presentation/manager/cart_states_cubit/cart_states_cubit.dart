import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_iti_app/core/func/check_internet_connection.dart';
import 'package:shop_iti_app/core/func/custom_snack_bar.dart';

part 'cart_states_states.dart';

class CartStatesCubit extends Cubit<CartStatesStates> {
  CartStatesCubit() : super(CartStatesInitial());

  void addOrDeleteFormCart() async {
    bool isConnection = await checkInternetConnection();
    if (isConnection) {
    } else {
      customSnackBar(
        text: 'No Internet Connection',
        subTitle: 'Please connect to the internet and try again',
        color: Colors.red,
      );
    }
  }
}
