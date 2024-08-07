import 'package:flutter/material.dart';
import 'package:shop_iti_app/core/func/custom_snack_bar.dart';
import 'package:shop_iti_app/user_handling/cubit/state/user_states.dart';
import 'package:shop_iti_app/user_handling/utils/loading_page.dart';

typedef JSON = Map<String, dynamic>;

mixin Jsonable {
  JSON toJson();
}

void userCubitListner(BuildContext context, BaseUserState state) {
  if (state.isLoading) {
    LoadingScreen().show(context, LoadingScreen().getCode());
  } else {
    LoadingScreen().forcedHide();
  }

  if (state.msg != null && state.isErrorMsg != null) {
    customSnackBar(
      text: state.isErrorMsg == false ? "Succeded" : "Error",
      subTitle: state.msg!,
      color: state.isErrorMsg == true ? Colors.redAccent.shade700 : Colors.greenAccent.shade700,
    );

    state.isErrorMsg = null;
    state.msg = null;
  }
}
