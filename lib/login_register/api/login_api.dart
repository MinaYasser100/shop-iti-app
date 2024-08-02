import 'package:dio/dio.dart';
import 'package:shop_iti_app/login_register/error_handling/api_errors.dart';
import 'package:shop_iti_app/login_register/error_handling/model_errors.dart';
import 'package:shop_iti_app/login_register/models/user_models.dart';
import '../../core/api/dio_api.dart';
import '../../core/api/dio_end_point.dart';
import '../models/request_models.dart';
import '../utils/utils.dart';
import 'response_model.dart';

class LoginApi{
  const LoginApi._();

  static ApiResponse<T> _getApiRes<T extends Object>(
    Response dioRes, 
    [T Function(JSON json)? dataCallback]
  ) {
    if(dioRes.statusCode != 200){
      throw const ApiResponseFailure();
    }

    try{
      return ApiResponse<T>.fromJson(dioRes.data, dataCallback);
    }catch(e){
      throw const ApiMalformedDataType();
    }
  }

  static Future<ApiResponse<ActiveUser>> _registerOrLogin(String reqEndpoint, Jsonable reqBody) async {
    final dioRes = await DioApi.postData(
      endPoint: reqEndpoint,
      body: reqBody.toJson(),
    );

    try{
      return _getApiRes(dioRes, ActiveUser.fromJson);
    }catch(e){
      throw const UserError();
    } 
  }

  static Future<ApiResponse<ActiveUser>> register(RegisterUserRequest registerReq) => _registerOrLogin(
    "${DioEndPoint.dioHome}register",
    registerReq,
  );

  static Future<ApiResponse<ActiveUser>> login(LoginCredintials loginCredintials) => _registerOrLogin(
    "${DioEndPoint.dioHome}login",
    loginCredintials,
  );
  
  static Future<ApiResponse> logout(ActiveUser user) async {
    final dioRes = await DioApi.postData(
      endPoint: "${DioEndPoint.dioHome}login",
      body: {},
      token: user.token,
    );

    return _getApiRes(dioRes);
  }

  static Future<ApiResponse> changePassword(
    ActiveUser user, 
    ChangePasswordRequest changePasswordReq
  ) async {
    final dioRes = await DioApi.postData(
      endPoint: "${DioEndPoint.dioHome}change-password",
      body: changePasswordReq.toJson(),
      token: user.token,
    );
    
    return _getApiRes(dioRes);
  }
}