import 'package:flutter/material.dart';
import 'package:gs_carbono_flutter/model/app_state.dart';
import 'package:provider/provider.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  late Set<String> _selected;

  final List<String> _options = [
    'Indústria',
    'Transporte',
    'Energia',
    'Desmatamento',
  ];

  @override
  void initState() {
    super.initState();
    _selected = Set.from(
      Provider.of<AppState>(
        context,
        listen: false,
      ).selectedFilters,
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode =
        Provider.of<AppState>(context).darkMode;

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
              'Filtros',
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
            actions: [
              TextButton(
                onPressed: () {
                  setState(() {
                    _selected.clear();
                  });

                  Provider.of<AppState>(
                    context,
                    listen: false,
                  ).clearFilters();
                },
                child: const Text(
                  'Limpar',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  'Selecione os tipos de emissão que deseja visualizar.',
                  style: TextStyle(
                    fontSize: 15,
                    color: isDarkMode
                        ? Colors.white70
                        : Colors.black87,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 10),

            Expanded(
              child: ListView(
                children: _options.map((option) {
                  final isSelected =
                      _selected.contains(option);

                  return Card(
                    child: CheckboxListTile(
                      title: Text(
                        option,
                        style: TextStyle(
                          fontSize: 16,
                          color: isDarkMode
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                      subtitle: Text(
                        _getDescription(option),
                        style: TextStyle(
                          color: isDarkMode
                              ? Colors.white70
                              : Colors.grey[700],
                        ),
                      ),
                      value: isSelected,
                      onChanged: (bool? value) {
                        setState(() {
                          if (value == true) {
                            _selected.add(option);
                          } else {
                            _selected.remove(option);
                          }

                          Provider.of<AppState>(
                            context,
                            listen: false,
                          ).updateFilters(_selected);
                        });
                      },
                      activeColor: const Color(0xFF06B6D4),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getDescription(String option) {
    switch (option) {
      case 'Indústria':
        return 'Visualizar emissões do setor industrial';

      case 'Transporte':
        return 'Monitorar emissões de veículos e logística';

      case 'Energia':
        return 'Analisar emissões da geração de energia';

      case 'Desmatamento':
        return 'Acompanhar impactos ambientais e perda florestal';

      default:
        return '';
    }
  }
}