import 'package:flutter/material.dart';
import 'schedule_colors.dart';
import 'date_block.dart';
import 'session_thumb.dart';
import 'icon_circle_button.dart';

class PastSessionRow extends StatelessWidget {
  final String dayLabel;
  final int dayNumber;
  final String title;
  final String hostName;
  final String? imageUrl;
  final VoidCallback? onPlayTapped;

  const PastSessionRow({
    super.key,
    required this.dayLabel,
    required this.dayNumber,
    required this.title,
    required this.hostName,
    this.onPlayTapped,
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ScheduleColors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: ScheduleColors.border, width: 0.5),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            DateBlock(dayLabel: dayLabel, dayNumber: dayNumber),
            const SizedBox(width: 10),
            SessionThumb(size: 52, borderRadius: 8, imageUrl: imageUrl ?? ""),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      color: ScheduleColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    hostName,
                    style: const TextStyle(
                      fontSize: 11,
                      color: ScheduleColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
            IconCircleButton(
              icon: Icons.play_arrow_rounded,
              onTap: onPlayTapped,
            ),
          ],
        ),
      ),
    );
  }
}
