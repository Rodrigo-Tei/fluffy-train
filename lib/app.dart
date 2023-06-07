import 'package:fluffy_train/login_page.dart';
import 'package:fluffy_train/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'modules/home/ui/home_page.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  bool isLogged = false;

  getInitialPage() async {
    final SharedPreferences prefs = await _prefs;

    setState(() {
      if (prefs.getBool('logged') != null) {
        isLogged = prefs.getBool('logged')!;
      }
      ;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: DefaultTheme.theme,
      home: isLogged ? const HomePage() : const LoginPage(),
    );
  }
}
