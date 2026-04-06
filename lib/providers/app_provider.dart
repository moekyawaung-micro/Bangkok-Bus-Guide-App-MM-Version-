```dart
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/bus_item.dart';

class AppProvider extends ChangeNotifier {
  Locale _locale = const Locale('en');
  bool _isDarkMode = false;
  List<String> _favoriteBusIds = [];

  Locale get locale => _locale;
  bool get isDarkMode => _isDarkMode;
  List<String> get favoriteBusIds => _favoriteBusIds;

  Future<void> loadPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    _isDarkMode = prefs.getBool('darkMode') ?? false;
    _locale = Locale(prefs.getString('locale') ?? 'en');
    _favoriteBusIds = prefs.getStringList('favorites') ?? [];
    notifyListeners();
  }

  Future<void> toggleDarkMode() async {
    _isDarkMode = !_isDarkMode;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('darkMode', _isDarkMode);
    notifyListeners();
  }

  Future<void> setLocale(Locale locale) async {
    _locale = locale;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('locale', locale.languageCode);
    notifyListeners();
  }

  bool isFavorite(BusItem item) => _favoriteBusIds.contains(item.id);

  Future<void> toggleFavorite(BusItem item) async {
    if (_favoriteBusIds.contains(item.id)) {
      _favoriteBusIds.remove(item.id);
    } else {
      _favoriteBusIds.add(item.id);
    }
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('favorites', _favoriteBusIds);
    notifyListeners();
  }
}
```
