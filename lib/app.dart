import 'package:fluffy_train/modules/home/ui/home_page.dart';
import 'package:fluffy_train/theme/colors.dart';
import 'package:flutter/material.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: DefaultTheme.theme,
      home: const HomePage(),
    );
  }
}
