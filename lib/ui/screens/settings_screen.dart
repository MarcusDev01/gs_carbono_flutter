import 'package:flutter/material.dart';
import 'package:gs_carbono_flutter/model/app_state.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

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
      body: Consumer<AppState>(
        builder: (context, appState, _) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Card(
                  child: SwitchListTile(
                    title: Text(
                      'Notificações',
                      style: TextStyle(
                        fontSize: 16,
                        color: appState.darkMode ? Colors.white : Colors.black,
                      ),
                    ),
                    subtitle: Text(
                      'Receba alertas',
                      style: TextStyle(
                        fontSize: 14,
                        color: appState.darkMode ? Colors.white70 : Colors.grey,
                      ),
                    ),
                    value: true,
                    onChanged: (value) {},
                    activeColor: const Color(0xFF2E7D32),
                  ),
                ),
                const SizedBox(height: 8),
                Card(
                  child: SwitchListTile(
                    title: Text(
                      'Modo escuro',
                      style: TextStyle(
                        fontSize: 16,
                        color: appState.darkMode ? Colors.white : Colors.black,
                      ),
                    ),
                    subtitle: Text(
                      'Ativar tema escuro',
                      style: TextStyle(
                        fontSize: 14,
                        color: appState.darkMode ? Colors.white70 : Colors.grey,
                      ),
                    ),
                    value: appState.darkMode,
                    onChanged: (value) {
                      appState.toggleDarkMode();
                    },
                    activeColor: const Color(0xFF00897B),
                  ),
                ),
                const SizedBox(height: 8),
                Card(
                  child: ListTile(
                    leading: Icon(
                      Icons.info,
                      color: const Color(0xFF1976D2),
                    ),
                    title: Text(
                      'Versão',
                      style: TextStyle(
                        fontSize: 16,
                        color: appState.darkMode ? Colors.white : Colors.black,
                      ),
                    ),
                    subtitle: Text(
                      '1.0.0',
                      style: TextStyle(
                        fontSize: 14,
                        color: appState.darkMode ? Colors.white70 : Colors.grey,
                      ),
                    ),
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