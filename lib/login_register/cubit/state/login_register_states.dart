abstract class BaseLogRegState{
  final bool? isErrorMsg;
  final String? msg;
  final bool isLoading;
  const BaseLogRegState({
    this.msg,
    this.isErrorMsg,
    this.isLoading = false,
  });
}

class RegisterPageState extends BaseLogRegState{
  const RegisterPageState({
    super.msg,
    super.isErrorMsg,
    super.isLoading = false,
  });
}

class LoginPageState extends BaseLogRegState{
  const LoginPageState({
    super.msg,
    super.isErrorMsg,
    super.isLoading = false,
  });
}