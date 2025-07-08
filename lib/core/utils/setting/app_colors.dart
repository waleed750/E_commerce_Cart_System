import 'package:flutter/material.dart';

class AppColors {
  // ✅ Primary & Branding
  static const primary = Color(0xFFFF8D41);
  static const primaryLight =
      Color(0xFFFFB07C); // Lighter shade for hover/focus
  static const gradient = LinearGradient(
    colors: [
      Color(0xFF3C82F6),
      Color(0xFF1E4CA1),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // ✅ Backgrounds
  static const background = Color(0xFFF5F5F5); // Light Blue Background
  static const dividerColor = Color(0xFFF5F5F5);
  static const cardBackground = Color(0xFFF9FBFF);
  static const textFieldBg = Color(0xFFD9D9D9); // Optional for inputs
  static const transparent = Color(0x00000000); // Transparent color
  static const textColor = Color(0xFF616161); // Text Color

  // ✅ Text
  static const textPrimary = Color(0xFF1A1A1A);
  static const textMuted = Color(0xFF6B7280);
  static const white = Color(0xFFFFFFFF);
  static const black = Color(0xFF1E1E1E);

  // ✅ UI + States
  static const success = Color(0xFF22C55E);
  static const error = Color(0xFFEF4444);
  static const warning = Color(0xFFF59E0B);
  static const helpBlue = Color(0xFF3282B8); // Optional support color

  // ✅ Borders / Disabled
  static const disabledBorder = Color(0xFFD9DFE2);
  static const gray = Color(0xFFA2AAAD);
  static const lightGray = Color(0xFFF1F1F1);
}
