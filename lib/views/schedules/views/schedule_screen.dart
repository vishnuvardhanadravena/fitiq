import 'package:fitiq/core/theame/app_colors.dart';
import 'package:fitiq/core/theame/app_text_styles.dart';
import 'package:fitiq/views/live_session/provider/live_video_config.dart';
import 'package:fitiq/views/live_session/screens/live_video_screen.dart';
import 'package:fitiq/views/schedules/shimmer/schedule_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../provider/schedule_provider.dart';
import '../widgets/schedule_colors.dart';
import '../widgets/week_strip.dart';
import '../widgets/today_session_card.dart';
import '../widgets/upcoming_session_row.dart';
import '../widgets/past_session_row.dart';
import '../widgets/section_header.dart';

class ScheduleScreen extends ConsumerWidget {
  const ScheduleScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scheduleAsync = ref.watch(scheduleProvider);

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: scheduleAsync.when(
            loading: () => const LoadingBody(),
            error: (err, _) => _ErrorBody(
              onRetry: () => ref.read(scheduleProvider.notifier).refresh(),
            ),
            data: (schedule) {
              return Padding(
                padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 10.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: _ScheduleHeader(
                        onAddSession: () => debugPrint('Add session tapped'),
                      ),
                    ),

                    WeekStrip(
                      days: schedule.weekDays,
                      onDaySelected: (date) {
                        ref.read(selectedDateProvider.notifier).select(date);
                      },
                    ),

                    // const Divider(
                    //   height: 0.5,
                    //   thickness: 0.5,
                    //   color: ScheduleColors.border,
                    // ),
                    _ScheduleBody(),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class _ScheduleHeader extends StatelessWidget {
  final VoidCallback? onAddSession;

  const _ScheduleHeader({this.onAddSession});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'My Schedule',
                style: AppTextStyles.heading.copyWith(
                  // fontSize: 28,
                  fontWeight: FontWeight.w700,
                  color: AppColors.primaryColor,
                ),
                //  TextStyle(
                //   fontSize: 22,
                //   fontWeight: FontWeight.w700,
                //   color: AppColors.primaryColor,
                // ),
              ),
              const SizedBox(height: 2),
              const Text(
                'Stay consistent. Never miss a session.',
                style: TextStyle(
                  fontSize: 12,
                  color: ScheduleColors.textSecondary,
                ),
              ),
            ],
          ),
        ),
        TextButton.icon(
          onPressed: onAddSession,
          icon: const Icon(Icons.add, size: 16, color: ScheduleColors.primary),
          label: const Text(
            'Add Session',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: ScheduleColors.primary,
            ),
          ),
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          ),
        ),
      ],
    );
  }
}

class _ScheduleBody extends ConsumerWidget {
  const _ScheduleBody();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final today = ref.watch(todaySessionProvider);
    final upcoming = ref.watch(upcomingSessionsProvider);
    final past = ref.watch(pastSessionsProvider);

    final selectedDate = ref.watch(selectedDateProvider);
    final schedule = ref.watch(scheduleProvider).value;
    final todayDate = schedule?.todaySession.dayNumber;

    final isTodaySelected = selectedDate == null || selectedDate == todayDate;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (isTodaySelected && today != null) ...[
          SizedBox(height: 10.h),
          const SectionHeader(title: 'Today'),
          TodaySessionCard(
            title: today.title,
            hostName: today.hostName,
            time: today.time,
            isLive: today.isLive,
            imageUrl: today.imageUrl,
            onJoinTapped: () => debugPrint('Join: ${today.id}'),
          ),
          const SizedBox(height: 16),
        ],

        if (upcoming.isNotEmpty) ...[
          const SectionHeader(title: 'Upcoming'),
          ...upcoming.map(
            (s) => UpcomingSessionRow(
              dayLabel: s.dayLabel,
              dayNumber: s.dayNumber,
              title: s.title,
              hostName: s.hostName,
              imageUrl: s.imageUrl,
              onNotifyTapped: () => debugPrint('Notify: ${s.id}'),
            ),
          ),
          const SizedBox(height: 16),
        ],

        if (past.isNotEmpty) ...[
          const SectionHeader(title: 'Past Sessions'),
          ...past.map(
            (s) => Padding(
              padding: const EdgeInsets.all(2.0),
              child: PastSessionRow(
                dayLabel: s.dayLabel,
                dayNumber: s.dayNumber,
                title: s.title,
                hostName: s.hostName,
                imageUrl: s.imageUrl,
                onPlayTapped: () => LiveVideoScreen.show(
                  context,
                  config: LiveVideoConfig(
                    title: 'Morning Fat Burn Yoga',
                    hostName: 'Ananya Sharma',
                    viewerCount: 124,
                    isLive: false,
                    videoUrl: 'https://www.pexels.com/download/video/7710535/',
                    thumbnailUrl:
                        'https://images.unsplash.com/photo-1554284126-0a35f9d6c245?auto=format&fit=crop&w=400&q=80',
                  ),
                
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
        ],

        if (!isTodaySelected && upcoming.isEmpty && past.isEmpty) ...[
          const SizedBox(height: 40),
          const Center(
            child: Text(
              'No sessions for this day',
              style: TextStyle(
                fontSize: 14,
                color: ScheduleColors.textSecondary,
              ),
            ),
          ),
        ],
      ],
    );
  }
}



class _ErrorBody extends StatelessWidget {
  final VoidCallback onRetry;

  const _ErrorBody({required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.error_outline_rounded,
              color: ScheduleColors.primary,
              size: 44,
            ),
            const SizedBox(height: 12),
            const Text(
              'Failed to load your schedule.\nPlease try again.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: ScheduleColors.textSecondary,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: onRetry,
              style: ElevatedButton.styleFrom(
                backgroundColor: ScheduleColors.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 28,
                  vertical: 12,
                ),
              ),
              child: const Text(
                'Retry',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _WeekStripSkeleton extends StatelessWidget {
  const _WeekStripSkeleton();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ScheduleColors.surface,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(6, (_) {
          return Column(
            children: [
              _bone(width: 20, height: 10),
              const SizedBox(height: 6),
              _bone(width: 32, height: 32, radius: 16),
              const SizedBox(height: 6),
              _bone(width: 5, height: 5, radius: 2.5),
            ],
          );
        }),
      ),
    );
  }

  Widget _bone({
    required double width,
    required double height,
    double radius = 4,
  }) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: ScheduleColors.border,
        borderRadius: BorderRadius.circular(radius),
      ),
    );
  }
}
