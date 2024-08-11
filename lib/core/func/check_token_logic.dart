
import 'package:shop_iti_app/core/constant/constant.dart';
import 'package:shop_iti_app/core/helper/hive_helper.dart';
import 'package:shop_iti_app/user_handling/api/response_model.dart';
import 'package:shop_iti_app/user_handling/api/user_api.dart';
import 'package:shop_iti_app/user_handling/cubit/state/user_states.dart';
import 'package:shop_iti_app/user_handling/models/user_models.dart';

Future<BaseUserState> checkTokenLogic() async {
  if (ConstantComponents.token != "") {
    late final ApiResponse<ActiveUser> profileResult;

    try {
      profileResult = await UserApi.getProfile(ConstantComponents.token);
    }
    catch (e) {
      await HiveHelper.updateToken("");
      ConstantComponents.token = "";
      return NotLoggedInState();
     }

    if (profileResult.status && profileResult.data != null) {
      return LoggedInState(
        user: profileResult.data!,
      );
    } else {
      await HiveHelper.updateToken("");
      ConstantComponents.token = "";
      return NotLoggedInState();
    }
  }
  return NotLoggedInState();
}
