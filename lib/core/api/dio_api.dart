import 'package:dio/dio.dart';
import 'package:shop_iti_app/core/api/dio_end_point.dart';

class DioApi {
  static Dio? _dio;
  static initDio() {
    _dio = Dio(
      BaseOptions(
        baseUrl: DioEndPoint.dioUrl,
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> postData({
    required String endPoint,
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
    String? token,
  }) async {
    _dio!.options.headers = {
      'lang': 'en',
      'Content-Type': 'application/json',
      'Authorization': token ?? '',
    };
    final response = await _dio!.post(
      endPoint,
      data: body,
      queryParameters: queryParameters,
    );
    return response;
  }

  static Future<Response> getData({
    required String endPoint,
    String? token,
    Map<String, dynamic>? queryParameters,
  }) async {
    _dio!.options.headers = {
      'lang': 'en',
      'Content-Type': 'application/json',
      'Authorization': token ?? '',
    };
    final response = await _dio!.get(
      endPoint,
      queryParameters: queryParameters,
    );
    return response;
  }

  static Future<Response> putData({
    required String endPoint,
    String? token,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? body,
  }) async {
    _dio!.options.headers = {
      'lang': 'en',
      'Content-Type': 'application/json',
      'Authorization': token ?? '',
    };
    final response = await _dio!.put(
      endPoint,
      queryParameters: queryParameters,
      data: body,
    );
    return response;
  }
}
