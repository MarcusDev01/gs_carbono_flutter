import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:gs_carbono_flutter/model/app_state.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  double calcularTotal(Set<String> filtros) {
    double total = 0;

    if (filtros.contains('Indústria')) total += 125;
    if (filtros.contains('Transporte')) total += 85;
    if (filtros.contains('Energia')) total += 65;
    if (filtros.contains('Desmatamento')) total += 210;

    return total;
  }

  @override
  Widget build(BuildContext context) {
    final filtros = Provider.of<AppState>(context).selectedFilters;
    final total = calcularTotal(filtros);
    final isDarkMode = Provider.of<AppState>(context).darkMode;

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
              'Detalhes',
              style: TextStyle(color: Colors.white),
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
        child: Column(
          children: [
            Card(
              child: ListTile(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/analysis',
                  );
                },
                leading: const Icon(
                  Icons.eco,
                  color: Color(0xFF06B6D4),
                ),
                title: const Text(
                  'Emissão Atual',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  '$total tCO₂',
                  style: TextStyle(
                    color: isDarkMode
                        ? Colors.white70
                        : Colors.black54,
                  ),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                ),
              ),
            ),

            const SizedBox(height: 8),

            Card(
              child: ListTile(
                leading: const Icon(
                  Icons.trending_down,
                  color: Color(0xFF6D28D9),
                ),
                title: const Text(
                  'Redução',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  filtros.isEmpty
                      ? 'Selecione filtros para analisar'
                      : '${(total * 0.15).toStringAsFixed(1)} tCO₂ de redução potencial',
                ),
              ),
            ),

            const SizedBox(height: 8),

            Card(
              child: ListTile(
                leading: const Icon(
                  Icons.info,
                  color: Color(0xFF1E3A8A),
                ),
                title: const Text(
                  'Info',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  filtros.isEmpty
                      ? 'Nenhum filtro selecionado.'
                      : 'Filtros ativos: ${filtros.join(", ")}',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}