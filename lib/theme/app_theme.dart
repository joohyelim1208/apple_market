import 'package:apple_market/theme/color_scheme.dart';
import 'package:apple_market/theme/components_themes/button_themes.dart';
import 'package:apple_market/theme/components_themes/contents_themes.dart';
import 'package:apple_market/theme/components_themes/dialog_themes.dart';
import 'package:apple_market/theme/components_themes/input_themes.dart';
import 'package:apple_market/theme/text_themes.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme {
    const colorScheme = ColorSchemes.lightColorScheme;

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: colorScheme.surface,
      textTheme: AppTextTheme.buildTextTheme(
        ThemeData.light().textTheme,
        colorScheme.onSurface,
      ),

      elevatedButtonTheme: ButtonThemes.elevatedButtonTheme(colorScheme),
      floatingActionButtonTheme: ButtonThemes.floatingActionButtonTheme(
        colorScheme,
      ),

      listTileTheme: ContentsThemes.listTileTheme(colorScheme),
      dividerTheme: ContentsThemes.dividerTheme(colorScheme),
      appBarTheme: ContentsThemes.appBarTheme(colorScheme),

      inputDecorationTheme: InputThemes.inputDecorationTheme(colorScheme),

      snackBarTheme: DialogThemes.snackBarTheme(colorScheme),
    );
  }

  static ThemeData get darkTheme {
    const colorScheme = ColorSchemes.darkColorScheme;

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: colorScheme.surface,
      textTheme: AppTextTheme.buildTextTheme(
        ThemeData.dark().textTheme,
        colorScheme.onSurface,
      ),

      elevatedButtonTheme: ButtonThemes.elevatedButtonTheme(colorScheme),
      floatingActionButtonTheme: ButtonThemes.floatingActionButtonTheme(
        colorScheme,
      ),

      listTileTheme: ContentsThemes.listTileTheme(colorScheme),
      dividerTheme: ContentsThemes.dividerTheme(colorScheme),
      appBarTheme: ContentsThemes.appBarTheme(colorScheme),

      inputDecorationTheme: InputThemes.inputDecorationTheme(colorScheme),

      snackBarTheme: DialogThemes.snackBarTheme(colorScheme),
    );
  }
}
