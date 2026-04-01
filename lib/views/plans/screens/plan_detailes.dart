import 'package:fitiq/core/theame/app_text_styles.dart';
import 'package:fitiq/routes/route_constants.dart';
import 'package:fitiq/views/plans/models/fitness_plan_detail_res.dart';
import 'package:fitiq/views/plans/provider/firness_plan_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';

final expandedPhasesProvider =
    StateNotifierProvider<ExpandedPhasesNotifier, Set<int>>(
      (ref) => ExpandedPhasesNotifier(),
    );

class ExpandedPhasesNotifier extends StateNotifier<Set<int>> {
  ExpandedPhasesNotifier() : super({0}); // first one open by default

  void toggle(int index) {
    final next = Set<int>.from(state);
    if (next.contains(index)) {
      next.remove(index);
    } else {
      next.add(index);
    }
    state = next;
  }
}

class FitnessPlanDetailScreen extends ConsumerWidget {
  final String planId;

  const FitnessPlanDetailScreen({super.key, required this.planId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final planAsync = ref.watch(fitnessPlanByIdProvider(planId));
    return planAsync.when(
      loading: () =>
          const Scaffold(body: HomeSkeleton()), // show skeleton while loading

      error: (err, _) => Scaffold(body: Center(child: Text(err.toString()))),

      data: (plan) {
        return Scaffold(
          backgroundColor: const Color(0xFFF5F6FA),
          body: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  // physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _FeaturedCard(plan: plan),
                      SizedBox(height: 16.h),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: _WhatsIncluded(inclusions: plan.inclusions),
                      ),
                      const SizedBox(height: 16),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: _ProgramBreakdown(phases: plan.phases, ref: ref),
                      ),
                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ),
              _BottomBar(plan: plan),
            ],
          ),
        );
      },
    );
  }
}

class _FeaturedCard extends StatelessWidget {
  final FitnessPlanDetail plan;

  const _FeaturedCard({required this.plan});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 0.35;

    return SizedBox(
      height: height + 90,

      child: Stack(
        clipBehavior: Clip.none,

        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(24),
              bottomRight: Radius.circular(24),
            ),
            child: SizedBox(
              height: height,
              width: double.infinity,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: CachedNetworkImage(
                      imageUrl: plan.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),

                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.centerRight,
                          end: Alignment.centerLeft,
                          colors: [
                            Colors.black.withOpacity(0.3),
                            Colors.black.withOpacity(0.75),
                          ],
                        ),
                      ),
                    ),
                  ),

                  /// 🔥 CONTENT
                  Positioned.fill(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 20,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Spacer(),

                          if (plan.badge != null)
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.orange,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                plan.badge!,
                                style: AppTextStyles.label.copyWith(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),

                          const SizedBox(height: 10),

                          Text(
                            plan.title,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: AppTextStyles.headingLarge.copyWith(
                              color: Colors.white,
                            ),
                          ),

                          const SizedBox(height: 6),

                          Text(
                            plan.subtitle,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: AppTextStyles.label.copyWith(
                              color: Colors.white.withOpacity(0.85),
                              fontSize: 13,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Row(
                            children: [
                              const Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 16,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                '${plan.rating} (${plan.reviewCount} Reviews)',
                                style: AppTextStyles.label.copyWith(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Spacer(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          /// 🔥 STATS CARD INSIDE STACK
          Positioned(
            left: 16,
            right: 16,
            bottom: 0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: _StatsCard(plan: plan),
            ),
          ),
        ],
      ),
    );
  }
}

class _StatsCard extends StatelessWidget {
  final FitnessPlanDetail plan;

  const _StatsCard({required this.plan});

  @override
  Widget build(BuildContext context) {
    final stats = plan.stats;

    // Split into 2 columns
    final left = <Widget>[];
    final right = <Widget>[];

    for (int i = 0; i < stats.length; i++) {
      final stat = stats[i];
      final widget = _StatItem(stat: stat);

      if (i.isEven) {
        left.add(widget);
      } else {
        right.add(widget);
      }
    }

    return Container(
      height: MediaQuery.of(context).size.height * 0.17,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
      ),

      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// LEFT COLUMN
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: _withSpacing(left),
            ),
          ),

          const SizedBox(width: 12),

          /// RIGHT COLUMN
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: _withSpacing(right),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _withSpacing(List<Widget> items) {
    var spacing = 20.0.sp;

    return List.generate(items.length, (index) {
      return Padding(
        padding: EdgeInsets.only(
          bottom: index == items.length - 1 ? 0 : spacing,
        ),
        child: items[index],
      );
    });
  }
}

class _StatItem extends StatelessWidget {
  final dynamic stat;

  const _StatItem({required this.stat});

