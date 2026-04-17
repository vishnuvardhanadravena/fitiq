import 'package:fitiq/core/theame/app_colors.dart';
import 'package:fitiq/views/schedules/models/schedule_res.dart';
import 'package:fitiq/views/schedules/provider/schedule_provider.dart';
import 'package:fitiq/views/schedules/widgets/schedule_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WeekStrip extends ConsumerWidget {
  final List<WeekDay> days;
  final void Function(int date)? onDaySelected;

  const WeekStrip({super.key, required this.days, this.onDaySelected});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedDate = ref.watch(selectedDateProvider);

    return Card(
      color: ScheduleColors.surface,
      // Wrap Row in SingleChildScrollView with horizontal scrolling
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(), // Optional: nicer scrolling physics
          child: Row(
            // Use start alignment instead of spaceBetween for scrolling
            mainAxisAlignment: MainAxisAlignment.start,
            children: days.map((day) {
              final isActive = selectedDate == day.date;

              return GestureDetector(
                onTap: () {
                  ref.read(selectedDateProvider.notifier).select(day.date);
                  onDaySelected?.call(day.date);
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 8,
                  ), // a bit more margin for scrolling
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 14,
                  ),
                  decoration: BoxDecoration(
                    color: isActive
                        ? AppColors.primary
                        : AppColors.lightGrayBackground,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.1),
                        blurRadius: 6,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        day.label,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: isActive
                              ? Colors.white
                              : ScheduleColors.textSecondary,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        '${day.date}',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: isActive
                              ? Colors.white
                              : ScheduleColors.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        width: 6,
                        height: 6,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: day.hasDot
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
            }).toList(),
          ),
        ),
      ),
    );
  }
}
