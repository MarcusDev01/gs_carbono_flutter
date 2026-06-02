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
    'Transporte',
    'Energia',
    'Alimentação',
    'Resíduos',
    'Consumo',
  ];

  @override
  void initState() {
    super.initState();
    _selected = Set.from(Provider.of<AppState>(context, listen: false).selectedFilters);
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Provider.of<AppState>(context).darkMode;

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
            title: const Text('Filtros', style: TextStyle(color: Colors.white)),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.pop(context),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  setState(() => _selected.clear());
                  Provider.of<AppState>(context, listen: false).clearFilters();
                },
                child: const Text('Limpar', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: _options.map((option) {
            final isSelected = _selected.contains(option);
            return Card(
              child: CheckboxListTile(
                title: Text(
                  option,
                  style: TextStyle(
                    fontSize: 16,
                    color: isDarkMode ? Colors.white : Colors.black,
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
                    Provider.of<AppState>(context, listen: false).updateFilters(_selected);
                  });
                },
                activeColor: const Color(0xFF2E7D32),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}