import 'package:get/get.dart';

class FormValidator {
  static String? email(String? value) {
    if (!GetUtils.isEmail(value ?? '')) {
      return 'please input valid email'.tr;
    }
    return null;
  }

  static String? password(String? value) {
    if (RegExp(r'\s').hasMatch(value ?? '')) {
      return 'password cannot contain white space'.tr;
    }
    if (GetUtils.isLengthLessThan(value, 6)) {
      return 'password length must > 6'.tr;
    }

    return null;
  }
}
