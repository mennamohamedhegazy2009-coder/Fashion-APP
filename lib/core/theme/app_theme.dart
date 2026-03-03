import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/theme/app_color.dart';

abstract class AppTheme {
  static ThemeData getTheme(
          ColorScheme colorScheme,
          ElevatedButtonThemeData elvatedButtonThemeData,
          InputDecorationTheme inpuDecoration) =>
      ThemeData(colorScheme: colorScheme);

  static ThemeData lightMode = getTheme(
    const ColorScheme(
      brightness: Brightness.light,
      primary: AppColor.primary,
      onPrimary: AppColor.white,
      secondary: AppColor.primaryLight,
      onSecondary: AppColor.white,
      error: AppColor.error,
      onError: AppColor.white,
      background: AppColor.background,
      onBackground: AppColor.textPrimary,
      surface: AppColor.surface,
      onSurface: AppColor.textPrimary,
    ),
    ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColor.primary,
        foregroundColor: AppColor.white,
        disabledBackgroundColor: AppColor.buttonDisabled,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    ),
    InputDecorationTheme(
      filled: true,
      fillColor: AppColor.inputFill,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColor.inputBorder),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColor.inputFocusedBorder),
      ),
    ),
  );
}
