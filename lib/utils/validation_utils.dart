import 'package:get/get.dart';

/// REGULAR EXPRESSION
class RegularExpression {
  /// TextField Enter Pattern Expression
  static String passwordPattern = r"[a-zA-Z0-9#!_@$%^&*-]";
  static String alphabetSpacePattern = r"[a-zA-Z ]";
  static String alphabetDigitsPattern = r"[a-zA-Z0-9 ]";

  /// Validation Expression Pattern
  static String emailValidationPattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  static String nameKeyboardPattern = "[A-z]";
  static String allKeyboardPattern = "[a-zA-Z0-9#!_@\$%^&*-.()&'\"?!;:<> ]";
  static String searchKeyboardPattern = "[A-z-/]";
  static String contactKeyboardPattern = "[0-9]";
  static String fullNameKeyboardPattern = "[A-z ]";
  static String emailKeyboardPattern = "[0-9A-z@.]";

  static String noSpaceAllowPattern = "[ ]";
  static String onlyFirstSpaceNoAllowPattern = "^[ ]";
}

class ValidationMsg {
  static String isRequired = "fieldIsRequired";
  static String enterValidName = 'enterValidName';
  static String mobileNumberMoreThen = 'mobileNumberMoreThen';
  static String passwordMoreThen = 'passwordMoreThen';
  static String enterValidCity = 'enterValidCity';
  static String enterValidState = 'enterValidState';
  static String enterValidPincode = 'enterValidPincode';
  static String enterValidAddress = 'enterValidAddress';
  static String enterValidEmail = 'enterValidEmail';
}

String? emptyValidation(value) {
  if (value.toString().isEmpty || value.toString().toLowerCase() == 'null') {
    return ValidationMsg.isRequired.tr;
  }
  return null;
}

String? userValidation(value) {
  final data = emptyValidation(value);
  if (data == null) {
    if (!RegExp(RegularExpression.alphabetSpacePattern).hasMatch(value!)) {
      return ValidationMsg.enterValidName;
    }
  }
  return data;
}

String? mobileValidation(value) {
  final data = emptyValidation(value);

  if (data == null) {
    if (value.toString().length < 10) {
      return ValidationMsg.mobileNumberMoreThen.tr;
    }
  }
  return data;
}

String? emailValidation(value) {
  final data = emptyValidation(value);
  if (data == null) {
    if (!RegExp(RegularExpression.emailValidationPattern).hasMatch(value)) {
      return ValidationMsg.enterValidEmail.tr;
    }
  }
  return data;
}

String? passwordValidation(value) {
  final data = emptyValidation(value);
  if (data == null) {
    if (value.toString().length < 6) {
      return ValidationMsg.passwordMoreThen.tr;
    }
  }
  return data;
}

String? confirmPasswordValidation(value, password) {
  final data = emptyValidation(value);
  if (data == null) {
    if (value.toString().length < 6) {
      return ValidationMsg.passwordMoreThen.tr;
    } else if (password != value) {
      return 'password not match';
    }
  }
  return data;
}

String? validateAddress(value) {
  final data = emptyValidation(value);
  if (data == null) {
    if (!RegExp(RegularExpression.allKeyboardPattern).hasMatch(value)) {
      return ValidationMsg.enterValidAddress.tr;
    }
  }
  return data;
}

String? validateCity(value) {
  final data = emptyValidation(value);
  if (data == null) {
    if (!RegExp(RegularExpression.alphabetSpacePattern).hasMatch(value)) {
      return ValidationMsg.enterValidCity.tr;
    }
  }
  return data;
}

String? validateState(value) {
  final data = emptyValidation(value);
  if (data == null) {
    if (!RegExp(RegularExpression.alphabetSpacePattern).hasMatch(value)) {
      return ValidationMsg.enterValidState.tr;
    }
  }
  return data;
}

String? validatePinCode(value) {
  final data = emptyValidation(value);
  if (data == null) {
    if (!RegExp(RegularExpression.contactKeyboardPattern).hasMatch(value)) {
      return ValidationMsg.enterValidPincode.tr;
    }
  }
  return data;
}
