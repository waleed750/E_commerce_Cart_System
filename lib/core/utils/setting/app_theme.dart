import 'package:flutter/material.dart';
import 'setting_export.dart';

class AppThemes {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.background,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      brightness: Brightness.light,
      primary: AppColors.primary,
      secondary: AppColors.primaryLight,
      error: AppColors.error,
    ),

    // ✅ AppBar
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.white,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: AppColors.textPrimary,
        fontSize: 22,
        fontWeight: FontWeight.bold,
        fontFamily: AppFonts.mainFont,
      ),
      iconTheme: IconThemeData(color: AppColors.primary),
      actionsIconTheme: IconThemeData(color: AppColors.primary),
    ),

    // ✅ Input Fields
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      hintStyle: const TextStyle(color: AppColors.textMuted),
      labelStyle: const TextStyle(color: AppColors.textPrimary),
      errorStyle: const TextStyle(color: AppColors.error),
      filled: true,
      fillColor: AppColors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.disabledBorder),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.primary),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.error),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.error),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.disabledBorder),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.disabledBorder),
      ),
      prefixIconColor: AppColors.primary,
      suffixIconColor: AppColors.primary,
    ),

    // ✅ Buttons
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        textStyle: WidgetStatePropertyAll(
          AppTextStyles.font10,
        ),
        backgroundColor: WidgetStatePropertyAll(AppColors.primary),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        padding: WidgetStatePropertyAll(
          const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: WidgetStatePropertyAll(AppColors.primary),
        overlayColor:
            WidgetStatePropertyAll(AppColors.primary.withValues(alpha: 0.1)),
      ),
    ),

    // ✅ Text Theme
    textTheme: const TextTheme(
      headlineLarge: TextStyle(color: AppColors.textPrimary, fontSize: 24),
      bodyMedium: TextStyle(color: AppColors.textPrimary, fontSize: 16),
      bodySmall: TextStyle(color: AppColors.textMuted, fontSize: 14),
    ),

    // ✅ Misc UI
    iconTheme: const IconThemeData(color: AppColors.primary),
    checkboxTheme: CheckboxThemeData(
      fillColor: WidgetStatePropertyAll(AppColors.primary),
    ),
    radioTheme: const RadioThemeData(
      fillColor: WidgetStatePropertyAll(AppColors.primary),
    ),
    dividerTheme: const DividerThemeData(
      color: AppColors.primary,
      thickness: 1.5,
    ),
    sliderTheme: SliderThemeData(
      thumbColor: AppColors.primary,
      activeTrackColor: AppColors.primary,
      inactiveTrackColor: AppColors.primary.withValues(alpha: 0.2),
    ),
  );
}
