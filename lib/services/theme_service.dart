import 'package:flutter/material.dart';
import 'package:flutter_example/services/shared_preferences_service.dart';

enum AppTheme {
  DarkTheme,
  LightTheme,
}

class ThemeService with ChangeNotifier{
  static final defaultTheme = AppTheme.DarkTheme;
  static final darkTheme = ThemeData(
    fontFamily: 'Ubuntu',
    brightness: Brightness.dark,
  );
  static final lightTheme = ThemeData(
    fontFamily: 'Ubuntu',
    brightness: Brightness.light,
  );

  Future<bool> _darkModeEnable = SharedPreferencesService.checkDarkMode();
  Future<bool> get darkModeEnabled => _darkModeEnable;

  void checkDarkModeEnabled() {
    _darkModeEnable = SharedPreferencesService.checkDarkMode();
    notifyListeners();
  }
}
