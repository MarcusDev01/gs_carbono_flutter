import 'package:flutter/material.dart';
import '../model/emission.dart';
import 'app_routes.dart';

import '../ui/screens/splash_screen.dart';
import '../ui/screens/intro_screen.dart';
import '../ui/screens/dashboard_screen.dart';
import '../ui/screens/emissions_screen.dart';
import '../ui/screens/emission_details_screen.dart';
import '../ui/screens/simulator_screen.dart';

class AppNavigation {

  static Route<dynamic> generateRoute(
    RouteSettings settings,
  ) {

    switch (settings.name) {

      case AppRoutes.splash:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );

      case AppRoutes.intro:
        return MaterialPageRoute(
          builder: (_) => const IntroScreen(),
        );

      case AppRoutes.dashboard:
        return MaterialPageRoute(
          builder: (_) => const DashboardScreen(),
        );

      case AppRoutes.emissions:
        return MaterialPageRoute(
          builder: (_) => const EmissionsScreen(),
        );

      case AppRoutes.emissionDetails:

        final emission =
            settings.arguments as Emission;

        return MaterialPageRoute(
          builder: (_) => EmissionDetailsScreen(
            emission: emission,
          ),
        );

      case AppRoutes.simulator:
        return MaterialPageRoute(
          builder: (_) => const SimulatorScreen(),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text(
                'Rota não encontrada',
              ),
            ),
          ),
        );
    }
  }
}