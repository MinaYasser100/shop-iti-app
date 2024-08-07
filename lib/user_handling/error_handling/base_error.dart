abstract class BaseError{
  final String message;
  const BaseError(this.message);

  @override
  String toString() => message;
}