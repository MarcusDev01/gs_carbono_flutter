import 'package:flutter/material.dart';

class AppState extends ChangeNotifier {
  bool _darkMode = false;
  Set<String> _selectedFilters = {};

  bool get darkMode => _darkMode;
  Set<String> get selectedFilters => _selectedFilters;

  void toggleDarkMode() {
    _darkMode = !_darkMode;
    notifyListeners();
  }

  void updateFilters(Set<String> filters) {
    _selectedFilters = filters;
    notifyListeners();
  }

  void clearFilters() {
    _selectedFilters.clear();
    notifyListeners();
  }
}