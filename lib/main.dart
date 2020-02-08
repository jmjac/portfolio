import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:portfolio/rootPage.dart';
import 'package:portfolio/settings/settings_page.dart';
import 'package:portfolio/settings/store/settings.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'authentication/auth.dart';
import 'authentication/base_auth.dart';
import 'authentication/store/authentication.dart';
import 'home_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final BaseAuth _auth = Auth();
  final SharedPreferences _preferences = await SharedPreferences.getInstance();

  runApp(MultiProvider(providers: [
    Provider(create: (_) => AuthenticationStore(auth: _auth)),
    Provider(create: (_) => SettingsStore(preferences: _preferences)),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final settings = Provider.of<SettingsStore>(context);
    settings.loadSettings();

    return Observer(builder: (_) {
      ThemeData appTheme = ThemeData(
          primarySwatch: settings.color,
          brightness: settings.darkMode ? Brightness.dark : Brightness.light);

      return MaterialApp(
        title: 'Firebase with mobx',
        theme: appTheme,
        initialRoute: "/",
        routes: {
          "": (context) => RootPage(),
          "home": (context) => HomePage(),
          "home/settings": (context) => SettingsPage()
        },
        home: RootPage(),
      );
    });
  }
}
