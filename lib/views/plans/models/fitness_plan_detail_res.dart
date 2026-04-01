import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'fitness_plan_detail_res.freezed.dart';
part 'fitness_plan_detail_res.g.dart';

@freezed
abstract class FitnessPlanDetail with _$FitnessPlanDetail {
  const FitnessPlanDetail._();

  const factory FitnessPlanDetail({
    required int id,
    required String title,
    required String subtitle,
    required String imageUrl,
    String? badge,
    required double price,

    /// ⭐ rating section
    @Default(0.0) double rating,
    @Default(0) int reviewCount,

    /// 🧾 price note
    @Default('') String priceNote,

    /// 📊 stats
    @Default([]) List<PlanStat> stats,

    /// ✅ inclusions
    @Default([]) List<String> inclusions,

    /// 📦 phases
    @Default([]) List<ProgramPhase> phases,
  }) = _FitnessPlanDetail;

  factory FitnessPlanDetail.fromJson(Map<String, dynamic> json) =>
      _$FitnessPlanDetailFromJson(json);

  String get formattedPrice => '₹${price.toStringAsFixed(0)}';
}
@freezed
abstract class PlanStat with _$PlanStat {
  const factory PlanStat({
    required String icon, // 🔥 store icon as string from API
    required String label,
  }) = _PlanStat;

  factory PlanStat.fromJson(Map<String, dynamic> json) =>
      _$PlanStatFromJson(json);
}
@freezed
abstract class ProgramPhase with _$ProgramPhase {
  const factory ProgramPhase({
    required String weekRange,
    required String title,
    required String description,

    @Default('#2196F3') String tagColor, // 🔥 hex color from API
  }) = _ProgramPhase;

  factory ProgramPhase.fromJson(Map<String, dynamic> json) =>
      _$ProgramPhaseFromJson(json);
}
IconData mapIcon(String icon) {
  switch (icon) {
    case 'calendar':
      return Icons.calendar_today;
    case 'live':
      return Icons.live_tv;
    case 'trend':
      return Icons.trending_up;
    case 'user':
      return Icons.person;
    default:
      return Icons.circle;
  }
}
Color hexToColor(String hex) {
  return Color(int.parse(hex.replaceFirst('#', '0xff')));
}
const detailJson = {
  "id": 1,
  "title": "90 Days Total Transformation",
  "subtitle": "Trainer + Diet Plan + Weekly Check-ins",
  "imageUrl": "...",
  "badge": "Most Popular",
  "price": 4999,
  "rating": 4.9,
  "reviewCount": 240,
  "priceNote": "One-time payment or EMI options available",

  "stats": [
    {"icon": "calendar", "label": "12 Weeks"},
    {"icon": "live", "label": "36 Live Sessions"},
    {"icon": "trend", "label": "Beginner to Advanced"},
    {"icon": "user", "label": "1-on-1 Guidance"}
  ],

  "inclusions": [
    "Personalized diet chart",
    "Weekly progress tracking",
    "Access to recorded sessions"
  ],

  "phases": [
    {
      "weekRange": "Week 1-4",
      "title": "Foundation Phase",
      "description": "Build strength...",
      "tagColor": "#42A5F5"
    }
  ]
};