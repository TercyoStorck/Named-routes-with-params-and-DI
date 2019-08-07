import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'infrastructure/navigation/routes.dart';
import 'infrastructure/navigation/routes_delegates.dart';

void main() async => runApp(await _setUpApplication());

Future<Application> _setUpApplication() async {
  final application = Application();
  final sharedPreferences = await SharedPreferences.getInstance();

  application.injector.registerSingleton(sharedPreferences);
  application.injector.registerFactory(() => "John from injector");

  return application;
}

class Application extends StatelessWidget with RoutesDelegates {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Routes().initialRoute,
      onGenerateRoute: routeToDelegate,
      onUnknownRoute: unknownRouteDelegate,
    );
  }
}