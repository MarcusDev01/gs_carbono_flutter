import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../model/app_state.dart';

class EmissionAnalysisScreen extends StatelessWidget {
  const EmissionAnalysisScreen({super.key});

  double getValue(String filter) {
    switch (filter) {
      case 'Indústria':
        return 125;

      case 'Transporte':
        return 85;

      case 'Energia':
        return 65;

      case 'Desmatamento':
        return 210;

      default:
        return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    final filters =
        Provider.of<AppState>(context).selectedFilters;

    double total = 0;

    for (var filter in filters) {
      total += getValue(filter);
    }

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF1E3A8A),
                Color(0xFF06B6D4),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: const Text(
              'Análise de Emissões',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: filters.isEmpty
            ? const Center(
                child: Text(
                  'Nenhum filtro selecionado.',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              )
            : Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Filtros ativos',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 20),

                  ...filters.map(
                    (filter) => Card(
                      child: ListTile(
                        leading: const Icon(
                          Icons.analytics,
                          color: Color(0xFF06B6D4),
                        ),
                        title: Text(filter),
                        trailing: Text(
                          '${getValue(filter)} tCO₂',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  const Divider(),

                  ListTile(
                    title: const Text(
                      'TOTAL',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    trailing: Text(
                      '$total tCO₂',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: Color(0xFF06B6D4),
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}