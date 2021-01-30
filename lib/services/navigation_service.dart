import 'package:flutter/material.dart';
import 'package:flutter_example/screens/choose_language_example_screen.dart';
import 'package:flutter_example/screens/flutter_examples_screen.dart';
import 'package:flutter_example/screens/splash_screen_example.dart';

class RouteName {
  static const String splashScreenExample = '/';
  static const String flutterExamplesScreen = '/flutter_examples_screen';
  static const String chooseLanguageExampleScreen =
      '/choose_language_example_screen';
}

class NavigationService {
  static final GlobalKey<NavigatorState> navigationKey =
      GlobalKey<NavigatorState>();

  static Future<dynamic> navigateTo(String routeName, {Object argument}) {
    return navigationKey.currentState.pushNamed(routeName, arguments: argument);
  }

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.splashScreenExample:
        // final SplashScreenExample args = settings.arguments;
        return MaterialPageRoute(
          builder: (_) => SplashScreenExample(),
        );
        break;
      case RouteName.flutterExamplesScreen:
        // final FlutterExamplesScreen args = settings.arguments;
        return MaterialPageRoute(
          builder: (_) => FlutterExamplesScreen(),
        );
        break;
      case RouteName.chooseLanguageExampleScreen:
        // final ChooseLanguageExampleScreen args = settings.arguments;
        return MaterialPageRoute(
          builder: (_) => ChooseLanguageExampleScreen(),
        );
        break;
      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.error_outline_outlined,
                    color: Colors.red,
                    size: 50,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "404 not found",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Route name",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "${settings.name}",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
    }
  }
}
