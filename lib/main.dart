import 'package:flutter/material.dart';
import 'package:location_mapbox_flutter/utls/constants.dart';
import 'package:location_mapbox_flutter/view/home_screen/home_screen.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

import 'config/routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MapboxOptions.setAccessToken(AppConstants.ACCESS_TOKEN);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Location mapbox',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      onGenerateRoute: generateRoute,
    );
  }
}

class AppInit extends StatelessWidget {
  const AppInit({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeScreen();
  }
}
