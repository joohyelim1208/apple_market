import 'package:flutter/material.dart';

class InputThemes {
  static InputDecorationThemeData inputDecorationTheme(ColorScheme colors) {
    return InputDecorationThemeData(
      filled: true,
      fillColor: colors.surfaceContainerHighest,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: colors.primary, width: 2),
      ),
      contentPadding: const EdgeInsets.all(16),
      labelStyle: TextStyle(color: colors.onSurface.withValues(alpha: 0.7)),
    );
  }
}