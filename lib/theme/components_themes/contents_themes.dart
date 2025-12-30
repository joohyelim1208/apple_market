import 'package:flutter/material.dart';

class ContentsThemes {
  static ListTileThemeData listTileTheme(ColorScheme colors) {
    return ListTileThemeData(
      tileColor: Colors.transparent,
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(12),
      ),
      iconColor: colors.onSurface,
      textColor: colors.onSurface,
    );
  }

  static DividerThemeData dividerTheme(ColorScheme colors) {
    return DividerThemeData(
      color: colors.onSurface.withValues(alpha: 0.1),
      thickness: 1,
      space: 24,
      indent: 10,
      endIndent: 10,
    );
  }

  static AppBarThemeData appBarTheme(ColorScheme colors) {
    return AppBarThemeData(
      backgroundColor: Colors.transparent,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontSize: 35,
        fontWeight: FontWeight.bold,
        fontFamily: "Dongle",
      ),
      iconTheme: IconThemeData(color: colors.onSurface),
    );
  }
}
