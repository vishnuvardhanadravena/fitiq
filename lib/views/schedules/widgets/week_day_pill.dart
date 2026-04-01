import 'package:fitiq/views/schedules/widgets/schedule_colors.dart';
import 'package:flutter/material.dart';

class WeekDayPill extends StatelessWidget {
  final String label;
  final int date;
  final bool isActive;
  final bool hasDot;
  final VoidCallback? onTap;

  const WeekDayPill({
    super.key,
    required this.label,
    required this.date,
    required this.isActive,
    required this.hasDot,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16), // pill shape
        margin: const EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
          color: isActive ? ScheduleColors.primaryPink : ScheduleColors.surface,
          borderRadius: BorderRadius.circular(20), // more pill shape, not circle
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: isActive
                    ? Colors.white
                    : ScheduleColors.textSecondary,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              '$date',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: isActive
                    ? Colors.white
                    : ScheduleColors.textPrimary,
              ),
            ),
            const SizedBox(height: 6),
            Container(
              width: 6,
              height: 6,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: hasDot
                    ? (isActive
                        ? ScheduleColors.primaryBlue
                        : ScheduleColors.border)
                    : Colors.transparent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}