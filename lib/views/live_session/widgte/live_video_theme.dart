import 'package:flutter/material.dart';

class LiveVideoTheme {
  // Colors
  static const Color primaryPink = Color(0xFFE91E8C);
  static const Color accentBlue = Color(0xFF2196F3);
  static const Color liveRed = Color(0xFFE53935);
  static const Color darkOverlay = Color(0xCC000000);
  static const Color chatBg = Color(0xFFFFFFFF);
  static const Color iconBarBg = Color(0xFFF5F5F5);
  static const Color progressBlue = Color(0xFF1565C0);
  static const Color textDark = Color(0xFF1A1A1A);
  static const Color textGrey = Color(0xFF757575);
  static const Color inputBorder = Color(0xFFE0E0E0);

  // Text styles
  static const TextStyle titleStyle = TextStyle(
    color: Colors.white,
    fontSize: 18,
    fontWeight: FontWeight.bold,
    letterSpacing: 0.3,
  );

  static const TextStyle subtitleStyle = TextStyle(
    color: Colors.white70,
    fontSize: 13,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle chatNameStyle = TextStyle(
    color: textDark,
    fontSize: 13,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle chatMessageStyle = TextStyle(
    color: textDark,
    fontSize: 13,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle viewerCountStyle = TextStyle(
    color: Colors.white,
    fontSize: 12,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle liveTagStyle = TextStyle(
    color: Colors.white,
    fontSize: 11,
    fontWeight: FontWeight.bold,
    letterSpacing: 1.2,
  );

  static const TextStyle sectionHeaderStyle = TextStyle(
    color: textDark,
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle viewAllStyle = TextStyle(
    color: accentBlue,
    fontSize: 13,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle timestampStyle = TextStyle(
    color: Colors.white,
    fontSize: 12,
    fontWeight: FontWeight.w500,
  );
}