import 'package:dio/dio.dart';
import 'package:shop_iti_app/core/api/dio_end_point.dart';

class DioApi {
  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: DioEndPoint.dioUrl,
      headers: {
        'lang': 'en',
        'Content-Type': 'application/json',
      },
    ),
  );

  static Future<Response> postData(
      {required String endPoint,
      Map<String, dynamic>? body,
      Map<String, dynamic>? queryParameters}) async {
    final response = await _dio.post(
      endPoint,
      data: body,
      queryParameters: queryParameters,
    );
    return response;
  }
}
