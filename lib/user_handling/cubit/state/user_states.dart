import 'package:equatable/equatable.dart';
import 'package:shop_iti_app/user_handling/models/user_models.dart';

abstract class BaseUserState with EquatableMixin{
  bool? isErrorMsg;
  String? msg;
  final bool isLoading;
  final ActiveUser? _user;
  BaseUserState({
    this.msg,
    this.isErrorMsg,
    this.isLoading = false,
    ActiveUser? user,
  }) : _user = user;

  @override
  List<Object?> get props => [
    isErrorMsg,
    msg,
    isLoading,
    _user,
  ];
}
class NotLoggedInState extends BaseUserState{
  NotLoggedInState({
    super.msg,
    super.isErrorMsg,
    super.isLoading = false,
  });
}

class LoggedInState extends BaseUserState{
  ActiveUser get user => _user!;

  LoggedInState({
    super.msg,
    super.isErrorMsg,
    super.isLoading = false,
    required ActiveUser super.user,
  });
}

class InUpdateProfilePageState extends LoggedInState{
  final bool updateMode; 

  InUpdateProfilePageState({
    super.msg,
    super.isErrorMsg,
    super.isLoading = false,
    required super.user,
    required this.updateMode,
  });

  @override
  List<Object?> get props => [
    ...super.props,
    updateMode,
  ];
}