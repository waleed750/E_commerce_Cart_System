// ignore_for_file: library_private_types_in_public_api

import '../../core_export.dart';

class ValidateMessages {
  static _ErrorMessage erorr = _ErrorMessage();
  static _SuccessMessage success = _SuccessMessage();
}

class _ErrorMessage {
  final emptyField = "This field cannot be empty";
  final theCodeLengthShouldBeBetween =
      "The code length should be between 6 and 12 characters";
  final invalidDateFormatPleaseUse =
      "Invalid date format. Please use DD/MM/YYYY";
  final enterTheDateInTheFormat = "Enter the date in the format DD/MM/YYYY";
  final invalidDateValues = "Invalid date values";
  final genericError = "An error occurred. Please try again later.";
}

class _SuccessMessage {
  // final userLogin = AppStrings.tr.loginSuccess;
}
