import 'package:flutter/material.dart';

/// Shared color palette for the app.
/// Primary: white backgrounds
/// Secondary: deep blue accents
/// Tertiary: sky blue highlights
/// Success/Warning/Error standardized for status components.
class AppColors {
  static const Color primary = Colors.white;

  // Deep blue secondary (accessible contrast with white)
  static const Color secondary = Color(0xFF0A3D62);

  // Sky blue tertiary
  static const Color tertiary = Color(0xFF4FC3F7);

  // Status colors
  static const Color success = Color(0xFF2ECC71); // green
  static const Color warning = Color(0xFFF1C40F);
  static const Color error = Color(0xFFE74C3C);

  // Text colors
  static const Color textPrimary = Color(0xFF1F1F1F);
  static const Color textSecondary = Color(0xFF4A4A4A);

  // Divider / Borders
  static const Color divider = Color(0xFFE0E0E0);
}