  @override
  Widget build(BuildContext context) {
    final iconData = mapIcon(stat.icon);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        /// Icon
        Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.08),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(iconData, size: 18, color: Colors.black87),
        ),

        const SizedBox(width: 10),

        /// Text
        Expanded(
          child: Text(
            stat.label,
            style: AppTextStyles.label.copyWith(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

class _WhatsIncluded extends StatelessWidget {
  final List<String> inclusions;

  const _WhatsIncluded({required this.inclusions});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "What's Included",
            style: AppTextStyles.headingMedium.copyWith(
              color: const Color(0xFF1A1A2E),
              fontFamily: 'Oswald',
            ),
          ),
          const SizedBox(height: 12),
          ...inclusions.map(
            (item) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.check_circle,
                    color: Color(0xFF2196F3),
                    size: 18,
                  ),
                  const SizedBox(width: 10),
                  Expanded(child: Text(item, style: AppTextStyles.body)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ProgramBreakdown extends ConsumerWidget {
  final List<ProgramPhase> phases;
  final WidgetRef ref;

  const _ProgramBreakdown({required this.phases, required this.ref});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final expanded = ref.watch(expandedPhasesProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Program Breakdown',
          style: AppTextStyles.headingMedium.copyWith(
            color: const Color(0xFF1A1A2E),
            fontFamily: 'Oswald',
          ),
        ),
        const SizedBox(height: 12),

        ...List.generate(phases.length, (index) {
          final phase = phases[index];
          final isOpen = expanded.contains(index);

          /// 🔥 FIX: convert once (clean)
          final tagColor = hexToColor(phase.tagColor);

          return Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: GestureDetector(
              onTap: () =>
                  ref.read(expandedPhasesProvider.notifier).toggle(index),

              child: AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                curve: Curves.easeInOut,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.06),
                      blurRadius: 8,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),

                child: Padding(
                  padding: const EdgeInsets.all(14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          /// 🔥 Colored week tag
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: tagColor.withOpacity(0.12), // ✅ FIX
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: tagColor.withOpacity(0.4), // ✅ FIX
                              ),
                            ),
                            child: Text(
                              phase.weekRange,
                              style: AppTextStyles.label.copyWith(
                                color: tagColor, // ✅ FIX
                                fontWeight: FontWeight.w700,
                                fontSize: 11,
                              ),
                            ),
                          ),

                          const SizedBox(width: 10),

                          /// Phase title
                          Expanded(
                            child: Text(
                              phase.title,
                              style: AppTextStyles.headingSmall.copyWith(
                                color: const Color(0xFF1A1A2E),
                                fontSize: 14,
                              ),
                            ),
                          ),

                          /// Chevron
                          AnimatedRotation(
                            turns: isOpen ? 0.5 : 0,
                            duration: const Duration(milliseconds: 250),
                            child: const Icon(
                              Icons.keyboard_arrow_down,
                              color: Colors.grey,
                              size: 20,
                            ),
                          ),
                        ],
                      ),

                      /// Description
                      AnimatedCrossFade(
                        duration: const Duration(milliseconds: 250),
                        crossFadeState: isOpen
                            ? CrossFadeState.showSecond
                            : CrossFadeState.showFirst,
                        firstChild: const SizedBox.shrink(),
                        secondChild: Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text(
                            phase.description,
                            style: AppTextStyles.body.copyWith(
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }),
      ],
    );
  }
}

class _BottomBar extends StatelessWidget {
  final FitnessPlanDetail plan;

  const _BottomBar({required this.plan});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 12,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: Row(
        children: [
          // Price + note
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                plan.formattedPrice,
                style: AppTextStyles.headingMedium.copyWith(
                  color: const Color(0xFF1A1A2E),
                  fontSize: 22,
                  fontFamily: 'Oswald',
                ),
              ),
              Text(
                plan.priceNote,
                style: AppTextStyles.label.copyWith(
                  color: Colors.grey.shade500,
                  fontSize: 11,
                ),
              ),
            ],
          ),

          const Spacer(),

          // Enroll Now button
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              gradient: const LinearGradient(
                colors: [Color(0xFFFF416C), Color(0xFFFF4B2B)],
              ),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFFFF416C).withOpacity(0.4),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: ElevatedButton(
              onPressed: () {
                context.push(RouteList.paymentsuccess);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
                padding: EdgeInsets.all(8.0.sp),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              child: Text(
                'Enroll Now',
                style: AppTextStyles.buttonTextStyle.copyWith(
                  fontSize: 15,
                  letterSpacing: 0.5,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HomeSkeleton extends StatelessWidget {
  const HomeSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 0.35;

    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.white,

      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// FEATURED CARD
            SizedBox(
              height: height + 90,
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(24),
                      bottomRight: Radius.circular(24),
                    ),
                    child: shimmerBox(
                      height: height,
                      width: double.infinity,
                      radius: 0,
                    ),
                  ),

                  Positioned(
                    left: 16,
                    right: 16,
                    bottom: 0,
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: _StatsCardShimmer(),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            /// WHATS INCLUDED
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    shimmerBox(height: 18, width: 150),
                    const SizedBox(height: 12),

                    ...List.generate(3, (index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Row(
                          children: [
                            shimmerBox(height: 18, width: 18),
                            const SizedBox(width: 10),
                            Expanded(child: shimmerBox(height: 12)),
                          ],
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),

            /// PROGRAM BREAKDOWN
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  shimmerBox(height: 18, width: 180),
                  const SizedBox(height: 12),

                  ...List.generate(5, (index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Container(
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: Colors.white,
                        ),
                        child: Row(
                          children: [
                            shimmerBox(height: 20, width: 60, radius: 20),
                            const SizedBox(width: 10),
                            Expanded(child: shimmerBox(height: 14)),
                            shimmerBox(height: 16, width: 16),
                          ],
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

Widget shimmerBox({double? height, double? width, double radius = 8}) {
  return Container(
    height: height,
    width: width,
    decoration: BoxDecoration(
      color: Colors.grey,
      borderRadius: BorderRadius.circular(radius),
    ),
  );
}

class _StatsCardShimmer extends StatelessWidget {
  const _StatsCardShimmer();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.17,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: const Color.fromARGB(255, 163, 42, 42),
      ),

      child: Row(
        children: [
          Expanded(child: _column()),
          const SizedBox(width: 12),
          Expanded(child: _column()),
        ],
      ),
    );
  }

  Widget _column() {
    return Column(children: [_item(), const SizedBox(height: 20), _item()]);
  }

  Widget _item() {
    return Row(
      children: [
        shimmerBox(height: 36, width: 36, radius: 10),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              shimmerBox(height: 10),
              const SizedBox(height: 6),
              shimmerBox(height: 10, width: 80),
            ],
          ),
        ),
      ],
    );
  }
}
