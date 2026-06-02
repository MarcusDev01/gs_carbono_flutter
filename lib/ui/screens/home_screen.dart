import 'package:flutter/material.dart';
import 'package:gs_carbono_flutter/model/app_state.dart';
import 'package:provider/provider.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF2E7D32), Color(0xFF00897B)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: const Text(
              'Dashboard',
              style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.settings, color: Colors.white),
                onPressed: () => Navigator.pushNamed(context, '/settings'),
              ),
            ],
          ),
        ),
      ),
      body: Consumer<AppState>(
        builder: (context, appState, _) {
          final selectedFilters = appState.selectedFilters;
          final isDarkMode = appState.darkMode;

          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                if (selectedFilters.isNotEmpty)
                  Container(
                    padding: const EdgeInsets.all(12),
                    margin: const EdgeInsets.only(bottom: 16),
                    decoration: BoxDecoration(
                      color: isDarkMode ? const Color(0xFF2E7D32).withOpacity(0.3) : const Color(0xFF2E7D32).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: const Color(0xFF2E7D32)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Filtros aplicados:',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: isDarkMode ? Colors.white : Colors.black,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Wrap(
                          spacing: 8,
                          children: selectedFilters.map((filter) {
                            return Chip(
                              label: Text(filter),
                              onDeleted: () {
                                appState.updateFilters(
                                  selectedFilters..remove(filter),
                                );
                              },
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    children: [
                      _DashboardCard(
                        icon: Icons.eco,
                        title: 'Emissões',
                        subtitle: selectedFilters.isEmpty ? '12.4 tCO₂' : '${selectedFilters.length} filtros',
                        color: const Color(0xFF2E7D32),
                        onTap: () => Navigator.pushNamed(context, '/details'),
                      ),
                      _DashboardCard(
                        icon: Icons.filter_list,
                        title: 'Filtros',
                        subtitle: selectedFilters.isEmpty ? 'Aplicar filtros' : '${selectedFilters.length} ativo(s)',
                        color: const Color(0xFF00897B),
                        onTap: () => Navigator.pushNamed(context, '/filter'),
                      ),
                      _DashboardCard(
                        icon: Icons.bar_chart,
                        title: 'Estatísticas',
                        subtitle: 'Ver gráficos',
                        color: const Color(0xFF1976D2),
                        onTap: () => Navigator.pushNamed(context, '/statistics'),
                      ),
                      _DashboardCard(
                        icon: Icons.settings,
                        title: 'Configurações',
                        subtitle: 'Ajustes',
                        color: const Color(0xFF388E3C),
                        onTap: () => Navigator.pushNamed(context, '/settings'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _DashboardCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color color;
  final VoidCallback onTap;

  const _DashboardCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Provider.of<AppState>(context).darkMode;

    return Card(
      elevation: 4,
      shadowColor: Colors.black26,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 48, color: color),
              const SizedBox(height: 8),
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: isDarkMode ? Colors.white : Colors.black,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: 14,
                  color: isDarkMode ? Colors.white70 : Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}