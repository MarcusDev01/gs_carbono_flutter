import 'package:flutter/material.dart';
import '../../model/emission.dart';
import '../top_bar/climate_watch_top_bar.dart';

class EmissionDetailsScreen extends StatelessWidget {

  final Emission emission;

  const EmissionDetailsScreen({
    super.key,
    required this.emission,
  });

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: const ClimateWatchTopBar(
        title: 'Detalhes',
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text(
              'Local: ${emission.local}',
              style: const TextStyle(fontSize: 22),
            ),

            const SizedBox(height: 10),

            Text(
              'Fonte: ${emission.source}',
              style: const TextStyle(fontSize: 22),
            ),

            const SizedBox(height: 10),

            Text(
              'Emissão: ${emission.value} tCO₂',
              style: const TextStyle(fontSize: 22),
            ),

            const SizedBox(height: 30),

            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Região monitorada com sucesso!',
                    ),
                  ),
                );
              },
              child: const Text(
                'Monitorar Região',
              ),
            ),
          ],
        ),
      ),
    );
  }
}