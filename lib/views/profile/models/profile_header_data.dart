import 'package:flutter/material.dart';

class ProfileHeaderData {
  final String name;
  final String subtitle; // e.g. "Active Member • 90 Days Program"
  final String? avatarUrl;
  final ImageProvider? avatarImage;
  final String editButtonLabel;
  final List<ProfileStat> stats;

  // Gradient customisation
  final List<Color> gradientColors;
  final AlignmentGeometry gradientBegin;
  final AlignmentGeometry gradientEnd;

  const ProfileHeaderData({
    required this.name,
    required this.subtitle,
    this.avatarUrl,
    this.avatarImage,
    this.editButtonLabel = 'Edit Profile',
    required this.stats,
    this.gradientColors = const [Color(0xFF4A90E2), Color(0xFF1A3A8F)],
    this.gradientBegin = Alignment.topCenter,
    this.gradientEnd = Alignment.bottomCenter,
  });
}

class ProfileStat {
  final String value;
  final String label;

  const ProfileStat({required this.value, required this.label});
}