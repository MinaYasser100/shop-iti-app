import 'dart:convert';

import 'package:shop_iti_app/login_register/utils/fields_checks.dart';

import '../utils/utils.dart';
import 'user_models.dart';

class LoginCredintials with Jsonable{
  final String email;
  final String? password;
  LoginCredintials({
    required this.email,
    this.password,
  }) : 
    assert(password == null ? true : FieldCheck.password(password)),
    assert(FieldCheck.email(email));

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
    "password": password,
  };
}

class RegisterUserRequest extends BaseUser{
  final List<int>? imageBytes;

  RegisterUserRequest({
    required super.name,
    required super.email,
    required super.phoneNum,
    required String super.password,
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
    assert(FieldCheck.password(currentPassword) && FieldCheck.password(newPassword));

  @override
  JSON toJson() => {
    "current_password": currentPassword,
    "new_password": newPassword,
  };
}