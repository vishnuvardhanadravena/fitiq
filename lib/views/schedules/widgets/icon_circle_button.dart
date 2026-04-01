import 'package:flutter/material.dart';
import 'schedule_colors.dart';

class IconCircleButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onTap;
  final Color backgroundColor;
  final Color iconColor;
  final double size;

  const IconCircleButton({
    super.key,
    required this.icon,
    this.onTap,
    this.backgroundColor = ScheduleColors.accentLight,
    this.iconColor = ScheduleColors.accent,
    this.size = 34,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: backgroundColor,
        ),
        child: Icon(icon, color: iconColor, size: size * 0.45),
      ),
    );
  }
}
