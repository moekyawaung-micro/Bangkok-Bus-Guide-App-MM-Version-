import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'l10n/app_localizations.dart';
import 'providers/app_provider.dart';
import 'screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appProvider = AppProvider();
  await appProvider.loadPrefs();
  runApp(
    ChangeNotifierProvider.value(
      value: appProvider,
      child: const MMThaiBusGuide(),
    ),
  );
}

class MMThaiBusGuide extends StatelessWidget {
  const MMThaiBusGuide({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(
      builder: (context, app, _) {
        return MaterialApp(
          title: 'MM Thai Bus Guide',
          debugShowCheckedModeBanner: false,
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          themeMode: app.isDarkMode ? ThemeMode.dark : ThemeMode.light,
          locale: app.locale,
          supportedLocales: const [
            Locale('en'),
            Locale('my'),
            Locale('th'),
          ],
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          home: const SplashScreen(),
        );
      },
    );
  }
}
