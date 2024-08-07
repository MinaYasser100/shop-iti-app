import 'package:shop_iti_app/user_handling/error_handling/base_error.dart';

class ApiCallFailure extends BaseError{
  const ApiCallFailure() : super("Failed to issue request to the api!");
}

class ApiResponseFailure extends BaseError{
  const ApiResponseFailure() : super("Response 404!");
}

class ApiMalformedDataType extends BaseError{
  const ApiMalformedDataType() : super("Response came in wrong form!");
}