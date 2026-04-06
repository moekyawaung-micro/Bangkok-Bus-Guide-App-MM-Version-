```dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/bus_item_widget.dart';
import '../models/bus_item.dart';
import '../providers/app_provider.dart';
import '../l10n/app_localizations.dart';

// Demo Bus Data
const List<BusItem> demoBuses = [
  BusItem(
    id: '1',
    busNo: 'A1',
    route: 'Downtown - Airport',
    en: 'Downtown to Airport',
    my: 'မြို့ထဲမှ လေဆိပ်သို့',
    thai: 'ดาวน์ทาวน์ ไป สนามบิน',
  ),
  BusItem(
    id: '2',
    busNo: 'B2',
    route: 'Station - Market',
    en: 'Station to Market',
    my: 'ဘူတာမှ စျေးသို့',
    thai: 'สถานี ไป ตลาด',
  ),
];

class BusScreen extends StatelessWidget {
  const BusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    final app = Provider.of<AppProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text(loc.tabBus)),
      body: ListView.builder(
        itemCount: demoBuses.length,
        itemBuilder: (context, i) {
          return BusItemWidget(bus: demoBuses[i]);
        },
      ),
    );
  }
}
```
