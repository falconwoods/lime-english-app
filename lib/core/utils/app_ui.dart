import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppUI {
  static ThemeData? _theme;

  static void setThemeData(ThemeData _) => _theme = _;

  static SnackbarController snackbar(String title, String message) {
    return Get.snackbar(title, message,
        backgroundColor: _theme?.snackBarTheme.backgroundColor,
        colorText: _theme?.snackBarTheme.contentTextStyle?.color);
  }

  static SnackbarController snackbarWarn(String title, String message) {
    return Get.snackbar(title, message,
        backgroundColor: _theme?.snackBarTheme.backgroundColor,
        colorText: _theme?.colorScheme.onError);
  }

  static SnackbarController snackbarError(String title, String message) {
    return Get.snackbar(title, message,
        backgroundColor: _theme?.snackBarTheme.backgroundColor,
        colorText: _theme?.colorScheme.error);
  }
}
