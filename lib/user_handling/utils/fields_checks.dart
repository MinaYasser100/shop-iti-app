abstract class FieldCheck{
  const FieldCheck._();
  static bool email(String value) => 
    RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$").hasMatch(value);

  static bool password(String value) => 
    value.isNotEmpty;
  
  static bool name(String value) => 
    value.trim().isNotEmpty;

  static bool phoneNum(String value) => 
    value.trim().isNotEmpty && RegExp(r"^\+?[0-9]+$").hasMatch(value);
}