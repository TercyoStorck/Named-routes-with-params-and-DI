import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:routes_named_with_params_and_di/view/view_1.dart';
import 'package:routes_named_with_params_and_di/view/view_2.dart';
import 'package:routes_named_with_params_and_di/view/view_3.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'routes.dart';

mixin RoutesDelegates {
  final GetIt injector = GetIt();

  Route routeToDelegate(RouteSettings route) {
    switch (route.name) {
      case Routes.VIEW_1:
        final sharedPreferences = this.injector.get<SharedPreferences>();

        return MaterialPageRoute(
          builder: (BuildContext context) => View1(sharedPreferences),
        );
      case Routes.VIEW_2:
        final person = route.arguments as String;

        return MaterialPageRoute(
          builder: (BuildContext context) => View2(person),
        );
      case Routes.VIEW_3:
        final person = this.injector.get<String>();

        return MaterialPageRoute(
          builder: (BuildContext context) => View3(person),
        );
    }

    return null;
  }

  Route unknownRouteDelegate(RouteSettings route) {
    return null;
  }
}