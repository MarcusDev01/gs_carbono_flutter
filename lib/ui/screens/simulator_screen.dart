import 'package:flutter/material.dart';
import '../top_bar/climate_watch_top_bar.dart';

class SimulatorScreen extends StatefulWidget {
  const SimulatorScreen({super.key});

  @override
  State<SimulatorScreen> createState() => _SimulatorScreenState();
}

class _SimulatorScreenState extends State<SimulatorScreen> {

  double reduction = 0;

  @override
  Widget build(BuildContext context) {

    double currentEmission = 120;
    double result =
        currentEmission - (currentEmission * reduction / 100);

    return Scaffold(
      appBar: const ClimateWatchTopBar(
        title: 'Simulador',
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            Text(
              'Redução: ${reduction.toInt()}%',
              style: const TextStyle(fontSize: 24),
            ),

            Slider(
              min: 0,
              max: 100,
              value: reduction,
              onChanged: (value) {
                setState(() {
                  reduction = value;
                });
              },
            ),

            const SizedBox(height: 20),

            Text(
              'Emissão Atual: $currentEmission tCO₂',
              style: const TextStyle(fontSize: 20),
            ),

            const SizedBox(height: 10),

            Text(
              'Após redução: ${result.toStringAsFixed(1)} tCO₂',
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}