import 'package:flutter/material.dart';
import 'package:location_mapbox_flutter/view/history_screen/history_screen.dart';
import 'package:location_mapbox_flutter/view/home_screen/home_screen.dart';

import '../main.dart';
import '../view/result_screen/result_screen.dart';

class AppRoutes {
  static const init = '/';
  static const home = '/home';
  static const result = '/result';
  static const history = '/history';
}

Route<dynamic>? generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.init:
      return MaterialPageRoute(
        builder: (context) => const AppInit(),
      );

    case AppRoutes.home:
      return MaterialPageRoute(
        builder: (context) => HomeScreen(),
      );

    case AppRoutes.result:
      return MaterialPageRoute(
        builder: (context) => const ResultScreen(),
      );

    case AppRoutes.history:
      return MaterialPageRoute(
        builder: (context) => const HistoryScreen(),
      );

    default:
      return MaterialPageRoute(
        builder: (context) => const AppInit(),
      );
  }
}
