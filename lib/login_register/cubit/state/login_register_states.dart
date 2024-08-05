abstract class BaseLogRegState{
  bool? isErrorMsg;
  String? msg;
  final bool isLoading;
  BaseLogRegState({
    this.msg,
    this.isErrorMsg,
    this.isLoading = false,
  });
}

class RegisterPageState extends BaseLogRegState{
  RegisterPageState({
    super.msg,
    super.isErrorMsg,
    super.isLoading = false,
  });
}

class LoginPageState extends BaseLogRegState{
  LoginPageState({
    super.msg,
    super.isErrorMsg,
    super.isLoading = false,
  });
}