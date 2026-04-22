import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app_colors.dart';

/// 🔒 Always return a positive font size.
/// Uses ScreenUtil when available, otherwise falls back to the base size.
double safeSp(double size) {
  final v = size.sp;
  return (v.isFinite && v > 0) ? v : size;
}

class AppTextStyles {
  // ─────────────────────────────────────────────────────────
  // Base (keep these consistent across app)
  // ─────────────────────────────────────────────────────────

  static TextStyle heading = TextStyle(
    fontSize: safeSp(24),
    fontFamily: "Oswald",
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );

  static TextStyle title = TextStyle(
    fontSize: safeSp(18),
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  static TextStyle body = TextStyle(
    fontSize: safeSp(14),
    color: AppColors.textSecondary,
  );

  static TextStyle button = TextStyle(
    fontSize: safeSp(16),
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  // ─────────────────────────────────────────────────────────
  // Fitiq Extended Styles
  // ─────────────────────────────────────────────────────────

  static TextStyle headingLarge = TextStyle(
    fontSize: safeSp(26),
    fontFamily: "Oswald",
    fontWeight: FontWeight.w800,
    color: AppColors.textDark,
    letterSpacing: -0.5,
  );

  static TextStyle headingMedium = TextStyle(
    fontSize: safeSp(20),
    fontFamily: "Oswald",
    fontWeight: FontWeight.w700,
    color: AppColors.textDark,
  );

  static TextStyle headingSmall = TextStyle(
    fontSize: safeSp(14),
    fontFamily: "Oswald",
    fontWeight: FontWeight.w700,
    color: AppColors.textDark,
  );

  static TextStyle subheading = TextStyle(
    fontSize: safeSp(14),
    fontWeight: FontWeight.w500,
    fontFamily: "Lato",
    color: AppColors.textMuted,
  );

  static TextStyle label = TextStyle(
    fontSize: safeSp(12),
    fontWeight: FontWeight.w500,
    fontFamily: "Lato",
    color: AppColors.textDark,
    letterSpacing: 0.2,
  );

  static TextStyle bodyDark = TextStyle(
    fontSize: safeSp(14),
    fontWeight: FontWeight.w400,
    color: AppColors.textDark,
  );

  static TextStyle caption = TextStyle(
    fontSize: safeSp(12),
    fontWeight: FontWeight.w400,
    fontFamily: "Lato",
    color: AppColors.textMuted,
  );

  static TextStyle text = TextStyle(
    fontSize: safeSp(10),
    fontWeight: FontWeight.w400,
    fontFamily: "Lato",
    color: AppColors.textMuted,
  );

  static TextStyle link = TextStyle(
    fontSize: safeSp(13),
    fontWeight: FontWeight.w600,
    fontFamily: "Lato",
    color: AppColors.linkColor,
  );

  static TextStyle buttonBold = TextStyle(
    fontSize: safeSp(16),
    fontWeight: FontWeight.w700,
    color: Colors.white,
    fontFamily: "Lato",
    letterSpacing: 0.5,
  );

  // Keep these const since they don't use .sp
  static const TextStyle buttonTextStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    fontFamily: "Lato",
    color: Colors.white,
    letterSpacing: 0.5,
  );

  static const TextStyle numbersstyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    fontFamily: "Oswald",
    color: Colors.black,
    letterSpacing: 0.5,
  );
}