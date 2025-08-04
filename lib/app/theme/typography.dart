import 'package:flutter/material.dart';
import 'colors.dart';

class AppTypography {
  static TextStyle get h1 => const TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: AppColors.onSurface,
        fontFamily: 'Roboto',
      );

  static TextStyle get h2 => const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: AppColors.onSurface,
        fontFamily: 'Roboto',
      );

  static TextStyle get h3 => const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: AppColors.onSurface,
        fontFamily: 'Roboto',
      );

  static TextStyle get body1 => const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: AppColors.onSurface,
        fontFamily: 'Roboto',
      );

  static TextStyle get body2 => const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: AppColors.onSurface,
        fontFamily: 'Roboto',
      );

  static TextStyle get caption => TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: AppColors.onSurface.withValues(alpha: 0.7),
        fontFamily: 'Roboto',
      );

  static TextStyle get button => const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: AppColors.white,
        fontFamily: 'Roboto',
      );
}
