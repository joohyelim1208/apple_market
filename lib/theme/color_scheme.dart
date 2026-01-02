import 'package:apple_market/theme/tokens/app_colors.dart';
import 'package:flutter/material.dart';

class ColorSchemes {
  static const ColorScheme lightColorScheme = ColorScheme.light(
    primary: AppColors.lightPrimary,
    onPrimary: Colors.white,
    secondary: AppColors.lightSecondary,
    onSecondary: Colors.black,
    surface: AppColors.lightSurface,
    onSurface: AppColors.lightText,
    primaryContainer: AppColors.lightPrimary,
    error: AppColors.lightError,
    surfaceContainerHighest: AppColors.lightSurfaceVariant,
  );

  static const ColorScheme darkColorScheme = ColorScheme.dark(
    primary: AppColors.darkPrimary,
    onPrimary: Colors.black,
    secondary: AppColors.darkSecondary,
    onSecondary: Colors.white,
    surface: AppColors.darkSurface,
    onSurface: AppColors.darkText,
    primaryContainer: AppColors.darkPrimary,
    error: AppColors.darkError,
    surfaceContainerHighest: AppColors.darkSurfaceVariant,
  );
}
