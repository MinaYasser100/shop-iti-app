import 'package:shop_iti_app/login_register/models/request_models.dart';

import '../utils/utils.dart';

abstract class BaseUser with Jsonable{
  final String name;
  final LoginCredintials _credintials;
  final String phoneNum;

  String get email => _credintials.email;
  String? get password => _credintials.password;

  BaseUser({
    required String name,
    required String email,
    String? password,
    required this.phoneNum,
  }) : 
    assert(name.trim().isNotEmpty),
    assert(phoneNum.trim().isNotEmpty && RegExp(r"^\+?[0-9]+$").hasMatch(phoneNum)),
    name = name.trim().replaceAll(RegExp(r"\s+")," "),
    _credintials = LoginCredintials(email: email, password: password,);

  BaseUser.fromJson(JSON json) :
    name = json["name"],
    _credintials =  LoginCredintials.fromJson(json),
    phoneNum = json["phone"];

  @override
  JSON toJson() => {
    "name": name,
    ..._credintials.toJson(),
    "phone": phoneNum,
  };
}

class ActiveUser extends BaseUser{
  final String id;
  final String imageUrl;
  final int? points;
  final int? credit;
  final String token;

  ActiveUser({
    required this.id,
    required super.name,
    required super.email,
    required super.phoneNum,
    required this.imageUrl,
    required this.token,
    this.points,
    this.credit,
  }) : 
    assert(points != null && points >= 0),
    assert(credit != null && credit >= 0),
    assert(token.isNotEmpty),
    super();

  ActiveUser.fromJson(super.json) : 
    id = json["id"],
    imageUrl = json["imageUrl"],
    points = json["points"],
    credit = json["credit"],
    token = json["token"],
    super.fromJson();

  
  @override
  JSON toJson() => {
    ...super.toJson(),
    "id": id,
    "imageUrl": imageUrl,
    "points": points,
    "credit": credit,
    "token": token,
  };
}

