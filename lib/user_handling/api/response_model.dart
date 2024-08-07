import '../utils/utils.dart';

class ApiResponse<T extends Object>{
  final bool status;
  final String? message;
  final T? data;

  ApiResponse.fromJson(JSON json, [T Function(JSON json)? dataCallback]) :
    status = json["status"],
    message = json["message"],
    data = json["data"] == null 
      ? null 
      : (dataCallback?.call(json["data"]) ?? json["data"]);
}