import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonThemes {
  static ElevatedButtonThemeData elevatedButtonTheme(ColorScheme colors) {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: colors.secondary,
        foregroundColor: colors.onSecondary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(12),
        ),
        textStyle: GoogleFonts.notoSans(fontSize: 16),
      ),
    );
  }

  static FloatingActionButtonThemeData floatingActionButtonTheme(
    ColorScheme colors,
  ) {
    return FloatingActionButtonThemeData(
      backgroundColor: colors.secondary,
      foregroundColor: colors.onSecondary,
      elevation: 5,
      iconSize: 24,
      shape: CircleBorder(),
    );
  }
}
