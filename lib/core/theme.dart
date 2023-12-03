import 'package:flutter/material.dart';

class AppTheme with ChangeNotifier {
  ThemeData _theme;

  ThemeData get theme => _theme;

  set theme(ThemeData value) {
    _theme = value;
    notifyListeners();
  }

  static final lightTheme = ThemeData.from(
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.red,
    ),
    useMaterial3: true,
  );

  AppTheme(this._theme);
}
