import 'package:fitiq/core/theame/app_colors.dart';
import 'package:fitiq/core/theame/app_text_styles.dart';
import 'package:fitiq/routes/route_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fitiq/views/plans/models/programs_res.dart';
import 'package:fitiq/views/plans/provider/firness_plan_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:go_router/go_router.dart';

class _C {
  static const primary = Color(0xFF1976D2);
  static const accent = Color(0xFFFF5722);
  static const pricePurple = Color(0xFF6A1B9A);
  static const surface = Colors.white;
  static const textMuted = Color(0xFF6B7280);
}

class FitnessPlansScreen extends ConsumerWidget {
  const FitnessPlansScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final w = size.width;
    final h = size.height;

    final featured = ref.watch(featuredPlanProvider);
    final plansAsync = ref.watch(fitnessPlanProvider);
    final regulars = ref.watch(regularPlansProvider);

    return plansAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, _) => Center(child: Text('$err')),

      /// ✅ DATA
      data: (_) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (featured != null) _FeaturedCard(plan: featured, w: w, h: h),

          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: regulars.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: w > 600 ? 3 : 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              mainAxisExtent: h * 0.42,
            ),
            itemBuilder: (_, i) => _PlanCard(plan: regulars[i], w: w, h: h),
          ),
        ],
      ),
    );
  }
}

class _FeaturedCard extends StatelessWidget {
  final FitnessPlan plan;
  final double w;
  final double h;
  const _FeaturedCard({required this.plan, required this.w, required this.h});
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: Stack(
          children: [
            Positioned.fill(
              child: CachedNetworkImage(
                imageUrl: plan.imageUrl,
                fit: BoxFit.cover,
                placeholder: (context, url) => Container(
                  color: Colors.grey.shade200,
                  child: const Center(
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                ),
                errorWidget: (context, url, error) => Container(
                  color: Colors.grey.shade200,
                  child: const Icon(Icons.image_not_supported),
                ),
              ),
            ),
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft,
                    colors: [
                      Colors.black.withOpacity(0.7),
                      Colors.black.withOpacity(0.3),
                    ],
                  ),
                ),
              ),
            ),
            Positioned.fill(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                            fontFamily: "Lato",
                          ),
                          // const TextStyle(
                          //   color: Colors.white,
                          //   fontSize: 10,
                          //   fontWeight: FontWeight.w700,
                          // ),
                        ),
                      ),

                    const SizedBox(height: 8),

                    /// 🔤 TITLE
                    Text(
                      plan.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.headingMedium.copyWith(
                        color: Colors.white,
                        // fontSize: 10,
                        fontWeight: FontWeight.w700,
                        fontFamily: "oswald",
                      ),
                      //  const TextStyle(
                      //   color: Colors.white,
                      //   fontSize: 18,
                      //   fontWeight: FontWeight.w800,
                      // ),
                    ),
                    const SizedBox(height: 4),

                    /// 🧾 SUBTITLE (FROM API)
                    Text(
                      plan.subtitle,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.8),
                        fontSize: 12,
                      ),
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        Text(
                          plan.formattedPrice,
                          style: AppTextStyles.headingSmall.copyWith(
                            color: Colors.white,
                            // fontSize: 10,
                            fontWeight: FontWeight.w700,
                            fontFamily: "oswald",
                          ),
                        ),
                        const Spacer(),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            gradient: const LinearGradient(
                              colors: [Color(0xFFFF416C), Color(0xFFFF4B2B)],
                            ),
                          ),
                          child: ElevatedButton(
                            onPressed: () {
                              context.push(
                                RouteList.planDetails,
                                extra: {"planId": plan.id.toString()},
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              shadowColor: Colors.transparent,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 10,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: Text(
                              'Enroll Now',
                              style: AppTextStyles.buttonTextStyle.copyWith(
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
            ),
          ],
        ),
      ),
    );
  }
}

class _PlanCard extends StatelessWidget {
  final FitnessPlan plan;
  final double w;
  final double h;
  const _PlanCard({required this.plan, required this.w, required this.h});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: _C.surface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            blurRadius: 12,
            color: Colors.black.withOpacity(0.08),
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(16),
                ),
                child: CachedNetworkImage(
                  imageUrl: plan.imageUrl,
                  height: h * 0.13,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Container(
                    height: h * 0.13,
                    color: Colors.grey.shade200,
                    child: const Center(
                      child: CircularProgressIndicator(strokeWidth: 2),
                    ),
                  ),
                  errorWidget: (context, url, error) => Container(
                    height: h * 0.13,
                    color: Colors.grey.shade200,
                    child: const Icon(Icons.image_not_supported, size: 40),
                  ),
                ),
              ),
              if (plan.badge != null)
                Positioned(
                  top: 8,
                  left: 8,
                  child: Container(
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
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// TITLE
                  Text(
                    plan.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.headingSmall.copyWith(
                      fontWeight: FontWeight.w700,
                      fontFamily: "oswald",
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    '${plan.weeks} Weeks',
                    style: AppTextStyles.caption.copyWith(
                      fontWeight: FontWeight.w400,
                      // fontFamily: "oswald",
                    ),
                  ),
                  SizedBox(height: 6.h),
                  ...plan.features
                      .take(3)
                      .map(
                        (f) => Padding(
                          padding: const EdgeInsets.only(bottom: 4),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.check_circle,
                                size: 14,
                                color: Colors.blue,
                              ),
                              const SizedBox(width: 6),
                              Expanded(
                                child: Text(
                                  f,
                                  style: AppTextStyles.text.copyWith(
                                    // fontWeight: FontWeight.w700,
                                    // fontFamily: "oswald",
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                  SizedBox(height: 6.h),
                  Text(
                    plan.formattedPrice,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: _C.pricePurple,
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        context.push(
                          RouteList.planDetails,
                          extra: {"planId": plan.id.toString()},
                        );
                        // 
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _C.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        'View Details',
                        style: AppTextStyles.buttonTextStyle.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
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
