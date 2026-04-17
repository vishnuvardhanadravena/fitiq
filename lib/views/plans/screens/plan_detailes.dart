import 'package:fitiq/core/theame/app_text_styles.dart';
import 'package:fitiq/core/widgets/blue_container_wraper.dart';
import 'package:fitiq/routes/route_constants.dart';
import 'package:fitiq/views/plans/models/fitness_plan_detail_res.dart';
import 'package:fitiq/views/plans/provider/firness_plan_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';

class Responsive {
  final double width;
  final double height;

  const Responsive({required this.width, required this.height});

  bool get isTablet => width >= 600;

  // Hero image height: 40% on mobile, 45% on tablet
  double get heroHeight => isTablet ? height * 0.45 : height * 0.38;

  // Stats card height: slightly taller on tablet
  double get statsCardHeight => isTablet ? height * 0.18 : height * 0.17;

  // Horizontal padding: more breathing room on tablet
  double get hPad => isTablet ? width * 0.06 : 16.0;

  // Card border radius scales with screen
  double get cardRadius => isTablet ? 20.0 : 14.0;

  // Hero card overlap bottom space
  double get heroOverlap => isTablet ? 110.0 : 90.0;

  // Stat icon size
  double get statIconSize => isTablet ? 42.0 : 36.0;

  // Font scale factor
  double get fontScale => isTablet ? 1.15 : 1.0;

  // Bottom bar height
  double get bottomBarVPad => isTablet ? 18.0 : 14.0;

  // Grid columns for stats: 3 on wide tablet, 2 otherwise
  int get statColumns => width >= 840 ? 3 : 2;
}

final expandedPhasesProvider =
    StateNotifierProvider<ExpandedPhasesNotifier, Set<int>>(
      (ref) => ExpandedPhasesNotifier(),
    );

class ExpandedPhasesNotifier extends StateNotifier<Set<int>> {
  ExpandedPhasesNotifier() : super({0});

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
      loading: () => const Scaffold(body: HomeSkeleton()),
      error: (err, _) => Scaffold(body: Center(child: Text(err.toString()))),
      data: (plan) {
        return LayoutBuilder(
          builder: (context, constraints) {
            final size = MediaQuery.of(context).size;
            final r = Responsive(
              width: constraints.maxWidth,
              height: size.height,
            );

            return SafeArea(
              top: false,
              child: Scaffold(
                backgroundColor: const Color(0xFFF5F6FA),
                body: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _FeaturedCard(plan: plan, r: r),
                            SizedBox(height: r.isTablet ? 20 : 16),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: r.hPad),
                              child: r.isTablet
                                  ? Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          flex: 5,
                                          child: WhatsIncluded(
                                            inclusions: plan.inclusions,
                                            r: r,
                                          ),
                                        ),
                                        SizedBox(width: r.hPad),
                                        Expanded(
                                          flex: 7,
                                          child: _ProgramBreakdown(
                                            phases: plan.phases,
                                            r: r,
                                          ),
                                        ),
                                      ],
                                    )
                                  : Column(
                                      children: [
                                        WhatsIncluded(
                                          inclusions: plan.inclusions,
                                          r: r,
                                        ),
                                        const SizedBox(height: 16),
                                        _ProgramBreakdown(
                                          phases: plan.phases,
                                          r: r,
                                        ),
                                      ],
                                    ),
                            ),
                            SizedBox(height: r.isTablet ? 32 : 24),
                          ],
                        ),
                      ),
                    ),
                    _BottomBar(plan: plan, r: r),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class _FeaturedCard extends StatelessWidget {
  final FitnessPlanDetail plan;
  final Responsive r;

  const _FeaturedCard({required this.plan, required this.r});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: r.heroHeight + r.heroOverlap,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Hero image with overlay
          ClipRRect(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(r.isTablet ? 32 : 24),
              bottomRight: Radius.circular(r.isTablet ? 32 : 24),
            ),
            child: SizedBox(
              height: r.heroHeight,
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
                    child: BackgroundContainer(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(r.isTablet ? 32 : 24),
                        bottomRight: Radius.circular(r.isTablet ? 32 : 24),
                      ),
                      gradient: LinearGradient(
                        begin: Alignment.centerRight,
                        end: Alignment.centerLeft,
                        colors: [
                          Colors.black.withValues(alpha: 0.3),
                          Colors.black.withValues(alpha: 0.75),
                        ],
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: r.hPad,
                        vertical: r.isTablet ? 28 : 20,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Spacer(),
                          if (plan.badge != null)
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: r.isTablet ? 14 : 10,
                                vertical: r.isTablet ? 6 : 4,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.orange,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                plan.badge!,
                                style: AppTextStyles.label.copyWith(
                                  color: Colors.white,
                                  fontSize: r.isTablet ? 12 : 10,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          SizedBox(height: r.isTablet ? 12 : 10),
                          Text(
                            plan.title,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: AppTextStyles.headingLarge.copyWith(
                              color: Colors.white,
                              fontSize: r.isTablet ? 30 : null,
                            ),
                          ),
                          SizedBox(height: r.isTablet ? 8 : 6),
                          Text(
                            plan.subtitle,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: AppTextStyles.label.copyWith(
                              color: Colors.white.withValues(alpha: 0.85),
                              fontSize: r.isTablet ? 15 : 13,
                            ),
                          ),
                          SizedBox(height: r.isTablet ? 8 : 6),
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: r.isTablet ? 20 : 16,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                '${plan.rating} (${plan.reviewCount} Reviews)',
                                style: AppTextStyles.label.copyWith(
                                  color: Colors.white,
                                  fontSize: r.isTablet ? 14 : 12,
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Stats card overlapping the hero
          Positioned(
            left: r.hPad,
            right: r.hPad,
            bottom: 0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: _StatsCard(plan: plan, r: r),
            ),
          ),
        ],
      ),
    );
  }
}

