import 'package:flutter/material.dart';
import 'route_screen.dart';
import 'bus_screen.dart';
import 'phrases_screen.dart';
import 'destination_screen.dart';
import 'settings_screen.dart';
import '../l10n/app_localizations.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIdx = 0;

  final _tabs = const [
    RouteScreen(),
    BusScreen(),
    PhrasesScreen(),
    DestinationScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    return Scaffold(
      body: _tabs[_currentIdx],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIdx,
        onTap: (idx) => setState(() => _currentIdx = idx),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.alt_route), label: loc.tabRoute),
          BottomNavigationBarItem(icon: Icon(Icons.directions_bus), label: loc.tabBus),
          BottomNavigationBarItem(icon: Icon(Icons.translate), label: loc.tabPhrases),
          BottomNavigationBarItem(icon: Icon(Icons.location_on), label: loc.tabDestination),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: loc.tabSettings),
        ],
      ),
    );
  }
}
