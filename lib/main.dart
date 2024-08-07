import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:shop_iti_app/core/api/dio_api.dart';
import 'package:shop_iti_app/core/constant/constant.dart';
import 'package:shop_iti_app/core/helper/hive_helper.dart';
import 'package:shop_iti_app/core/pages/get_pages.dart';
import 'package:shop_iti_app/features/layout/presentation/manager/layout_cubit/layout_screen_cubit.dart';
import 'package:shop_iti_app/user_handling/api/response_model.dart';
import 'package:shop_iti_app/user_handling/api/user_api.dart';
import 'package:shop_iti_app/user_handling/cubit/state/user_states.dart';
import 'package:shop_iti_app/user_handling/cubit/user_cubit.dart';
import 'package:shop_iti_app/user_handling/models/user_models.dart';

import 'features/layout/presentation/views/widgets/shop/presentation/manager/shop_screen_cubit/shop_screen_cubit.dart';

late final bool _showOnboarding;
late final String _initialRoute;
late final BaseUserState _initialUserState;
// TODO : login done success apears as error msg.
// TODO : image do NOT load or upload.
// TODO : check error handling.
// TODO : make appbar transparent.
void main() async {
  DioApi.initDio();

  await HiveHelper.init();
  // await HiveHelper.resetOnboarding(); // uncomment to force show onboarding screen
  _showOnboarding = await HiveHelper.canShowOnboarding();
  // await HiveHelper.updateToken(""); // uncomment to delete the saved token
  ConstantComponents.token = HiveHelper.getToken() ?? "";
  _initialUserState = await _checkTokenLogic();
  _initialRoute = _getInitialRoute();

  runApp(const MyApp());
}

Future<BaseUserState> _checkTokenLogic() async {
  if(ConstantComponents.token != ""){
    late final ApiResponse<ActiveUser> profileResult;
    try {
      profileResult = await UserApi.getProfile(ConstantComponents.token);
    } catch (e) {
      await HiveHelper.updateToken("");
      ConstantComponents.token = "";
      return NotLoggedInState();
    }

    if(profileResult.status && profileResult.data != null){
      return LoggedInState(
        user: profileResult.data!,
      );
    }else{
      await HiveHelper.updateToken("");
      ConstantComponents.token = "";
      return NotLoggedInState();
    }
  }
  
  return NotLoggedInState();
}

String _getInitialRoute() {
  if (_showOnboarding) {
    return GetPages.kOnboardingView;
  } else if (ConstantComponents.token == "") {
    return GetPages.kLoginView;
  } else {
    return GetPages.kLayoutView;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LayoutScreenCubit(),
        ),
        BlocProvider(
          create: (context) => ShopScreenCubit()..getShopData(),
        ),
        BlocProvider(
          create: (context) => UserCubit(_initialUserState),
        ),
      ],
      child: GetMaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: ConstantComponents.secondColor,
          colorScheme:
              ColorScheme.fromSeed(seedColor: ConstantComponents.firstColor),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: GetPages.kSettingsView,
        getPages: GetPages.getPages,
      ),
    );
  }
}
