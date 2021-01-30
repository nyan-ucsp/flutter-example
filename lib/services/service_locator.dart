import 'package:flutter_example/database/database.dart';
import 'package:get_it/get_it.dart';

import 'navigation_service.dart';
import 'web_service.dart';

GetIt serviceLocator = GetIt.instance;

void setupServiceLocator() {
  serviceLocator.registerLazySingleton(() => WebService());
  serviceLocator.registerLazySingleton(() => NavigationService());
}
