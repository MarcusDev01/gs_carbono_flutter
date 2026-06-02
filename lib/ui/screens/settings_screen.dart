import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notifications = true;
  bool _darkMode = false;

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
            title: const Text('Configurações', style: TextStyle(color: Colors.white)),
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
              child: SwitchListTile(
                title: const Text('Notificações', style: TextStyle(fontSize: 16)),
                subtitle: const Text('Receba alertas', style: TextStyle(fontSize: 14)),
                value: _notifications,
                onChanged: (value) => setState(() => _notifications = value),
                activeColor: const Color(0xFF2E7D32),
              ),
            ),
            const SizedBox(height: 8),
            Card(
              child: SwitchListTile(
                title: const Text('Modo escuro', style: TextStyle(fontSize: 16)),
                subtitle: const Text('Ativar tema escuro', style: TextStyle(fontSize: 14)),
                value: _darkMode,
                onChanged: (value) => setState(() => _darkMode = value),
                activeColor: const Color(0xFF00897B),
              ),
            ),
            const SizedBox(height: 8),
            Card(
              child: ListTile(
                leading: const Icon(Icons.info, color: Color(0xFF1976D2)),
                title: const Text('Versão', style: TextStyle(fontSize: 16)),
                subtitle: const Text('1.0.0', style: TextStyle(fontSize: 14)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
