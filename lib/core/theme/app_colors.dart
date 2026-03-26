import 'package:flutter/material.dart';

class AppColors {
  // Primary
  static const Color primary = Color(0xFF0DF214);
  static const Color primaryDark = Color(0xFF0BC911);
  static const Color primaryLight = Color(0xFF4CAE4F);

  // Backgrounds & Surfaces
  static const Color background = Color(0xFFF5F8F6);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color surfaceDark = Color(0xFF111811);

  // Text
  static const Color textPrimary = Color(0xFF111811);
  static const Color textSecondary = Color(0xFF608A62);
  static const Color textMuted = Color(0xFF6B7280);

  // Meal Types
  static const Color mealBreakfast = Color(0xFFFFB74D);
  static const Color mealLunch = Color(0xFF4DB6AC);
  static const Color mealDinner = Color(0xFF7986CB);
  static const Color mealSnack = Color(0xFFBA68C8);

  // Status/Semantic
  static const Color statusGood = Color(0xFF0DF214);
  static const Color statusNormal = Color(0xFFFFC107);
  static const Color statusBad = Color(0xFFFF5252);
  
  // UI Elements
  static const Color border = Color(0xFFE5E7EB);
  static const Color divider = Color(0xFFF3F4F6);

  // Badges (Rankings)
  static const Color badgeGold = Color(0xFFFFC107);
  static const Color badgeSilver = Color(0xFFC0C0C0);
  static const Color badgeBronze = Color(0xFFCD7F32);

  // Gradients
  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF0DF214), Color(0xFF0BC911)],
  );
}
