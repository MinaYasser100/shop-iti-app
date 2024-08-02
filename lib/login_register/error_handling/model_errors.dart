import 'package:shop_iti_app/login_register/error_handling/base_error.dart';

class UserError extends BaseError{
  const UserError() : super("Malformed user data!");
}