import 'package:dio/dio.dart';
import 'package:shop_iti_app/user_handling/error_handling/api_errors.dart';
import 'package:shop_iti_app/user_handling/error_handling/model_errors.dart';
import 'package:shop_iti_app/user_handling/models/user_models.dart';
import '../../core/api/dio_api.dart';
import '../../core/api/dio_end_point.dart';
import '../models/request_models.dart';
import '../utils/utils.dart';
import 'response_model.dart';

abstract class UserApi{
  const UserApi._();

  static ApiResponse<T> _getApiRes<T extends Object>(
    Response dioRes, 
    [T Function(JSON json)? dataCallback]
  ){
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

  static Future<ApiResponse<ActiveUser>> getProfile(String token) async {
    final dioRes = await DioApi.getData(
      token: token,
      endPoint: DioEndPoint.dioProfile,
    );

    try{
      return _getApiRes(dioRes, ActiveUser.fromJson);
    }catch(e){
      throw const UserError();
    } 
  }

  static Future<ApiResponse<ActiveUser>> updateProfile(ActiveUser user, UserProfileDataRequest profileData) async {
    final dioRes = await DioApi.putData(
      token: user.token,
      endPoint: DioEndPoint.dioUpdateProfile,
      body: profileData.toJson(),
    );

    try{
      return _getApiRes(dioRes, ActiveUser.fromJson);
    }catch(e){
      throw const UserError();
    } 
  }

  static Future<ApiResponse<ActiveUser>> register(UserProfileDataRequest registerReq) => _registerOrLogin(
    DioEndPoint.dioRegister,
    registerReq,
  );

  static Future<ApiResponse<ActiveUser>> login(LoginCredintials loginCredintials) => _registerOrLogin(
    DioEndPoint.dioLogin,
    loginCredintials,
  );
  
  static Future<ApiResponse> logout(ActiveUser user) async {
    final dioRes = await DioApi.postData(
      endPoint: DioEndPoint.dioLogout,
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
      endPoint: DioEndPoint.dioChangePass,
      body: changePasswordReq.toJson(),
      token: user.token,
    );
    
    return _getApiRes(dioRes);
  }
}