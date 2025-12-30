import 'package:flutter/material.dart';

class Themes {
  static ThemeData theme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.light,
      seedColor: const Color(0xFFFF968A),
      primary: const Color(0xFFFFAEA5),
      scrim: Colors.black,
      inverseSurface: Colors.black,
      onInverseSurface: Colors.white,
    ),

    textTheme: TextTheme(
      headlineLarge: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontFamily: "Dongle",
      ),
      titleMedium: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontFamily: "NotoSans",
      ),
      titleSmall: TextStyle(color: Colors.black54, fontFamily: "NotoSans"),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.dark,
      seedColor: const Color(0xFFFF968A),
      primary: const Color(0xFFFFAEA5),
      scrim: Colors.white,
      inverseSurface: Colors.white,
      onInverseSurface: Colors.black,
    ),

    textTheme: TextTheme(
      headlineLarge: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontFamily: "Dongle",
      ),
      titleMedium: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontFamily: "NotoSans",
      ),
      titleSmall: TextStyle(color: Colors.white, fontFamily: "NotoSans"),
    ),
  );

  static ThemeData? get light => null;
}
