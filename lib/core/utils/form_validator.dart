import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class FormValidator {
  static FormFieldValidator<String> notMatch(
    String pattern, {
    String? errorText,
  }) =>
      (valueCandidate) => true == valueCandidate?.isNotEmpty && RegExp(pattern).hasMatch(valueCandidate!)
          ? errorText ?? FormBuilderLocalizations.current.matchErrorText
          : null;
}
