import 'package:apple_market/core/themes.dart';
import 'package:apple_market/ui/home_page/home_page.dart';
import 'package:flutter/material.dart';

// Title : Theme.of(context).TextTheme.titleLarge  | appBar Title
// SubTitle : Theme.of(context).TextTheme.bodyLarge | body 내 Section Title
// body : Theme.of(context).TextTheme.bodyMedium | body 주요 내용

// Theme.of(context).ColorScheme.primary | appBar 로고 색상, 활성화 Button 배경
// Theme.of(context).ColorScheme.InverseSurface | SnackBar 배경색
// Theme.of(context).ColorScheme.onInverseSurface | SnackBar 글자색

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AppleMarket',
      theme: Themes.light,
      home: HomePage(),
    );
  }
}
