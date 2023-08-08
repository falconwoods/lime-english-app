import 'package:flutter/material.dart';

ThemeData get lightTheme {
  const Color mainColor = Colors.teal;
  return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorSchemeSeed: mainColor,
      snackBarTheme: SnackBarThemeData(
          contentTextStyle: TextStyle(color: Colors.teal.shade900),
          backgroundColor: Colors.teal.shade50));
}
