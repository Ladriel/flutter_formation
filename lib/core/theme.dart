import 'package:flutter/material.dart';

class AppTheme {
  static final lightTheme = ThemeData.from(
    colorScheme: ColorScheme.fromSeed(
      background: Colors.white,
      seedColor: Colors.red,
    ),
    useMaterial3: true,
  );

  static final darkTheme = ThemeData.from(
    colorScheme: ColorScheme.fromSeed(
      background: Colors.black,
      seedColor: Colors.blue,
    ),
    useMaterial3: true,
  );
}
