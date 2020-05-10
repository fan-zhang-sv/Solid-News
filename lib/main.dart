import 'package:flutter/material.dart';
import 'Theme/lightTheme.dart';
import 'Theme/darkTheme.dart';
import 'package:provider/provider.dart';

import 'package:news_tracker/BottomNavigation.dart';
import 'Data/TopNewsContent.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (create) => NewsContent())],
      child: MaterialApp(
        title: 'News Tracker (Temporary)',
        theme: lightTheme(),
        darkTheme: darkTheme(),
        themeMode: ThemeMode.system,
        home: BottomNavigation(),
      ),
    );
  }
}
