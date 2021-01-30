import 'package:bot_toast/bot_toast.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_example/database/database.dart';
import 'package:flutter_example/services/navigation_service.dart';
import 'package:flutter_example/services/theme_service.dart';
import 'package:provider/provider.dart';

import 'services/service_locator.dart';

void main() {
  setupServiceLocator();
  runApp(
    MultiProvider(
      providers: [
        Provider<Database>(
          create: (_) => Database(),
          dispose: (context, db) => db.close(),
        ),
        ChangeNotifierProvider(
          create: (_) => ThemeService(),
        )
      ],
      child: EasyLocalization(
        supportedLocales: [
          Locale('en', 'EN'),
          Locale('my', 'MM'),
          Locale('zh', 'CN'),
        ],
        saveLocale: true,
        path: 'resources/lang',
        fallbackLocale: Locale('en', 'EN'),
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      initialData: ThemeService.defaultTheme == AppTheme.DarkTheme,
      future: context.watch<ThemeService>().darkModeEnabled,
      builder: (context, snapshot) {
        return MaterialApp(
          title: 'Data Box',
          builder: BotToastInit(),
          navigatorKey: NavigationService.navigationKey,
          navigatorObservers: [BotToastNavigatorObserver()],
          theme:
              snapshot.data ? ThemeService.darkTheme : ThemeService.lightTheme,
          locale: context.locale,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          initialRoute: RouteName.splashScreenExample,
          onGenerateRoute: NavigationService.generateRoute,
        );
      },
    );
  }
}
