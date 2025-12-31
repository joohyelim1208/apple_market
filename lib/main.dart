
import 'package:apple_market/theme/app_theme.dart';
import 'package:flutter/material.dart';

import 'ui/home_page/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AppleMarket',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
      // home: CartEmptyPage() 
      home: HomePage(),
    );
  }
}
