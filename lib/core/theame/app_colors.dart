import 'package:flutter/material.dart';

class AppColors {
  // ─── Primary Gradient (original) ───────────────────────────────────────────
  static const Color primaryStart = Color(0xFF4A90E2);
  static const Color primaryEnd = Color(0xFF6A5AE0);

  // ─── Fitiq Brand Primary ────────────────────────────────────────────────────
  static const Color primary = Color(0xFFE8175D); // hot-pink CTA
  static const Color primaryDark = Color(0xFFBD1570); // pressed / dark variant

  // ─── Accent ─────────────────────────────────────────────────────────────────
  /// Original CTA red accent — kept for backward compatibility
  static const Color accent = Color(0xFFFF2D55);

  /// Fitiq cyan accent (logo / input active border)
  static const Color accentCyan = Color(0xFF00AEEF);

  /// Fitiq orange accent (logo secondary)
  static const Color accentOrange = Color(0xFFFF6B35);

  // ─── Backgrounds ────────────────────────────────────────────────────────────
  static const Color background = Color(0xFFF5F7FB); // original (kept)
  static const Color backgroundAlt = Color(0xFFF5F5F5); // Fitiq light grey bg
  static const Color surface = Color(0xFFFFFFFF); // card / sheet surface
  static const Color white = Colors.white;
  static const Color black = Colors.black;

  // ─── Input / Form ───────────────────────────────────────────────────────────
  static const Color inputFill =
      Color.fromARGB(26, 146, 195, 210); // inactive field fill
  static const Color inputBorder = Color(0xFF00AEEF); // focused field border

  // ─── Text ───────────────────────────────────────────────────────────────────
  static const Color textPrimary = Colors.black; // original (kept)
  static const Color textDark = Color(0xFF1A1A2E); // Fitiq deep navy text
  static const Color textSecondary = Color(0xFF6E6E73); // original (kept)
  static const Color textMuted = Color(0xFF888888); // Fitiq lighter muted

  // ─── Link ───────────────────────────────────────────────────────────────────
  static const Color linkColor = Color(0xFFE91E8C); // matches primary

  // ─── Border / Divider ───────────────────────────────────────────────────────
  static const Color border = Color(0xFFE5E5EA); // original (kept)
  static const Color divider = Color(0xFFE0E0E0); // Fitiq divider
  static const Color socialBorder =
      Color.fromARGB(255, 126, 126, 126); // social button border

  // ─── Icon ───────────────────────────────────────────────────────────────────
  static const Color iconTint = Color(0xFF999999); // default icon grey

  // ─── Semantic ───────────────────────────────────────────────────────────────
  static const Color success = Colors.green; // original (kept)
  static const Color successAlt = Color(0xFF388E3C); // Fitiq material green
  static const Color error = Colors.red; // original (kept)
  static const Color errorAlt = Color(0xFFD32F2F); // Fitiq material red
}
