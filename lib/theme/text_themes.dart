import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextTheme {
  static TextTheme buildTextTheme(TextTheme base, Color color) {
    return GoogleFonts.notoSansTextTheme(base).copyWith(
      titleLarge: GoogleFonts.dongle(
        color: color,
        fontSize: 35,
        fontWeight: FontWeight.bold,
      ),
      bodyMedium: GoogleFonts.notoSans(
        color: color,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      bodySmall: GoogleFonts.notoSans(color: color, fontSize: 14),
    );
  }
}
