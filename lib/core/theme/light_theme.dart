import 'package:flutter/material.dart';
import 'package:lime_english/core/theme/no_splash_factory.dart';

ThemeData get lightTheme {
  // Color.fromARGB(255, 96, 202, 150);
  // Color(0xff6750a4);
  const Color seedColor = Colors.white;

  return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorSchemeSeed: seedColor,
      scaffoldBackgroundColor: const Color.fromARGB(255, 246, 246, 246),
      // snackBarTheme: SnackBarThemeData(
      //     contentTextStyle:
      //         const TextStyle(color: Color.fromARGB(255, 97, 202, 149)),
      //     backgroundColor: Colors.teal.shade50),
      bottomNavigationBarTheme:
          const BottomNavigationBarThemeData(backgroundColor: Colors.white),
      splashFactory: const NoSplashFactory());
}
