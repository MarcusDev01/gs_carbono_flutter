import 'package:flutter/material.dart';
import '../../navigation/app_routes.dart';
import '../top_bar/climate_watch_top_bar.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  Widget card(String titulo, String valor) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              titulo,
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            Text(
              valor,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: const ClimateWatchTopBar(
        title: 'Dashboard',
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            card("Indústria", "420 tCO₂"),
            card("Transporte", "310 tCO₂"),
            card("Energia", "520 tCO₂"),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  AppRoutes.emissions,
                );
              },
              child: const Text(
                "Ver Emissões",
              ),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  AppRoutes.simulator,
                );
              },
              child: const Text(
                "Simulador",
              ),
            ),
          ],
        ),
      ),
    );
  }
}