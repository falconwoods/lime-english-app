import 'package:flutter/material.dart';
import 'package:lime_english/core/theme/no_splash_factory.dart';

ThemeData get lightTheme {
  const Color seedColor =
      Color.fromARGB(255, 96, 202, 150); //Color(0xff6750a4);

  return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorSchemeSeed: seedColor,
      snackBarTheme: SnackBarThemeData(
          contentTextStyle: TextStyle(color: Colors.teal.shade900),
          backgroundColor: Colors.teal.shade50),
      splashFactory: const NoSplashFactory());
}
