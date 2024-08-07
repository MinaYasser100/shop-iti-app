import 'package:equatable/equatable.dart';
import 'package:shop_iti_app/user_handling/models/request_models.dart';
import 'package:shop_iti_app/user_handling/utils/fields_checks.dart';

import '../utils/utils.dart';

abstract class BaseUser with Jsonable, EquatableMixin{
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
    assert(FieldCheck.name(name)),
    assert(FieldCheck.phoneNum(phoneNum)),
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

  @override
  List<Object?> get props => [
    name,
    phoneNum,
    _credintials,
  ];
}

class ActiveUser extends BaseUser{
  final int id;
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
    assert((points ?? 0) >= 0),
    assert((credit ?? 0) >= 0),
    assert(token.isNotEmpty),
    super();

  ActiveUser.fromJson(super.json) : 
    id = json["id"],
    imageUrl = json["image"],
    points = json["points"],
    credit = json["credit"],
    token = json["token"],
    super.fromJson();

  
  @override
  JSON toJson() => {
    ...super.toJson(),
    "id": id,
    "image": imageUrl,
    "points": points,
    "credit": credit,
    "token": token,
  };

  @override
  List<Object?> get props => [
    ...super.props,
    id,
    imageUrl,
    points,
    credit,
    token,
  ];
}

