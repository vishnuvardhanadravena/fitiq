import 'package:flutter/material.dart';
import 'schedule_colors.dart';

class LiveBadge extends StatelessWidget {
  const LiveBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: ScheduleColors.primaryLight,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: ScheduleColors.primary.withOpacity(0.3),
        ),
      ),
      child: const Text(
        'Live',
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w700,
          color: ScheduleColors.primaryDark,
        ),
      ),
    );
  }
}
