import 'package:flutter/material.dart';
import 'package:gs_carbono_flutter/model/app_state.dart';
import 'package:gs_carbono_flutter/ui/screens/details_screen.dart';
import 'package:gs_carbono_flutter/ui/screens/filter_screen.dart';
import 'package:gs_carbono_flutter/ui/screens/home_screen.dart';
import 'package:gs_carbono_flutter/ui/screens/intro_screen.dart';
import 'package:gs_carbono_flutter/ui/screens/settings_screen.dart';
import 'package:gs_carbono_flutter/ui/screens/splash_screen.dart';
import 'package:gs_carbono_flutter/ui/screens/statistics_screen.dart';
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
              primaryColor: const Color(0xFF2E7D32),
              colorScheme: ColorScheme.fromSeed(
                seedColor: const Color(0xFF2E7D32),
                primary: const Color(0xFF2E7D32),
                secondary: const Color(0xFF00897B),
                surface: const Color(0xFFF4F4F4),
                error: const Color(0xFFD32F2F),
              ),
              scaffoldBackgroundColor: const Color(0xFFF4F4F4),
              textTheme: const TextTheme(
                displayLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                displayMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
                bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
              ),
              cardTheme: CardThemeData(
  elevation: 4,
  shadowColor: Colors.black26,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(12),
  ),
  margin: const EdgeInsets.all(8),
),
              appBarTheme: const AppBarTheme(
                elevation: 0,
                centerTitle: true,
              ),
              useMaterial3: true,
            ),
            darkTheme: ThemeData(
              primaryColor: const Color(0xFF2E7D32),
              colorScheme: ColorScheme.fromSeed(
                seedColor: const Color(0xFF2E7D32),
                primary: const Color(0xFF2E7D32),
                secondary: const Color(0xFF00897B),
                surface: const Color(0xFF1E1E1E),
                error: const Color(0xFFD32F2F),
                brightness: Brightness.dark,
              ),
              scaffoldBackgroundColor: const Color(0xFF121212),
              textTheme: const TextTheme(
                displayLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
                displayMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: Colors.white),
                bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: Colors.white70),
              ),
              cardTheme: CardThemeData(
  elevation: 4,
  shadowColor: Colors.black26,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(12),
  ),
  margin: const EdgeInsets.all(8),
),
              appBarTheme: const AppBarTheme(
                elevation: 0,
                centerTitle: true,
              ),
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
            },
          );
        },
      ),
    );
  }
}