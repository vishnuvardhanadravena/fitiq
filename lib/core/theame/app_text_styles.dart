import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app_colors.dart';

class AppTextStyles {
  // ─── Original Styles (kept — no changes) ───────────────────────────────────

  static TextStyle heading = TextStyle(
    fontSize: 24.sp,
    fontFamily: "Oswald",
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );

  static TextStyle title = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  static TextStyle body = TextStyle(
    fontSize: 14.sp,
    color: AppColors.textSecondary,
  );

  static TextStyle button = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  // ─── Fitiq Extended Styles ──────────────────────────────────────────────────

  /// Large screen / auth page heading  e.g. "Sign In To FitIq"
  static TextStyle headingLarge = TextStyle(
    fontSize: 26.sp,
    fontFamily: "Oswald",
    fontWeight: FontWeight.w800,
    color: AppColors.textDark,
    letterSpacing: -0.5,
  );

  /// Section / card heading  e.g. "Today's Workout"
  static TextStyle headingMedium = TextStyle(
    fontSize: 20.sp,
    fontFamily: "Oswald",
    fontWeight: FontWeight.w700,
    color: AppColors.textDark,
  );
  static TextStyle headingSmall = TextStyle(
    fontSize: 14.sp,
    fontFamily: "Oswald",
    fontWeight: FontWeight.w700,
    color: AppColors.textDark,
  );

  /// Page subtitle / tagline  e.g. "Continue your wellness journey"
  static TextStyle subheading = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    fontFamily: "Lato",
    // fontWeight: FontWeight.w400,
    color: AppColors.textMuted,
  );

  /// Form field label above input
  static TextStyle label = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
    fontFamily: "Lato",
    color: AppColors.textDark,
    letterSpacing: 0.2,
  );

  /// Standard body text with dark colour
  static TextStyle bodyDark = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.textDark,
  );

  /// Small helper / hint text
  static TextStyle caption = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    fontFamily: "Lato",
    color: AppColors.textMuted,
  );
  static TextStyle text = TextStyle(
    fontSize: 10.sp,
    fontWeight: FontWeight.w400,
    fontFamily: "Lato",
    color: AppColors.textMuted,
  );

  /// Tappable link text — underlined, brand pink
  static TextStyle link = TextStyle(
    fontSize: 13.sp,
    fontWeight: FontWeight.w600,
    fontFamily: "Lato",
    color: AppColors.linkColor,
    // decoration: TextDecoration.underline,
  );

  /// CTA button label — white, bold (Fitiq variant with letter spacing)
  static TextStyle buttonBold = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w700,
    color: Colors.white,
    fontFamily: "Lato",
    letterSpacing: 0.5,
  );
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
