import 'package:flutter/material.dart';
import 'package:shtcut_mobile/core/base/base_view_model.dart';

class CustomLocationModel extends MBaseViewModel {
  final searchController = TextEditingController();
  Function(List<String>)? onSelectionChanged;

  CustomLocationModel() {
    _filteredCountries = List.from(availableCountries);
    searchController.addListener(_onSearchChanged);
  }

  final List<String> availableCountries = [
    'Nigeria',
    'Ghana',
    'Kenya',
    'South Africa',
    'Egypt',
    'Morocco',
    'United States',
    'United Kingdom',
    'Canada',
    'Australia',
    'Germany',
    'France',
    'Brazil',
    'India',
    'China',
    'Japan',
  ];

  final List<String> _selectedCountries = [];
  List<String> _filteredCountries = [];

  List<String> get selectedCountries => _selectedCountries;
  List<String> get filteredCountries =>
      _filteredCountries.isEmpty ? availableCountries : _filteredCountries;

  void setOnSelectionChanged(Function(List<String>) callback) {
    onSelectionChanged = callback;
  }

  void _onSearchChanged() {
    final query = searchController.text.toLowerCase();
    if (query.isEmpty) {
      _filteredCountries = List.from(availableCountries);
    } else {
      _filteredCountries = availableCountries
          .where((country) => country.toLowerCase().contains(query))
          .toList();
    }
    notifyListeners();
  }

  void toggleCountrySelection(String country) {
    if (_selectedCountries.contains(country)) {
      _selectedCountries.remove(country);
    } else {
      _selectedCountries.add(country);
    }
    notifyListeners();
    // Immediately notify parent about selection changes
    onSelectionChanged?.call(_selectedCountries);
  }

  bool isCountrySelected(String country) {
    return _selectedCountries.contains(country);
  }

  @override
  void dispose() {
    super.dispose();
    searchController.removeListener(_onSearchChanged);
    searchController.dispose();
  }
}
