import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DialogThemes {
  static SnackBarThemeData snackBarTheme(ColorScheme colors) {
    return SnackBarThemeData(
      backgroundColor: colors.onSurface,
      contentTextStyle: GoogleFonts.notoSans(
        color: colors.surface,
        fontSize: 14,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(12),
      ),
      behavior: SnackBarBehavior.floating,
    );
  }
}
