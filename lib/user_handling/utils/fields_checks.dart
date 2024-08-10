
abstract class FieldCheck{
  const FieldCheck._();
  static String? email(String value) =>
      RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$").hasMatch(value)
          ? null
          : "Enter a valid email";

  static String? password(String value) =>
      value.length > 5 ? null : "Password must be at least 6 character";

  static String? name(String value) =>
      value.trim().isNotEmpty ? null : "Enter a valid name";

  static String? phoneNum(String value) =>
      RegExp(r"^\+?[0-9]+$").hasMatch(value) ? null : "Enter a valid phone number";

}