```dart
import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';

class RouteScreen extends StatelessWidget {
  const RouteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(title: Text(loc.tabRoute)),
      body: Center(child: Text("Route info will be here")),
    );
  }
}
```
