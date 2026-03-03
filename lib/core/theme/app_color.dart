import 'package:flutter/material.dart';

abstract class AppColor {

  // ===== Primary Brand =====
  static const Color primary = Color(0xFFFF3E57);
  static const Color primaryDark = Color(0xFFE12D48);
  static const Color primaryLight = Color(0xFFFF6B81);
  static const Color primaryBackground = Color(0xFFFFECEE);

  // ===== Neutrals =====
  static const Color white = Color(0xFFFFFFFF);
  static const Color background = Color(0xFFF8F9FB);
  static const Color surface = Color(0xFFFFFFFF);

  static const Color textPrimary = Color(0xFF1C1C1E);
  static const Color textSecondary = Color(0xFF6E6E73);
  static const Color textHint = Color(0xFF9A9A9A);

  static const Color border = Color(0xFFE5E5EA);
  static const Color divider = Color(0xFFF0F0F0);

  // ===== Status Colors =====
  static const Color success = Color(0xFF34C759);
  static const Color error = Color(0xFFFF3B30);
  static const Color warning = Color(0xFFFF9500);
  static const Color info = Color(0xFF007AFF);

  // ===== Buttons =====
  static const Color buttonPrimary = primary;
  static const Color buttonDisabled = Color(0xFFCCCCCC);

  // ===== Inputs =====
  static const Color inputFill = Color(0xFFF5F5F7);
  static const Color inputBorder = border;
  static const Color inputFocusedBorder = primary;
}

