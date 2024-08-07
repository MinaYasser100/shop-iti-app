import 'package:shop_iti_app/user_handling/error_handling/base_error.dart';

class UserError extends BaseError{
  const UserError() : super("Malformed user data!");
}