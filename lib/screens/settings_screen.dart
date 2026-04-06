```dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_provider.dart';
import '../l10n/app_localizations.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final app = Provider.of<AppProvider>(context);
    final loc = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(title: Text(loc.tabSettings)),
      body: ListView(
        children: [
          SwitchListTile(
            title: Text(loc.darkMode),
            value: app.isDarkMode,
            onChanged: (v) => app.toggleDarkMode(),
          ),
          ListTile(
            title: Text(loc.language),
            subtitle: Text({
              'en': 'English',
              'my': 'မြန်မာ',
              'th': 'ไทย'
            }[app.locale.languageCode]!),
            trailing: DropdownButton<Locale>(
              value: app.locale,
              onChanged: (locx) {
                if (locx != null) app.setLocale(locx);
              },
              items: const [
                DropdownMenuItem(value: Locale('en'), child: Text('English')),
                DropdownMenuItem(value: Locale('my'), child: Text('မြန်မာ')),
                DropdownMenuItem(value: Locale('th'), child: Text('ไทย')),
              ],
            ),
          ),
          const Divider(),
          ListTile(
            title: Text(loc.favorites),
            subtitle: Consumer<AppProvider>(
              builder: (ctx, app, _) {
                if (app.favoriteBusIds.isEmpty) {
                  return Text(loc.noFavorites);
                }
                return Text(app.favoriteBusIds.join(', '));
              },
            ),
          ),
        ],
      ),
    );
  }
}
```
