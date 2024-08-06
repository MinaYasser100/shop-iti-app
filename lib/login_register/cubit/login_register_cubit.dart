import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:shop_iti_app/core/constant/constant.dart';
import 'package:shop_iti_app/core/helper/hive_helper.dart';
import 'package:shop_iti_app/core/pages/get_pages.dart';
import 'package:shop_iti_app/login_register/api/login_api.dart';
import 'package:shop_iti_app/login_register/api/response_model.dart';
import 'package:shop_iti_app/login_register/cubit/state/login_register_states.dart';
import 'package:shop_iti_app/login_register/models/request_models.dart';
import 'package:shop_iti_app/login_register/models/user_models.dart';
import 'package:shop_iti_app/login_register/utils/loading_page.dart';

class UserCubit extends Cubit<BaseLogRegState> {
  UserCubit() : super(LoginPageState());

  void register({
    required String name,
    required String email,
    required String phoneNum,
    required String password,
    required String? imagePath,
  }) async {
    emit(RegisterPageState(
      isLoading: true,
    ));

    late final List<int>? imageBytes;
    try {
      imageBytes =
          imagePath == null ? null : await File(imagePath).readAsBytes();
    } catch (e) {
      imageBytes = null;
    }

    late final RegisterUserRequest req;
    try {
      req = RegisterUserRequest(
        name: name,
        email: email,
        password: password,
        phoneNum: phoneNum,
        imageBytes: imageBytes,
      );
    } catch (e) {
      emit(RegisterPageState(
        isErrorMsg: true,
        isLoading: false,
        msg: e.toString(),
      ));
      return;
    }

    late final ApiResponse<ActiveUser> regResult;
    try {
      regResult = await LoginApi.register(req);
    } catch (e) {
      emit(RegisterPageState(
        isErrorMsg: true,
        isLoading: false,
        msg: e.toString(),
      ));
      return;
    }

    if (regResult.status) {
      Get.offAndToNamed(GetPages.kLoginView);
      emit(LoginPageState(
        isErrorMsg: regResult.message == null ? null : false,
        isLoading: false,
        msg: regResult.message,
      ));
      return;
    } else {
      emit(RegisterPageState(
        isErrorMsg: regResult.message == null ? null : true,
        isLoading: false,
        msg: regResult.message,
      ));
      return;
    }
  }

  void login({
    required String email,
    required String password,
    required bool rememberMe,
  }) async {
    emit(LoginPageState(
      isLoading: true,
    ));

    late final LoginCredintials credintials;
    try {
      credintials = LoginCredintials(
        email: email,
        password: password,
      );
    } catch (e) {
      emit(LoginPageState(
        isErrorMsg: true,
        isLoading: false,
        msg: e.toString(),
      ));
      return;
    }

    late final ApiResponse<ActiveUser> loginResult;
    try {
      loginResult = await LoginApi.login(credintials);
    } catch (e) {
      emit(LoginPageState(
        isErrorMsg: true,
        isLoading: false,
        msg: e.toString(),
      ));
      return;
    }

    if (loginResult.status) {
      if(rememberMe && loginResult.data != null){
        final token = loginResult.data!.token;
        HiveHelper.updateToken(token);
        ConstantComponents.token = token;
      }
      LoadingScreen().forcedHide();

      Get.offAllNamed(GetPages.kLayoutView);
    } else {
      emit(LoginPageState(
        isErrorMsg: loginResult.message == null ? null : true,
        isLoading: false,
        msg: loginResult.message,
      ));
      return;
    }
  }

  void toRegisterPage() => Get.toNamed(GetPages.kRegisterView);
}
