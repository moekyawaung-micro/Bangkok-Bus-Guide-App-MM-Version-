```dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:flutter_tts/flutter_tts.dart';

import '../models/bus_item.dart';
import '../providers/app_provider.dart';
import '../l10n/app_localizations.dart';

class BusItemWidget extends StatelessWidget {
  final BusItem bus;

  const BusItemWidget({Key? key, required this.bus}) : super(key: key);

  void _speakThai(BuildContext context) async {
    final tts = FlutterTts();
    await tts.setLanguage("th-TH");
    await tts.speak(bus.thai);
  }

  void _openGoogleMaps(BuildContext context) async {
    final url =
        'https://www.google.com/maps/search/?api=1&query=${Uri.encodeComponent(bus.route)}';
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url, mode: LaunchMode.externalApplication);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Could not launch Maps")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final app = Provider.of<AppProvider>(context);
    final loc = AppLocalizations.of(context)!;

    String routeText;
    if (app.locale.languageCode == 'th') {
      routeText = bus.thai;
    } else if (app.locale.languageCode == 'my') {
      routeText = bus.my;
    } else {
      routeText = bus.en;
    }

    return Card(
      elevation: 1,
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      child: ListTile(
        leading: CircleAvatar(
          child: Text(bus.busNo, style: const TextStyle(fontWeight: FontWeight.bold)),
        ),
        title: Text(routeText),
        subtitle: Text(bus.route),
        trailing: Wrap(
          spacing: 8,
          children: [
            IconButton(
              icon: Icon(app.isFavorite(bus) ? Icons.favorite : Icons.favorite_border, color: Colors.red),
              tooltip: loc.favorite,
              onPressed: () => app.toggleFavorite(bus),
            ),
            IconButton(
              icon: const Icon(Icons.map),
              tooltip: loc.googleMaps,
              onPressed: () => _openGoogleMaps(context),
            ),
            if (app.locale.languageCode == 'th')
              IconButton(
                icon: const Icon(Icons.volume_up),
                tooltip: loc.speakThai,
                onPressed: () => _speakThai(context),
              ),
          ],
        ),
      ),
    );
  }
}
```
