import 'package:flutter/material.dart';
import 'package:flutter_example/services/shared_preferences_service.dart';
import 'package:flutter_example/services/theme_service.dart';
import 'package:provider/provider.dart';

class ChangeDarkThemeExampleScreen extends StatefulWidget {
  @override
  _ChangeDarkThemeExampleScreenState createState() =>
      _ChangeDarkThemeExampleScreenState();
}

class _ChangeDarkThemeExampleScreenState
    extends State<ChangeDarkThemeExampleScreen> {
  @override
  Widget build(BuildContext context) {
    bool currentMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        title: Text('Change Dark Theme'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          ListTile(
            leading: Icon(Icons.brightness_4),
            title: Text('Dark Mode'),
            trailing: Semantics(
              child: Switch(
                value: currentMode,
                onChanged: (value) async {
                  if (value) {
                    await SharedPreferencesService.enableDarkMode();
                    context.read<ThemeService>().checkDarkModeEnabled();
                  } else {
                    await SharedPreferencesService.disableDarkMode();
                    context.read<ThemeService>().checkDarkModeEnabled();
                  }
                },
              ),
            ),
            onTap: () async {
              if (currentMode) {
                await SharedPreferencesService.disableDarkMode();
                context.read<ThemeService>().checkDarkModeEnabled();
              } else {
                await SharedPreferencesService.enableDarkMode();
                context.read<ThemeService>().checkDarkModeEnabled();
              }
            },
          ),
        ],
      ),
    );
  }
}
