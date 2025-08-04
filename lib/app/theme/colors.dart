import 'package:flutter/material.dart';

class AppColors {
  // Primary Colors
  static const primary = Color(0xFFFF592B);
  static const primaryDark = Color(0xFFE54A1F);
  static const primaryLight = Color(0xFFFF7A5C);

  // Secondary Colors
  static const secondary = Color(0xFF10B981);
  static const accent = Color(0xFFF59E0B);

  // Neutral Colors
  static const background = Color(0xFFF8FAFC);
  static const surface = Color(0xFFFFFFFF);
  static const onSurface = Color(0xFF000924);

  // Status Colors
  static const success = Color(0xFF10B981);
  static const warning = Color(0xFFF59E0B);
  static const error = Color(0xFFEF4444);

  // Gradients
  static const primaryGradient = LinearGradient(
    colors: [primary, primaryDark],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // Additional Colors
  static const backgroundLight = Color(0xFFE2E8F0);
  static const white = Color(0xFFFFFFFF);

  // Leaderboard Colors
  static const gold = Color(0xFFFFD700);
  static const silver = Color(0xFFC0C0C0);
  static const bronze = Color(0xFFCD7F32);

  static const backgroundGradient = LinearGradient(
    colors: [background, backgroundLight],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

}
