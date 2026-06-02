import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

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
            title: const Text('Detalhes', style: TextStyle(color: Colors.white)),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
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
                leading: const Icon(Icons.eco, color: Color(0xFF2E7D32)),
                title: const Text('Emissão Atual', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                subtitle: const Text('12.4 tCO₂', style: TextStyle(fontSize: 14)),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              ),
            ),
            const SizedBox(height: 8),
            Card(
              child: ListTile(
                leading: const Icon(Icons.trending_down, color: Color(0xFF388E3C)),
                title: const Text('Redução', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                subtitle: const Text('2.1 tCO₂ desde o último mês', style: TextStyle(fontSize: 14)),
              ),
            ),
            const SizedBox(height: 8),
            Card(
              child: ListTile(
                leading: const Icon(Icons.info, color: Color(0xFF1976D2)),
                title: const Text('Info', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                subtitle: const Text('Mantenha o hábito de reduzir suas emissões.', style: TextStyle(fontSize: 14)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}