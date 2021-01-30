import 'package:flutter_example/services/theme_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

final _prefs = SharedPreferences.getInstance();

class SharedPreferencesService {
  static Future<bool> checkDarkMode() async {
    final SharedPreferences prefs = await _prefs;
    final bool isDarkMode = prefs.get('dark_mode') ??
        ThemeService.defaultTheme == AppTheme.DarkTheme;
    return isDarkMode;
  }

  static Future<void> enableDarkMode() async {
    final SharedPreferences prefs = await _prefs;
    prefs.setBool('dark_mode', true);
  }

  static Future<void> disableDarkMode() async {
    final SharedPreferences prefs = await _prefs;
    prefs.setBool('dark_mode', false);
  }
}
