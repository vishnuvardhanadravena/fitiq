import 'package:fitiq/core/theame/app_colors.dart';
import 'package:fitiq/core/theame/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'schedule_colors.dart';
import 'session_thumb.dart';
import 'live_badge.dart';

class TodaySessionCard extends StatelessWidget {
  final String title;
  final String hostName;
  final String time;
  final bool isLive;
  final String? imageUrl;
  final VoidCallback? onJoinTapped;

  const TodaySessionCard({
    super.key,
    required this.title,
    required this.hostName,
    required this.time,
    required this.isLive,
    this.onJoinTapped,
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        // margin: const EdgeInsets.symmetric(horizontal: 16),
        // padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: ScheduleColors.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: ScheduleColors.border, width: 0.5),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SessionThumb(
                size: 72,
                borderRadius: 10,
                imageUrl: imageUrl ?? "",
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // title row + live badge
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            title,
                            style: AppTextStyles.headingSmall.copyWith(
                              // fontSize: 28,
                              fontWeight: FontWeight.w700,
                              color: AppColors.textPrimary,
                            ),
                          ),
                        ),
                        if (isLive) ...[
                          const SizedBox(width: 8),
                          const LiveBadge(),
                        ],
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      hostName,
                      style: const TextStyle(
                        fontSize: 12,
                        color: ScheduleColors.textSecondary,
                      ),
                    ),
                    const SizedBox(height: 10),
                    // time + join button
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          time,
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                            color: ScheduleColors.textPrimary,
                          ),
                        ),
                        GestureDetector(
                          onTap: onJoinTapped,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 9,
                            ),
                            decoration: BoxDecoration(
                              color: ScheduleColors.primary,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Text(
                              'Join',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
