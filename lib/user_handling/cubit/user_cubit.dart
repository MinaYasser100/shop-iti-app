
import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:shop_iti_app/core/constant/constant.dart';
import 'package:shop_iti_app/core/helper/hive_helper.dart';
import 'package:shop_iti_app/core/pages/get_pages.dart';
import 'package:shop_iti_app/user_handling/api/user_api.dart';
import 'package:shop_iti_app/user_handling/api/response_model.dart';
import 'package:shop_iti_app/user_handling/cubit/state/user_states.dart';
import 'package:shop_iti_app/user_handling/models/request_models.dart';
import 'package:shop_iti_app/user_handling/models/user_models.dart';
import 'package:shop_iti_app/user_handling/utils/loading_page.dart';

class UserCubit extends Cubit<BaseUserState> {
  UserCubit(super.initialState);

  void register({
    required String name,
    required String email,
    required String phoneNum,
    required String password,
    required String? imagePath,
  }) async {
    emit(NotLoggedInState(
      isLoading: true,
    ));
    late final List<int>? imageBytes;
    try {
      imageBytes =
      imagePath == null ? null : await File(imagePath).readAsBytes();
    } catch (e) {
      imageBytes = null;
    }
    late final UserProfileDataRequest req;
    try {
      req = UserProfileDataRequest(
        name: name,
        email: email,
        password: password,
        phoneNum: phoneNum,
        imageBytes: imageBytes,
      );
    } catch (e) {
      emit(NotLoggedInState(
        isErrorMsg: true,
        isLoading: false,
        msg: e.toString(),
      ));
      return;
    }
    late final ApiResponse<ActiveUser> regResult;
    try {
      regResult = await UserApi.register(req);
    } catch (e) {
      emit(NotLoggedInState(
        isErrorMsg: true,
        isLoading: false,
        msg: e.toString(),
      ));
      return;
    }
    if (regResult.status) {
      Get.offAndToNamed(GetPages.kLoginView);
      emit(NotLoggedInState(
        isErrorMsg: regResult.message == null ? null : false,
        isLoading: false,
        msg: regResult.message,
      ));
      return;
    } else {
      emit(NotLoggedInState(
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
    emit(NotLoggedInState(
      isLoading: true,
    ));
    late final LoginCredintials credintials;
    try {
      credintials = LoginCredintials(
        email: email,
        password: password,
      );
    }
    catch (e) {
      emit(NotLoggedInState(
        isErrorMsg: true,
        isLoading: false,
        msg: e.toString(),
      ));
      return;
    }
    late final ApiResponse<ActiveUser> loginResult;
    try {
      loginResult = await UserApi.login(credintials);
    } catch (e) {
      emit(NotLoggedInState(
        isErrorMsg: true,
        isLoading: false,
        msg: e.toString(),
      ));
      return;
    }
    if (loginResult.status && loginResult.data != null) {
      final token = loginResult.data!.token;
      ConstantComponents.token = token;
      if (rememberMe) {
        await HiveHelper.updateToken(token);
      }
      LoadingScreen().forcedHide();
      emit(LoggedInState(
        isErrorMsg: loginResult.message == null ? null : false,
        isLoading: false,
        msg: loginResult.message,
        user: loginResult.data!,
      ));
      Get.offAllNamed(GetPages.kLayoutView);
    } else {
      emit(NotLoggedInState(
        isErrorMsg: loginResult.message == null ? null : true,
        isLoading: false,
        msg: loginResult.message,
      ));
      return;
    }
  }
  void updateProfile({
    required String name,
    required String email,
    required String phoneNum,
    required String? imagePath,
  }) async {
    if (state is! InUpdateProfilePageState) {
      return;
    }
    final user = (state as InUpdateProfilePageState).user;
    emit(InUpdateProfilePageState(
      isLoading: true,
      user: user,
      updateMode: true,
    ));
    late final List<int>? imageBytes;
    try {
      imageBytes =
      imagePath == null ? null : await File(imagePath).readAsBytes();
    } catch (e) {
      imageBytes = null;
    }
    late final UserProfileDataRequest req;
    try {
      req = UserProfileDataRequest.update(
        name: name,
        email: email,
        phoneNum: phoneNum,
        imageBytes: imageBytes,
      );
    } catch (e) {
      emit(InUpdateProfilePageState(
        isErrorMsg: true,
        isLoading: false,
        msg: e.toString(),
        user: user,
        updateMode: true,
      ));
      return;
    }
    late final ApiResponse<ActiveUser> updateResult;
    try {
      updateResult = await UserApi.updateProfile(user, req);
    } catch (e) {
      emit(InUpdateProfilePageState(
        isErrorMsg: true,
        isLoading: false,
        msg: e.toString(),
        user: user,
        updateMode: true,
      ));
      return;
    }
    if (updateResult.status && updateResult.data != null) {
      emit(InUpdateProfilePageState(
        isErrorMsg: updateResult.message == null ? null : false,
        isLoading: false,
        msg: updateResult.message,
        user: updateResult.data!,
        updateMode: false,
      ));
      return;
    }
    else {
      emit(InUpdateProfilePageState(
        isErrorMsg: updateResult.message == null ? null : true,
        isLoading: false,
        msg: updateResult.message,
        user: user,
        updateMode: true,
      ));
      return;
    }
  }
  void changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    if (state is! LoggedInState) {
      return;
    }
    final user = (state as LoggedInState).user;
    emit(LoggedInState(
      isLoading: true,
      user: user,
    ));
    late final ChangePasswordRequest req;
    try {
      req = ChangePasswordRequest(
        currentPassword: currentPassword,
        newPassword: newPassword,
      );
    }
    catch (e) {
      emit(LoggedInState(
        isErrorMsg: true,
        isLoading: false,
        msg: e.toString(),
        user: user,
      ));
      return;
    }

    late final ApiResponse changePassResult;
    try {
      changePassResult = await UserApi.changePassword(user, req);
    }
    catch (e) {
      emit(LoggedInState(
        isErrorMsg: true,
        isLoading: false,
        msg: e.toString(),
        user: user,
      ));
      return;
    }
    if (changePassResult.status && changePassResult.data != null) {
      emit(LoggedInState(
        isErrorMsg: changePassResult.message == null ? null : false,
        isLoading: false,
        msg: changePassResult.message,
        user: user,
      ));
      return;
    } else {
      emit(LoggedInState(
        isErrorMsg: changePassResult.message == null ? null : true,
        isLoading: false,
        msg: changePassResult.message,
        user: user,
      ));
      return;
    }
  }
  void logout() async {
    if (state is! LoggedInState) {
      return;
    }
    final user = (state as LoggedInState).user;
    if (state is LoggedInState) {
      emit(LoggedInState(
        isLoading: true,
        user: user,
      ));

      try {
        UserApi.logout(user);
      }
      catch (e) {
        emit(LoggedInState(
          isErrorMsg: true,
          isLoading: false,
          msg: e.toString(),
          user: user,
        ));
        return;
      }
      await HiveHelper.updateToken("");
      ConstantComponents.token = "";
      emit(NotLoggedInState());
      Get.toNamed(GetPages.kLoginView);
    }
  }
  void toRegisterPage() => Get.toNamed(GetPages.kRegisterView);
  void toUpdateProfilePage() {
    if (state is LoggedInState) {
      emit(InUpdateProfilePageState(
          user: (state as LoggedInState).user, updateMode: false));
      Get.toNamed(GetPages.kProfileDataView);
    }
  }
  void backToSettingsPage() {
    if (state is InUpdateProfilePageState) {
      emit(LoggedInState(user: (state as LoggedInState).user));
    }
  }
  void changeUpdateProfileMode(bool mode) {
    if (state is InUpdateProfilePageState) {
      emit(InUpdateProfilePageState(
        user: (state as InUpdateProfilePageState).user,
        updateMode: mode,
      ));
    }
  }
}
