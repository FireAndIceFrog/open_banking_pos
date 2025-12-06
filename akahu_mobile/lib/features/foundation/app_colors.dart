// Centralized color scheme for the app.
import 'package:flutter/material.dart';

class AppColors {
  // Brand palette
  static const Color primary = Colors.white;
  static const Color secondary = Color(0xFF0A2463); // deep blue
  static const Color tertiary = Color(0xFF5BC0EB); // sky blue

  // Semantic/supporting
  static const Color textPrimary = Colors.black87;
  static const Color textSecondary = Colors.black54;
  static const Color cardBg = Colors.white;
  static const Color surface = Colors.white;
  static const Color divider = Color(0xFFE5E7EB);
}

ThemeData buildAppTheme() {
  final colorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: AppColors.primary,
    onPrimary: AppColors.textPrimary,
    secondary: AppColors.secondary,
    onSecondary: Colors.white,
    tertiary: AppColors.tertiary,
    onTertiary: Colors.white,
    surface: AppColors.surface,
    onSurface: AppColors.textPrimary,
    background: Colors.white,
    onBackground: AppColors.textPrimary,
    error: const Color(0xFFB00020),
    onError: Colors.white,
  );

  return ThemeData(
    colorScheme: colorScheme,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      foregroundColor: AppColors.secondary,
      elevation: 0,
      centerTitle: false,
    ),
    cardTheme: CardThemeData(
      color: AppColors.cardBg,
      elevation: 2,
      margin: const EdgeInsets.all(8),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    ),
    dividerColor: AppColors.divider,
    useMaterial3: true,
  );
}