class _StatsCard extends StatelessWidget {
  final FitnessPlanDetail plan;
  final Responsive r;

  const _StatsCard({required this.plan, required this.r});

  @override
  Widget build(BuildContext context) {
    final stats = plan.stats;
    final columns = r.statColumns;

    // Build rows dynamically based on column count
    final List<List<dynamic>> rows = [];
    for (int i = 0; i < stats.length; i += columns) {
      rows.add(stats.sublist(i, (i + columns).clamp(0, stats.length)));
    }

    return Container(
      padding: EdgeInsets.all(r.isTablet ? 20 : 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(r.isTablet ? 20 : 16),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: rows.map((rowItems) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: Row(
              children: rowItems.map((stat) {
                return Expanded(
                  child: _StatItem(stat: stat, r: r),
                );
              }).toList(),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final dynamic stat;
  final Responsive r;

  const _StatItem({required this.stat, required this.r});

  @override
  Widget build(BuildContext context) {
    final iconData = mapIcon(stat.icon);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: r.statIconSize,
          height: r.statIconSize,
          decoration: BoxDecoration(
            color: Colors.black.withValues(alpha: 0.08),
            borderRadius: BorderRadius.circular(r.isTablet ? 12 : 10),
          ),
          child: Icon(
            iconData,
            size: r.isTablet ? 22 : 18,
            color: Colors.black87,
          ),
        ),
        SizedBox(width: r.isTablet ? 12 : 10),
        Expanded(
          child: Text(
            stat.label,
            style: AppTextStyles.label.copyWith(
              fontSize: r.isTablet ? 13 : 12,
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

class WhatsIncluded extends StatelessWidget {
  final List<String> inclusions;
  final Responsive r;

  const WhatsIncluded({super.key, required this.inclusions, required this.r});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(r.isTablet ? 20 : 16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: EdgeInsets.all(r.isTablet ? 20 : 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "What's Included",
            style: AppTextStyles.headingMedium.copyWith(
              color: const Color(0xFF1A1A2E),
              fontFamily: 'Oswald',
              fontSize: r.isTablet ? 20 : null,
            ),
          ),
          SizedBox(height: r.isTablet ? 16 : 12),
          ...inclusions.map(
            (item) => Padding(
              padding: EdgeInsets.only(bottom: r.isTablet ? 14 : 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.check_circle,
                    color: const Color(0xFF2196F3),
                    size: r.isTablet ? 22 : 18,
                  ),
                  SizedBox(width: r.isTablet ? 12 : 10),
                  Expanded(
                    child: Text(
                      item,
                      style: AppTextStyles.body.copyWith(
                        fontSize: r.isTablet ? 15 : null,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Program Breakdown ────────────────────────────────────────────────────────

class _ProgramBreakdown extends ConsumerWidget {
  final List<ProgramPhase> phases;
  final Responsive r;

  const _ProgramBreakdown({required this.phases, required this.r});

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
            fontSize: r.isTablet ? 20 : null,
          ),
        ),
        SizedBox(height: r.isTablet ? 16 : 12),
        ...List.generate(phases.length, (index) {
          final phase = phases[index];
          final isOpen = expanded.contains(index);
          final tagColor = hexToColor(phase.tagColor);

          return Padding(
            padding: EdgeInsets.only(bottom: r.isTablet ? 14 : 10),
            child: GestureDetector(
              onTap: () =>
                  ref.read(expandedPhasesProvider.notifier).toggle(index),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                curve: Curves.easeInOut,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(r.cardRadius),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.06),
                      blurRadius: 8,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.all(r.isTablet ? 18 : 14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: r.isTablet ? 14 : 10,
                              vertical: r.isTablet ? 6 : 4,
                            ),
                            decoration: BoxDecoration(
                              color: tagColor.withValues(alpha: 0.12),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: tagColor.withValues(alpha: 0.4),
                              ),
                            ),
                            child: Text(
                              phase.weekRange,
                              style: AppTextStyles.label.copyWith(
                                color: tagColor,
                                fontWeight: FontWeight.w700,
                                fontSize: r.isTablet ? 13 : 11,
                              ),
                            ),
                          ),
                          SizedBox(width: r.isTablet ? 14 : 10),
                          Expanded(
                            child: Text(
                              phase.title,
                              style: AppTextStyles.headingSmall.copyWith(
                                color: const Color(0xFF1A1A2E),
                                fontSize: r.isTablet ? 16 : 14,
                              ),
                            ),
                          ),
                          AnimatedRotation(
                            turns: isOpen ? 0.5 : 0,
                            duration: const Duration(milliseconds: 250),
                            child: Icon(
                              Icons.keyboard_arrow_down,
                              color: Colors.grey,
                              size: r.isTablet ? 24 : 20,
                            ),
                          ),
                        ],
                      ),
                      AnimatedCrossFade(
                        duration: const Duration(milliseconds: 250),
                        crossFadeState: isOpen
                            ? CrossFadeState.showSecond
                            : CrossFadeState.showFirst,
                        firstChild: const SizedBox.shrink(),
                        secondChild: Padding(
                          padding: EdgeInsets.only(top: r.isTablet ? 14 : 10),
                          child: Text(
                            phase.description,
                            style: AppTextStyles.body.copyWith(
                              color: Colors.grey.shade600,
                              fontSize: r.isTablet ? 15 : null,
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

// ─── Bottom Bar ───────────────────────────────────────────────────────────────

class _BottomBar extends StatelessWidget {
  final FitnessPlanDetail plan;
  final Responsive r;

  const _BottomBar({required this.plan, required this.r});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: r.isTablet ? r.hPad : 20,
        vertical: r.bottomBarVPad,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 12,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                plan.formattedPrice,
                style: AppTextStyles.headingMedium.copyWith(
                  color: const Color(0xFF1A1A2E),
                  fontSize: r.isTablet ? 28 : 22,
                  fontFamily: 'Oswald',
                ),
              ),
              Text(
                plan.priceNote,
                style: AppTextStyles.label.copyWith(
                  color: Colors.grey.shade500,
                  fontSize: r.isTablet ? 13 : 11,
                ),
              ),
            ],
          ),
          const Spacer(),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(r.isTablet ? 18 : 14),
              gradient: const LinearGradient(
                colors: [Color(0xFFFF416C), Color(0xFFFF4B2B)],
              ),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFFFF416C).withValues(alpha: 0.4),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: ElevatedButton(
              onPressed: () => context.push(RouteList.paymentsuccess),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
                padding: EdgeInsets.symmetric(
                  horizontal: r.isTablet ? 32 : 20,
                  vertical: r.isTablet ? 16 : 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(r.isTablet ? 18 : 14),
                ),
              ),
              child: Text(
                'Enroll Now',
                style: AppTextStyles.buttonTextStyle.copyWith(
                  fontSize: r.isTablet ? 17 : 15,
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

// ─── Skeleton ─────────────────────────────────────────────────────────────────

class HomeSkeleton extends StatelessWidget {
  const HomeSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final size = MediaQuery.of(context).size;
        final r = Responsive(width: constraints.maxWidth, height: size.height);

        return Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.white,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Hero skeleton
                SizedBox(
                  height: r.heroHeight + r.heroOverlap,
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(r.isTablet ? 32 : 24),
                          bottomRight: Radius.circular(r.isTablet ? 32 : 24),
                        ),
                        child: shimmerBox(
                          height: r.heroHeight,
                          width: double.infinity,
                          radius: 0,
                        ),
                      ),
                      Positioned(
                        left: r.hPad,
                        right: r.hPad,
                        bottom: 0,
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: _StatsCardShimmer(r: r),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: r.isTablet ? 20 : 16),

                // Body skeleton: side-by-side on tablet
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: r.hPad),
                  child: r.isTablet
                      ? Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 5,
                              child: _WhatsIncludedShimmer(r: r),
                            ),
                            SizedBox(width: r.hPad),
                            Expanded(
                              flex: 7,
                              child: _ProgramBreakdownShimmer(r: r),
                            ),
                          ],
                        )
                      : Column(
                          children: [
                            _WhatsIncludedShimmer(r: r),
                            const SizedBox(height: 16),
                            _ProgramBreakdownShimmer(r: r),
                          ],
                        ),
                ),

                SizedBox(height: r.isTablet ? 32 : 24),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _WhatsIncludedShimmer extends StatelessWidget {
  final Responsive r;
  const _WhatsIncludedShimmer({required this.r});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(r.isTablet ? 20 : 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(r.isTablet ? 20 : 16),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          shimmerBox(height: r.isTablet ? 22 : 18, width: 150),
          SizedBox(height: r.isTablet ? 16 : 12),
          ...List.generate(
            3,
            (i) => Padding(
              padding: EdgeInsets.only(bottom: r.isTablet ? 14 : 10),
              child: Row(
                children: [
                  shimmerBox(
                    height: r.isTablet ? 22 : 18,
                    width: r.isTablet ? 22 : 18,
                  ),
                  const SizedBox(width: 10),
                  Expanded(child: shimmerBox(height: 12)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ProgramBreakdownShimmer extends StatelessWidget {
  final Responsive r;
  const _ProgramBreakdownShimmer({required this.r});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        shimmerBox(height: r.isTablet ? 22 : 18, width: 180),
        SizedBox(height: r.isTablet ? 16 : 12),
        ...List.generate(
          5,
          (i) => Padding(
            padding: EdgeInsets.only(bottom: r.isTablet ? 14 : 10),
            child: Container(
              padding: EdgeInsets.all(r.isTablet ? 18 : 14),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(r.cardRadius),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  shimmerBox(
                    height: r.isTablet ? 26 : 20,
                    width: r.isTablet ? 80 : 60,
                    radius: 20,
                  ),
                  const SizedBox(width: 10),
                  Expanded(child: shimmerBox(height: 14)),
                  shimmerBox(height: 20, width: 20),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _StatsCardShimmer extends StatelessWidget {
  final Responsive r;
  const _StatsCardShimmer({required this.r});

  @override
  Widget build(BuildContext context) {
    final columns = r.statColumns;

    return Container(
      padding: EdgeInsets.all(r.isTablet ? 20 : 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(r.isTablet ? 20 : 16),
        color: Colors.white,
      ),
      child: Row(
        children: List.generate(columns, (colIndex) {
          return Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: colIndex > 0 ? 12 : 0),
              child: Column(
                children: [
                  _shimmerStatItem(r),
                  SizedBox(height: r.isTablet ? 20 : 16),
                  _shimmerStatItem(r),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _shimmerStatItem(Responsive r) {
    return Row(
      children: [
        shimmerBox(
          height: r.statIconSize,
          width: r.statIconSize,
          radius: r.isTablet ? 12 : 10,
        ),
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

// ─── Shared shimmer box ───────────────────────────────────────────────────────

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
