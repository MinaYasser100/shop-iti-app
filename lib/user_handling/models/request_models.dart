import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:shop_iti_app/user_handling/utils/fields_checks.dart';
import '../utils/utils.dart';
import 'user_models.dart';

class LoginCredintials with Jsonable, EquatableMixin{
  final String email;
  final String? password;
  LoginCredintials({
    required this.email,
    this.password,
  }) :
        assert(password == null ? true : (FieldCheck.password(password) == null)),
        assert(FieldCheck.email(email) == null);

  factory LoginCredintials.create({
    required String email,
    required String password,
  }) => LoginCredintials(
    email: email,
    password: password,
  );


  LoginCredintials.fromJson(JSON json) :
        email = json["email"],
        password = json["password"];

  @override
  JSON toJson() => {
    "email": email,
    if(password != null) "password": password,
  };

  @override
  List<Object?> get props => [
    email,
    password,
  ];
}
class UserProfileDataRequest extends BaseUser{
  final List<int>? imageBytes;

  UserProfileDataRequest({
    required super.name,
    required super.email,
    required super.phoneNum,
    required String super.password,
    this.imageBytes,
  });

  UserProfileDataRequest.update({
    required super.name,
    required super.email,
    required super.phoneNum,
    this.imageBytes,
  });

  @override
  JSON toJson() {
    final base64Image = imageBytes == null ? null : base64Encode(imageBytes!);
    return {
      ...super.toJson(),
      "image": base64Image,
    };
  }
}

class ChangePasswordRequest with Jsonable{
  final String currentPassword;
  final String newPassword;
  ChangePasswordRequest({
    required this.currentPassword,
    required this.newPassword,
  }) :
        assert(FieldCheck.password(currentPassword) == null && FieldCheck.password(newPassword) == null);

  @override
  JSON toJson() => {
    "current_password": currentPassword,
    "new_password": newPassword,
  };
}