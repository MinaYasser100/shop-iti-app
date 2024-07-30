import 'data.dart';

class ProudectModel {
  bool? status;
  dynamic message;
  Data? data;

  ProudectModel({this.status, this.message, this.data});

  factory ProudectModel.fromJson(Map<String, dynamic> json) => ProudectModel(
        status: json['status'] as bool?,
        message: json['message'] as dynamic,
        data: json['data'] == null
            ? null
            : Data.fromJson(json['data'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'data': data?.toJson(),
      };
}
