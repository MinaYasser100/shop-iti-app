class ApiError{
  final String message;
  const ApiError(this.message);

  @override
  String toString() => message;

  static const callFailure = ApiError("Failed to issue request to the api!");
  static const responseFailure = ApiError("NOT OK Response!");
  static const malformedDataType = ApiError("Response came in wrong form!");
}