```dart
import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';

class DestinationScreen extends StatelessWidget {
  const DestinationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(title: Text(loc.tabDestination)),
      body: Center(child: Text('Destination info to be added!')),
    );
  }
}
```
