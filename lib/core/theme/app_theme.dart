import 'package:flutter/material.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.greenAccent,
      brightness: Brightness.light,
    ),
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.greenAccent,
      foregroundColor: Colors.black,
    ),
  );

  static final darkTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.tealAccent,
      brightness: Brightness.dark,
    ),
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
    ),
  );
}
