import 'fav_data.dart';

class FavoriteModel {
  bool? status;
  dynamic message;
  FavData? data;

  FavoriteModel({this.status, this.message, this.data});

  factory FavoriteModel.fromJson(Map<String, dynamic> json) => FavoriteModel(
        status: json['status'] as bool?,
        message: json['message'] as dynamic,
        data: json['data'] == null
            ? null
            : FavData.fromJson(json['data'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'data': data?.toJson(),
      };
}
