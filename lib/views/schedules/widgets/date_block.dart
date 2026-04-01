import 'package:flutter/material.dart';
import 'schedule_colors.dart';

class DateBlock extends StatelessWidget {
  final String dayLabel;
  final int dayNumber;

  const DateBlock({
    super.key,
    required this.dayLabel,
    required this.dayNumber,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 30,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            dayLabel,
            style: const TextStyle(
              fontSize: 10,
              color: ScheduleColors.textSecondary,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            '$dayNumber',
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: ScheduleColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
