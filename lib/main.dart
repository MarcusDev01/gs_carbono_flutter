import 'package:flutter/material.dart';
import 'package:gs_carbono_flutter/model/app_state.dart';
import 'package:gs_carbono_flutter/ui/screens/details_screen.dart';
import 'package:gs_carbono_flutter/ui/screens/filter_screen.dart';
import 'package:gs_carbono_flutter/ui/screens/home_screen.dart';
import 'package:gs_carbono_flutter/ui/screens/intro_screen.dart';
import 'package:gs_carbono_flutter/ui/screens/settings_screen.dart';
import 'package:gs_carbono_flutter/ui/screens/splash_screen.dart';
import 'package:gs_carbono_flutter/ui/screens/statistics_screen.dart';
import 'package:gs_carbono_flutter/ui/screens/emission_analysis_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(const GsCarbonoApp());

class GsCarbonoApp extends StatelessWidget {
  const GsCarbonoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppState(),
      child: Consumer<AppState>(
        builder: (context, appState, _) {
          return MaterialApp(
            title: 'GS Carbono',
            debugShowCheckedModeBanner: false,

            theme: ThemeData(
              primaryColor: const Color(0xFF1E3A8A),

              colorScheme: ColorScheme.fromSeed(
                seedColor: const Color(0xFF1E3A8A),
                primary: const Color(0xFF1E3A8A),
                secondary: const Color(0xFF06B6D4),
                surface: Colors.white,
                error: const Color(0xFFD32F2F),
              ),

              scaffoldBackgroundColor: const Color(0xFFE2E8F0),

              textTheme: const TextTheme(
                displayLarge: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
                displayMedium: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                bodyLarge: TextStyle(fontSize: 16),
                bodyMedium: TextStyle(fontSize: 14),
              ),

              cardTheme: CardThemeData(
                color: const Color(0xFFF8FAFC),
                elevation: 8,
                shadowColor: Colors.black26,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                margin: const EdgeInsets.all(8),
              ),

              appBarTheme: const AppBarTheme(elevation: 0, centerTitle: true),

              useMaterial3: true,
            ),

            darkTheme: ThemeData(
              brightness: Brightness.dark,

              primaryColor: const Color(0xFF1E3A8A),

              colorScheme: ColorScheme.fromSeed(
                seedColor: const Color(0xFF1E3A8A),
                primary: const Color(0xFF1E3A8A),
                secondary: const Color(0xFF06B6D4),
                surface: const Color(0xFF1E293B),
                error: const Color(0xFFD32F2F),
                brightness: Brightness.dark,
              ),

              scaffoldBackgroundColor: const Color(0xFF0F172A),

              cardTheme: CardThemeData(
                color: const Color(0xFF1E293B),
                elevation: 6,
                shadowColor: Colors.black45,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                margin: const EdgeInsets.all(8),
              ),

              textTheme: const TextTheme(
                displayLarge: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                displayMedium: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                bodyLarge: TextStyle(fontSize: 16, color: Colors.white),
                bodyMedium: TextStyle(fontSize: 14, color: Colors.white70),
              ),

              appBarTheme: const AppBarTheme(elevation: 0, centerTitle: true),

              useMaterial3: true,
            ),

            themeMode: appState.darkMode ? ThemeMode.dark : ThemeMode.light,

            initialRoute: '/splash',

            routes: {
              '/splash': (context) => const SplashScreen(),
              '/intro': (context) => const IntroScreen(),
              '/home': (context) => const HomeScreen(),
              '/details': (context) => const DetailsScreen(),
              '/filter': (context) => const FilterScreen(),
              '/statistics': (context) => const StatisticsScreen(),
              '/settings': (context) => const SettingsScreen(),
              '/analysis': (context) => const EmissionAnalysisScreen(),
            },
          );
        },
      ),
    );
  }
}
