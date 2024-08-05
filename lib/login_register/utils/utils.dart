import 'package:flutter/material.dart';
import 'package:shop_iti_app/login_register/cubit/state/login_register_states.dart';
import 'package:shop_iti_app/login_register/utils/loading_page.dart';

typedef JSON = Map<String, dynamic>;

mixin Jsonable{
  JSON toJson();
}

void userCubitListner(BuildContext context, BaseLogRegState state) {
  if(state.isLoading){
    LoadingScreen().show(context, LoadingScreen().getCode());
  }else{
    LoadingScreen().forcedHide(); // TODO
  }
  
  if(state.msg != null && state.isErrorMsg != null){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          state.msg!,
          style: TextStyle(
            color: state.isErrorMsg == true ? Colors.red : Colors.green,
          ),
        ),
      ),
    );
    state.isErrorMsg = null;
    state.msg = null;
  }
}