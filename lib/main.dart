import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'services/service_locator.dart';

void main() {
  setupServiceLocator();
  runApp(
    MultiProvider(
      providers: [],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp();
  }
}
