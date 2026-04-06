import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:provider/provider.dart';
import '../l10n/app_localizations.dart';
import '../providers/app_provider.dart';

final List<Map<String, String>> phrases = [
  {
    "en": "Where is the bus stop?",
    "my": "ဘတ်စ်ကားရပ်နားရာဘယ်မှာလဲ။",
    "th": "ป้ายรถเมล์อยู่ที่ไหน",
  },
  {
    "en": "How much is the ticket?",
    "my": "လက်မှတ်ဘယ်လောက်ကျလဲ။",
    "th": "ตั๋วราคาเท่าไร",
  },
];

class PhrasesScreen extends StatelessWidget {
  const PhrasesScreen({super.key});

  void _speak(BuildContext context, String lang, String text) async {
    final tts = FlutterTts();
    await tts.setLanguage(lang);
    await tts.speak(text);
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    final app = Provider.of<AppProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text(loc.tabPhrases)),
      body: ListView.builder(
        itemCount: phrases.length,
        itemBuilder: (ctx, i) {
          var phrase = phrases[i];
          String dispText = phrase[app.locale.languageCode] ?? phrase['en']!;
          return ListTile(
            title: Text(dispText),
            trailing: app.locale.languageCode == 'th'
                ? IconButton(
                    icon: const Icon(Icons.volume_up),
                    onPressed: () =>
                        _speak(context, 'th-TH', phrase['th'] ?? ''),
                  )
                : null,
          );
        },
      ),
    );
  }
}
