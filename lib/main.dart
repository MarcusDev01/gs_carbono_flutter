import 'package:flutter/material.dart';
import 'navigation/app_navigation.dart';
import 'navigation/app_routes.dart';

void main() {
  runApp(const ClimateWatchApp());
}

class ClimateWatchApp extends StatelessWidget {
  const ClimateWatchApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GS Carbono',
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.splash,
      onGenerateRoute: AppNavigation.generateRoute,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
    );
  }
}