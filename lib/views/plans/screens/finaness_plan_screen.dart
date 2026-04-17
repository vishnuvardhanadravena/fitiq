// import 'package:fitiq/core/theame/app_text_styles.dart';
// import 'package:fitiq/routes/route_constants.dart';
// import 'package:fitiq/views/auth/Screens/login_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:fitiq/views/plans/models/programs_res.dart';
// import 'package:fitiq/views/plans/provider/firness_plan_provider.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:go_router/go_router.dart';
// import 'package:shimmer/shimmer.dart';

// class _C {
//   static const primary = Color(0xFF1976D2);
//   // static const accent = Color(0xFFFF5722);
//   static const pricePurple = Color(0xFF6A1B9A);
//   static const surface = Colors.white;
//   // static const textMuted = Color(0xFF6B7280);
// }

// class FitnessPlansScreen extends ConsumerWidget {
//   const FitnessPlansScreen({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final size = MediaQuery.of(context).size;
//     final w = size.width;
//     final h = size.height;
//     final isTab = checkTablet(context);

//     final featured = ref.watch(featuredPlanProvider);
//     final plansAsync = ref.watch(fitnessPlanProvider);
//     final regulars = ref.watch(regularPlansProvider);

//     return plansAsync.when(
//       loading: () => const _FitnessPlansShimmer(),
//       error: (err, _) => Center(child: Text('$err')),

//       data: (_) => Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           if (featured != null) _FeaturedCard(plan: featured, w: w, h: h),

//           GridView.builder(
//             shrinkWrap: true,
//             physics: const NeverScrollableScrollPhysics(),
//             itemCount: regulars.length,
//             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: isTab ? 3 : 2,
//               crossAxisSpacing: 12,
//               mainAxisSpacing: 12,
//               mainAxisExtent: isTab ? h * 0.6 : h * 0.43,
//               // childAspectRatio: isTab ? 0.8 : 0.5,
//             ),
//             itemBuilder: (_, i) =>
//                 _PlanCard(plan: regulars[i], w: w, h: h, isTab: isTab),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class _FeaturedCard extends StatelessWidget {
//   final FitnessPlan plan;
//   final double w;
//   final double h;
//   const _FeaturedCard({required this.plan, required this.w, required this.h});
//   @override
//   Widget build(BuildContext context) {
//     return ClipRRect(
//       borderRadius: BorderRadius.circular(20),
//       child: AspectRatio(
//         aspectRatio: 16 / 9,
//         child: Stack(
//           children: [
//             Positioned.fill(
//               child: CachedNetworkImage(
//                 imageUrl: plan.imageUrl,
//                 fit: BoxFit.cover,
//                 placeholder: (context, url) => Container(
//                   color: Colors.grey.shade200,
//                   child: const Center(
//                     child: CircularProgressIndicator(strokeWidth: 2),
//                   ),
//                 ),
//                 errorWidget: (context, url, error) => Container(
//                   color: Colors.grey.shade200,
//                   child: const Icon(Icons.image_not_supported),
//                 ),
//               ),
//             ),
//             Positioned.fill(
//               child: Container(
//                 decoration: BoxDecoration(
//                   gradient: LinearGradient(
//                     begin: Alignment.centerRight,
//                     end: Alignment.centerLeft,
//                     colors: [
//                       Colors.black.withValues(alpha:0.7),
//                       Colors.black.withValues(alpha:0.3),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             Positioned.fill(
//               child: Padding(
//                 padding: const EdgeInsets.all(16),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     if (plan.badge != null)
//                       Container(
//                         padding: const EdgeInsets.symmetric(
//                           horizontal: 10,
//                           vertical: 4,
//                         ),
//                         decoration: BoxDecoration(
//                           color: Colors.orange,
//                           borderRadius: BorderRadius.circular(20),
//                         ),
//                         child: Text(
//                           plan.badge!,
//                           style: AppTextStyles.label.copyWith(
//                             color: Colors.white,
//                             fontSize: 10,
//                             fontWeight: FontWeight.w700,
//                             fontFamily: "Lato",
//                           ),
//                           // const TextStyle(
//                           //   color: Colors.white,
//                           //   fontSize: 10,
//                           //   fontWeight: FontWeight.w700,
//                           // ),
//                         ),
//                       ),

//                     const SizedBox(height: 8),

//                     /// 🔤 TITLE
//                     Text(
//                       plan.title,
//                       maxLines: 2,
//                       overflow: TextOverflow.ellipsis,
//                       style: AppTextStyles.headingMedium.copyWith(
//                         color: Colors.white,
//                         // fontSize: 10,
//                         fontWeight: FontWeight.w700,
//                         fontFamily: "oswald",
//                       ),
//                       //  const TextStyle(
//                       //   color: Colors.white,
//                       //   fontSize: 18,
//                       //   fontWeight: FontWeight.w800,
//                       // ),
//                     ),
//                     const SizedBox(height: 4),

//                     /// 🧾 SUBTITLE (FROM API)
//                     Text(
//                       plan.subtitle,
//                       maxLines: 2,
//                       overflow: TextOverflow.ellipsis,
//                       style: TextStyle(
//                         color: Colors.white.withValues(alpha:0.8),
//                         fontSize: 12,
//                       ),
//                     ),
//                     Spacer(),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           plan.formattedPrice,
//                           style: AppTextStyles.headingSmall.copyWith(
//                             color: Colors.white,
//                             // fontSize: 10,
//                             fontWeight: FontWeight.w700,
//                             fontFamily: "oswald",
//                           ),
//                         ),
//                         // SizedBox(height: 10.h),
//                         Container(
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(12),
//                             gradient: const LinearGradient(
//                               colors: [Color(0xFFFF416C), Color(0xFFFF4B2B)],
//                             ),
//                           ),
//                           child: ElevatedButton(
//                             onPressed: () {
//                               context.push(
//                                 RouteList.planDetails,
//                                 extra: {"planId": plan.id.toString()},
//                               );
//                             },
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor: Colors.transparent,
//                               shadowColor: Colors.transparent,
//                               padding: const EdgeInsets.symmetric(
//                                 horizontal: 20,
//                                 vertical: 10,
//                               ),
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(12),
//                               ),
//                             ),
//                             child: Text(
//                               'Enroll Now',
//                               style: AppTextStyles.buttonTextStyle.copyWith(
//                                 fontWeight: FontWeight.w700,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class _PlanCard extends StatelessWidget {
//   final FitnessPlan plan;
//   final double w;
//   final double h;
//   final bool isTab;

//   const _PlanCard({
//     required this.plan,
//     required this.w,
//     required this.h,
//     required this.isTab,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: _C.surface,
//         borderRadius: BorderRadius.circular(16),
//         boxShadow: [
//           BoxShadow(
//             blurRadius: 12,
//             color: Colors.black.withValues(alpha:0.08),
//             offset: const Offset(0, 4),
//           ),
//         ],
//       ),
//       child: Column(
//         children: [
//           /// 🔥 IMAGE
//           Stack(
//             children: [
//               ClipRRect(
//                 borderRadius: const BorderRadius.vertical(
//                   top: Radius.circular(16),
//                 ),
//                 child: CachedNetworkImage(
//                   imageUrl: plan.imageUrl,
//                   height: isTab ? h * 0.2 : h * 0.13,
//                   width: double.infinity,
//                   fit: BoxFit.cover,
//                   placeholder: (context, url) => Container(
//                     height: isTab ? h * 0.2 : h * 0.13,
//                     color: Colors.grey.shade200,
//                     child: const Center(
//                       child: CircularProgressIndicator(strokeWidth: 2),
//                     ),
//                   ),
//                   errorWidget: (context, url, error) => Container(
//                     height: isTab ? h * 0.2 : h * 0.13,
//                     color: Colors.grey.shade200,
//                     child: const Icon(Icons.image_not_supported, size: 40),
//                   ),
//                 ),
//               ),

//               if (plan.badge != null)
//                 Positioned(
//                   top: 8,
//                   left: 8,
//                   child: Container(
//                     padding: const EdgeInsets.symmetric(
//                       horizontal: 10,
//                       vertical: 4,
//                     ),
//                     decoration: BoxDecoration(
//                       color: Colors.orange,
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                     child: Text(
//                       plan.badge!,
//                       style: const TextStyle(
//                         color: Colors.white,
//                         fontSize: 10,
//                         fontWeight: FontWeight.w700,
//                       ),
//                     ),
//                   ),
//                 ),
//             ],
//           ),
//           Expanded(
//             child: Padding(
//               padding: const EdgeInsets.all(12),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   /// 🧾 TOP CONTENT
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       /// TITLE
//                       Text(
//                         plan.title,
//                         maxLines: 2,
//                         overflow: TextOverflow.ellipsis,
//                         style: AppTextStyles.headingSmall.copyWith(
//                           fontSize: isTab ? 8.sp : null,
//                           fontWeight: FontWeight.w700,
//                           fontFamily: "oswald",
//                         ),
//                       ),

//                       SizedBox(height: 3.h),

//                       /// WEEKS
//                       Text(
//                         '${plan.weeks} Weeks',
//                         style: AppTextStyles.caption.copyWith(
//                           fontSize: isTab ? 6.sp : null,
//                         ),
//                       ),

//                       SizedBox(height: 4.h),

//                       /// FEATURES
//                       ...plan.features
//                           .take(isTab ? 2 : 3)
//                           .map(
//                             (f) => Padding(
//                               padding: const EdgeInsets.only(bottom: 4),
//                               child: Row(
//                                 children: [
//                                   Icon(
//                                     Icons.check_circle,
//                                     size: isTab ? null : 14.sp,
//                                     color: Colors.blue,
//                                   ),
//                                   const SizedBox(width: 6),
//                                   Expanded(
//                                     child: Text(
//                                       f,
//                                       style: AppTextStyles.text.copyWith(
//                                         fontSize: isTab ? 8.sp : 14.sp,
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),

//                       SizedBox(height: 6.h),

//                       /// PRICE
//                       Text(
//                         plan.formattedPrice,
//                         style: const TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold,
//                           color: _C.pricePurple,
//                         ),
//                       ),
//                     ],
//                   ),

//                   /// 🔥 PUSH BUTTON TO BOTTOM
//                   const Spacer(),

//                   /// 🔥 BUTTON (ALWAYS BOTTOM)
//                   SizedBox(
//                     width: double.infinity,
//                     child: ElevatedButton(
//                       onPressed: () {
//                         context.push(
//                           RouteList.planDetails,
//                           extra: {"planId": plan.id.toString()},
//                         );
//                       },
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: _C.primary,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(8),
//                         ),
//                       ),
//                       child: Text(
//                         'View Details',
//                         style: AppTextStyles.buttonTextStyle.copyWith(
//                           fontWeight: FontWeight.w700,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class _FitnessPlansShimmer extends StatelessWidget {
//   const _FitnessPlansShimmer();

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     final w = size.width;
//     final h = size.height;

//     return Shimmer.fromColors(
//       baseColor: Colors.grey.shade300,
//       highlightColor: Colors.grey.shade100,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // ── Featured card skeleton ──
//           ClipRRect(
//             borderRadius: BorderRadius.circular(20),
//             child: AspectRatio(
//               aspectRatio: 16 / 9,
//               child: Stack(
//                 children: [
//                   // image block
//                   Container(color: Colors.white),
//                   Positioned.fill(
//                     child: Padding(
//                       padding: const EdgeInsets.all(16),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           // badge
//                           Container(
//                             width: 70,
//                             height: 22,
//                             decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.circular(20),
//                             ),
//                           ),
//                           const SizedBox(height: 10),
//                           // title
//                           Container(
//                             width: w * 0.55,
//                             height: 20,
//                             color: Colors.white,
//                           ),
//                           const SizedBox(height: 8),
//                           // subtitle
//                           Container(
//                             width: w * 0.4,
//                             height: 14,
//                             color: Colors.white,
//                           ),
//                           SizedBox(height: 10.h),
//                           Row(
//                             children: [
//                               // price
//                               Container(
//                                 width: 80,
//                                 height: 20,
//                                 color: Colors.white,
//                               ),
//                               SizedBox(height: 10.h),
//                               // button
//                               Container(
//                                 width: 110,
//                                 height: 38,
//                                 decoration: BoxDecoration(
//                                   color: Colors.white,
//                                   borderRadius: BorderRadius.circular(12),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),

//           const SizedBox(height: 12),

//           // ── Grid skeleton ──
//           GridView.builder(
//             shrinkWrap: true,
//             physics: const NeverScrollableScrollPhysics(),
//             itemCount: 4, // show 4 skeleton cards
//             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: w > 600 ? 3 : 2,
//               crossAxisSpacing: 12,
//               mainAxisSpacing: 12,
//               mainAxisExtent: h * 0.42,
//             ),
//             itemBuilder: (_, __) => _PlanCardSkeleton(h: h),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class _PlanCardSkeleton extends StatelessWidget {
//   final double h;
//   const _PlanCardSkeleton({required this.h});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(16),
//       ),
//       child: Column(
//         children: [
//           // image area
//           ClipRRect(
//             borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
//             child: Container(
//               height: h * 0.13,
//               width: double.infinity,
//               color: Colors.white,
//             ),
//           ),
//           Expanded(
//             child: Padding(
//               padding: const EdgeInsets.all(12),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // title
//                   Container(
//                     height: 16,
//                     width: double.infinity,
//                     color: Colors.white,
//                   ),
//                   const SizedBox(height: 6),
//                   Container(height: 16, width: 120, color: Colors.white),
//                   const SizedBox(height: 8),
//                   // weeks
//                   Container(height: 12, width: 70, color: Colors.white),
//                   const SizedBox(height: 10),
//                   // features
//                   ...List.generate(
//                     3,
//                     (i) => Padding(
//                       padding: const EdgeInsets.only(bottom: 6),
//                       child: Row(
//                         children: [
//                           Container(
//                             width: 14,
//                             height: 14,
//                             decoration: const BoxDecoration(
//                               color: Colors.white,
//                               shape: BoxShape.circle,
//                             ),
//                           ),
//                           const SizedBox(width: 6),
//                           Expanded(
//                             child: Container(height: 12, color: Colors.white),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 8),
//                   // price
//                   Container(height: 16, width: 80, color: Colors.white),
//                   SizedBox(height: 10.h),
//                   // button
//                   Container(
//                     height: 36,
//                     width: double.infinity,
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
// import 'dart:math' as math;

// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:fitiq/core/theame/app_text_styles.dart';
// import 'package:fitiq/routes/route_constants.dart';
// import 'package:fitiq/views/auth/Screens/login_screen.dart';
// import 'package:fitiq/views/plans/models/programs_res.dart';
// import 'package:fitiq/views/plans/provider/firness_plan_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:go_router/go_router.dart';
// import 'package:shimmer/shimmer.dart';

// class _C {
//   static const primary = Color(0xFF1976D2);
//   static const pricePurple = Color(0xFF6A1B9A);
//   static const surface = Colors.white;
// }

// int _crossCount(double w) {
//   if (w > 900) return 4;
//   if (w > 600) return 3;
//   return 2;
// }
// class FitnessPlansScreen extends ConsumerWidget {
//   const FitnessPlansScreen({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final isTab = checkTablet(context);
//     final featured = ref.watch(featuredPlanProvider);
//     final plansAsync = ref.watch(fitnessPlanProvider);
//     final regulars = ref.watch(regularPlansProvider);

//     return plansAsync.when(
//       loading: () => const _FitnessPlansShimmer(),
//       error: (err, _) => Center(child: Text('$err')),
//       data: (_) => Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           if (featured != null) _FeaturedCard(plan: featured, isTab: isTab),
//           const SizedBox(height: 12),
//           // ← the key widget that auto-equalises all card heights
//           _UniformHeightGrid(plans: regulars, isTab: isTab),
//         ],
//       ),
//     );
//   }
// }
// class _UniformHeightGrid extends StatefulWidget {
//   final List<FitnessPlan> plans;
//   final bool isTab;
//   const _UniformHeightGrid({required this.plans, required this.isTab});

//   @override
//   State<_UniformHeightGrid> createState() => _UniformHeightGridState();
// }

// class _UniformHeightGridState extends State<_UniformHeightGrid> {
//   double? _uniformHeight;
//   late List<GlobalKey> _keys;

//   @override
//   void initState() {
//     super.initState();
//     _resetKeys();
//     WidgetsBinding.instance.addPostFrameCallback(_measure);
//   }

//   @override
//   void didUpdateWidget(_UniformHeightGrid old) {
//     super.didUpdateWidget(old);
//     if (old.plans.length != widget.plans.length || old.plans != widget.plans) {
//       _resetKeys();
//       _uniformHeight = null;
//       WidgetsBinding.instance.addPostFrameCallback(_measure);
//     }
//   }

//   void _resetKeys() {
//     _keys = List.generate(widget.plans.length, (_) => GlobalKey());
//   }

//   void _measure(_) {
//     double maxH = 0;
//     for (final key in _keys) {
//       final box = key.currentContext?.findRenderObject() as RenderBox?;
//       if (box != null) maxH = math.max(maxH, box.size.height);
//     }
//     if (maxH > 0 && maxH != _uniformHeight) {
//       setState(() => _uniformHeight = maxH);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(
//       builder: (_, constraints) {
//         const spacing = 12.0;
//         final w = constraints.maxWidth;
//         final cols = _crossCount(w);
//         final cardWidth = (w - spacing * (cols - 1)) / cols;

//         return Wrap(
//           spacing: spacing,
//           runSpacing: spacing,
//           children: List.generate(widget.plans.length, (i) {
//             return SizedBox(
//               key: _keys[i],
//               width: cardWidth,
//               height: _uniformHeight,
//               child: _PlanCard(
//                 plan: widget.plans[i],
//                 isTab: widget.isTab,
//                 hasFixedHeight: _uniformHeight != null,
//               ),
//             );
//           }),
//         );
//       },
//     );
//   }
// }

// class _FeaturedCard extends StatelessWidget {
//   final FitnessPlan plan;
//   final bool isTab;
//   const _FeaturedCard({required this.plan, required this.isTab});

//   @override
//   Widget build(BuildContext context) {
//     return ClipRRect(
//       borderRadius: BorderRadius.circular(20),
//       child: AspectRatio(
//         aspectRatio: 16 / 9, // safe — no explicit height
//         child: Stack(
//           children: [
//             Positioned.fill(
//               child: CachedNetworkImage(
//                 imageUrl: plan.imageUrl,
//                 fit: BoxFit.cover,
//                 placeholder: (_, __) => Container(
//                   color: Colors.grey.shade200,
//                   child: const Center(
//                     child: CircularProgressIndicator(strokeWidth: 2),
//                   ),
//                 ),
//                 errorWidget: (_, __, ___) => Container(
//                   color: Colors.grey.shade200,
//                   child: const Icon(Icons.image_not_supported),
//                 ),
//               ),
//             ),
//             Positioned.fill(
//               child: DecoratedBox(
//                 decoration: BoxDecoration(
//                   gradient: LinearGradient(
//                     begin: Alignment.centerRight,
//                     end: Alignment.centerLeft,
//                     colors: [
//                       Colors.black.withValues(alpha:0.7),
//                       Colors.black.withValues(alpha:0.3),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             Positioned.fill(
//               child: Padding(
//                 padding: const EdgeInsets.all(16),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     if (plan.badge != null) _Badge(label: plan.badge!),
//                     const SizedBox(height: 8),
//                     Text(
//                       plan.title,
//                       maxLines: 2,
//                       overflow: TextOverflow.ellipsis,
//                       style: AppTextStyles.headingMedium.copyWith(
//                         color: Colors.white,
//                         fontWeight: FontWeight.w700,
//                         fontFamily: "oswald",
//                       ),
//                     ),
//                     const SizedBox(height: 4),
//                     Text(
//                       plan.subtitle,
//                       maxLines: 2,
//                       overflow: TextOverflow.ellipsis,
//                       style: TextStyle(
//                         color: Colors.white.withValues(alpha:0.8),
//                         fontSize: 12,
//                       ),
//                     ),
//                     const Spacer(),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           plan.formattedPrice,
//                           style: AppTextStyles.headingSmall.copyWith(
//                             color: Colors.white,
//                             fontWeight: FontWeight.w700,
//                             fontFamily: "oswald",
//                           ),
//                         ),
//                         _GradientButton(
//                           label: 'Enroll Now',
//                           onTap: () => context.push(
//                             RouteList.planDetails,
//                             extra: {"planId": plan.id.toString()},
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class _PlanCard extends StatelessWidget {
//   final FitnessPlan plan;
//   final bool isTab;
//   final bool hasFixedHeight;

//   const _PlanCard({
//     required this.plan,
//     required this.isTab,
//     required this.hasFixedHeight,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: _C.surface,
//         borderRadius: BorderRadius.circular(16),
//         boxShadow: [
//           BoxShadow(
//             blurRadius: 12,
//             color: Colors.black.withValues(alpha:0.08),
//             offset: const Offset(0, 4),
//           ),
//         ],
//       ),
//       child: Column(
//         // Pass 1 → min (unbounded, card shrinks to content, NO Spacer used)
//         // Pass 2 → max (parent SizedBox has fixed height, Spacer is safe)
//         mainAxisSize: hasFixedHeight ? MainAxisSize.max : MainAxisSize.min,
//         children: [
//           Stack(
//             children: [
//               ClipRRect(
//                 borderRadius: const BorderRadius.vertical(
//                   top: Radius.circular(16),
//                 ),
//                 child: AspectRatio(
//                   aspectRatio: 16 / 9,
//                   child: CachedNetworkImage(
//                     imageUrl: plan.imageUrl,
//                     width: double.infinity,
//                     fit: BoxFit.cover,
//                     placeholder: (_, __) => Container(
//                       color: Colors.grey.shade200,
//                       child: const Center(
//                         child: CircularProgressIndicator(strokeWidth: 2),
//                       ),
//                     ),
//                     errorWidget: (_, __, ___) => Container(
//                       color: Colors.grey.shade200,
//                       child: const Icon(Icons.image_not_supported, size: 40),
//                     ),
//                   ),
//                 ),
//               ),
//               if (plan.badge != null)
//                 Positioned(top: 8, left: 8, child: _Badge(label: plan.badge!)),
//             ],
//           ),

//           // Content area
//           // Pass 1: plain widget, Column is min-sized, NO Spacer inside
//           // Pass 2: Expanded so content fills remaining height, Spacer is safe
//           hasFixedHeight
//               ? Expanded(
//                   child: _CardBody(
//                     plan: plan,
//                     isTab: isTab,
//                     useSpacerForButton: true, // bounded → Spacer OK
//                   ),
//                 )
//               : _CardBody(
//                   plan: plan,
//                   isTab: isTab,
//                   useSpacerForButton: false, // unbounded → NO Spacer
//                 ),
//         ],
//       ),
//     );
//   }
// }

// class _CardBody extends StatelessWidget {
//   final FitnessPlan plan;
//   final bool isTab;

//   /// true  → use Spacer  (Pass 2, height is bounded)
//   /// false → use SizedBox gap (Pass 1, height is unbounded)
//   final bool useSpacerForButton;

//   const _CardBody({
//     required this.plan,
//     required this.isTab,
//     required this.useSpacerForButton,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.fromLTRB(10, 8, 10, 10),
//       child: Column(
//         // CRITICAL: always min here — the parent (Expanded or plain)
//         // controls the outer height, not this Column
//         mainAxisSize: MainAxisSize.min,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Title
//           Text(
//             plan.title,
//             maxLines: 2,
//             overflow: TextOverflow.ellipsis,
//             style: AppTextStyles.headingSmall.copyWith(
//               fontSize: isTab ? 8.sp : 13.sp,
//               fontWeight: FontWeight.w700,
//               fontFamily: "oswald",
//             ),
//           ),

//           const SizedBox(height: 3),

//           // Weeks
//           Text(
//             '${plan.weeks} Weeks',
//             style: AppTextStyles.caption.copyWith(
//               fontSize: isTab ? 6.sp : null,
//             ),
//           ),

//           const SizedBox(height: 5),

//           ...plan.features.map(
//             (f) => Padding(
//               padding: const EdgeInsets.only(bottom: 3),
//               child: Row(
//                 children: [
//                   Icon(
//                     Icons.check_circle,
//                     size: isTab ? 11 : 13,
//                     color: Colors.blue,
//                   ),
//                   const SizedBox(width: 4),
//                   Flexible(
//                     child: Text(
//                       f,
//                       maxLines: 1,
//                       overflow: TextOverflow.ellipsis,
//                       style: AppTextStyles.text.copyWith(
//                         fontSize: isTab ? 8.sp : 11.sp,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),

//           const SizedBox(height: 5),

//           // Price
//           Text(
//             plan.formattedPrice,
//             style: const TextStyle(
//               fontSize: 15,
//               fontWeight: FontWeight.bold,
//               color: _C.pricePurple,
//             ),
//           ),

//           // ↓ THE FIX:
//           // Pass 1 (unbounded) → fixed gap, NO flex widget
//           // Pass 2 (bounded)   → Spacer pushes button to bottom
//           if (useSpacerForButton) ...[
//             const Spacer(), // safe: parent Expanded gives bounded height
//           ] else ...[
//             const SizedBox(height: 10), // safe: no flex
//           ],

//           // Button
//           SizedBox(
//             width: double.infinity,
//             child: ElevatedButton(
//               onPressed: () => context.push(
//                 RouteList.planDetails,
//                 extra: {"planId": plan.id.toString()},
//               ),
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: _C.primary,
//                 padding: const EdgeInsets.symmetric(vertical: 8),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//               ),
//               child: Text(
//                 'View Details',
//                 style: AppTextStyles.buttonTextStyle.copyWith(
//                   fontWeight: FontWeight.w700,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// // ─── Shimmer ──────────────────────────────────────────────────────────────────
// class _FitnessPlansShimmer extends StatelessWidget {
//   const _FitnessPlansShimmer();

//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(
//       builder: (_, constraints) {
//         const spacing = 12.0;
//         final w = constraints.maxWidth;
//         final cols = _crossCount(w);
//         final cardWidth = (w - spacing * (cols - 1)) / cols;

//         return Shimmer.fromColors(
//           baseColor: Colors.grey.shade300,
//           highlightColor: Colors.grey.shade100,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Featured skeleton
//               ClipRRect(
//                 borderRadius: BorderRadius.circular(20),
//                 child: AspectRatio(
//                   aspectRatio: 16 / 9,
//                   child: Stack(
//                     children: [
//                       Container(color: Colors.white),
//                       Positioned.fill(
//                         child: Padding(
//                           padding: const EdgeInsets.all(16),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Container(
//                                 width: 70,
//                                 height: 22,
//                                 decoration: BoxDecoration(
//                                   color: Colors.white,
//                                   borderRadius: BorderRadius.circular(20),
//                                 ),
//                               ),
//                               const SizedBox(height: 10),
//                               Container(
//                                 width: w * 0.5,
//                                 height: 18,
//                                 color: Colors.white,
//                               ),
//                               const SizedBox(height: 8),
//                               Container(
//                                 width: w * 0.35,
//                                 height: 13,
//                                 color: Colors.white,
//                               ),
//                               const Spacer(),
//                               Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Container(
//                                     width: 80,
//                                     height: 20,
//                                     color: Colors.white,
//                                   ),
//                                   Container(
//                                     width: 110,
//                                     height: 38,
//                                     decoration: BoxDecoration(
//                                       color: Colors.white,
//                                       borderRadius: BorderRadius.circular(12),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),

//               const SizedBox(height: 12),

//               // Grid skeleton — same Wrap layout as real grid
//               Wrap(
//                 spacing: spacing,
//                 runSpacing: spacing,
//                 children: List.generate(
//                   4,
//                   (_) => SizedBox(
//                     width: cardWidth,
//                     child: const _PlanCardSkeleton(),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }

// class _PlanCardSkeleton extends StatelessWidget {
//   const _PlanCardSkeleton();

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(16),
//       ),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           ClipRRect(
//             borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
//             child: AspectRatio(
//               aspectRatio: 16 / 9,
//               child: Container(color: Colors.white),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(10),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Container(
//                   height: 14,
//                   width: double.infinity,
//                   color: Colors.white,
//                 ),
//                 const SizedBox(height: 6),
//                 Container(height: 12, width: 100, color: Colors.white),
//                 const SizedBox(height: 8),
//                 Container(height: 11, width: 60, color: Colors.white),
//                 const SizedBox(height: 10),
//                 ...List.generate(
//                   3,
//                   (_) => Padding(
//                     padding: const EdgeInsets.only(bottom: 5),
//                     child: Row(
//                       children: [
//                         Container(
//                           width: 13,
//                           height: 13,
//                           decoration: const BoxDecoration(
//                             color: Colors.white,
//                             shape: BoxShape.circle,
//                           ),
//                         ),
//                         const SizedBox(width: 5),
//                         Expanded(
//                           child: Container(height: 11, color: Colors.white),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 6),
//                 Container(height: 14, width: 70, color: Colors.white),
//                 const SizedBox(height: 12),
//                 Container(
//                   height: 34,
//                   width: double.infinity,
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// // ─── Shared small widgets ─────────────────────────────────────────────────────
// class _Badge extends StatelessWidget {
//   final String label;
//   const _Badge({required this.label});
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
//       decoration: BoxDecoration(
//         color: Colors.orange,
//         borderRadius: BorderRadius.circular(20),
//       ),
//       child: Text(
//         label,
//         style: const TextStyle(
//           color: Colors.white,
//           fontSize: 10,
//           fontWeight: FontWeight.w700,
//         ),
//       ),
//     );
//   }
// }

// class _GradientButton extends StatelessWidget {
//   final String label;
//   final VoidCallback onTap;
//   const _GradientButton({required this.label, required this.onTap});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(12),
//         gradient: const LinearGradient(
//           colors: [Color(0xFFFF416C), Color(0xFFFF4B2B)],
//         ),
//       ),
//       child: ElevatedButton(
//         onPressed: onTap,
//         style: ElevatedButton.styleFrom(
//           backgroundColor: Colors.transparent,
//           shadowColor: Colors.transparent,
//           padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(12),
//           ),
//         ),
//         child: Text(
//           label,
//           style: AppTextStyles.buttonTextStyle.copyWith(
//             fontWeight: FontWeight.w700,
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'dart:math' as math;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitiq/core/theame/app_text_styles.dart';
import 'package:fitiq/routes/route_constants.dart';
import 'package:fitiq/views/auth/Screens/login_screen.dart';
import 'package:fitiq/views/plans/models/programs_res.dart';
import 'package:fitiq/views/plans/provider/firness_plan_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';

// ─── constants ────────────────────────────────────────────────────────────────
class _C {
  static const primary = Color(0xFF1976D2);
  static const pricePurple = Color(0xFF6A1B9A);
  static const surface = Colors.white;
}

const double _kSpacing = 12.0;

int _crossCount(double availableWidth) {
  if (availableWidth > 900) return 4;
  if (availableWidth > 600) return 3;
  return 2;
}

// ─────────────────────────────────────────────────────────────────────────────
// Root screen widget
// ─────────────────────────────────────────────────────────────────────────────
class FitnessPlansScreen extends ConsumerWidget {
  const FitnessPlansScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isTab = checkTablet(context);
    final featured = ref.watch(featuredPlanProvider);
    final plansAsync = ref.watch(fitnessPlanProvider);
    final regulars = ref.watch(regularPlansProvider);

    return plansAsync.when(
      loading: () => const _FitnessPlansShimmer(),
      error: (err, _) => Center(child: Text('$err')),
      data: (_) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (featured != null) _FeaturedCard(plan: featured, isTab: isTab),
          const SizedBox(height: 12),
          _UniformHeightGrid(plans: regulars, isTab: isTab),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Uniform-height grid
// ─────────────────────────────────────────────────────────────────────────────
/// Two-pass strategy:
///   Pass 1  – renders every card with no fixed height (natural/content size).
///             After the frame, measures the tallest card → _uniformHeight.
///   Pass 2  – every card gets SizedBox(height: _uniformHeight).
///             Buttons are pinned to the bottom via Spacer (safe now).
///
/// On orientation change the available width changes → _lastWidth differs →
/// we reset and re-measure so cards are re-equalised for the new layout.
class _UniformHeightGrid extends StatefulWidget {
  final List<FitnessPlan> plans;
  final bool isTab;
  const _UniformHeightGrid({required this.plans, required this.isTab});

  @override
  State<_UniformHeightGrid> createState() => _UniformHeightGridState();
}

class _UniformHeightGridState extends State<_UniformHeightGrid> {
  double? _uniformHeight;
  late List<GlobalKey> _keys;
  double _lastWidth = 0;

  @override
  void initState() {
    super.initState();
    _resetKeys();
    WidgetsBinding.instance.addPostFrameCallback(_measure);
  }

  @override
  void didUpdateWidget(_UniformHeightGrid old) {
    super.didUpdateWidget(old);
    // Re-measure if plan list changed
    if (old.plans.length != widget.plans.length || old.plans != widget.plans) {
      _resetKeys();
      _uniformHeight = null;
      WidgetsBinding.instance.addPostFrameCallback(_measure);
    }
  }

  void _resetKeys() {
    _keys = List.generate(widget.plans.length, (_) => GlobalKey());
  }

  void _measure(_) {
    double maxH = 0;
    for (final key in _keys) {
      final box = key.currentContext?.findRenderObject() as RenderBox?;
      if (box != null && box.hasSize) {
        maxH = math.max(maxH, box.size.height);
      }
    }
    if (maxH > 0 && maxH != _uniformHeight) {
      setState(() => _uniformHeight = maxH);
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        final w = constraints.maxWidth;
        final cols = _crossCount(w);
        final cardWidth = (w - _kSpacing * (cols - 1)) / cols;

        // ── Orientation / resize reset ──────────────────────────────────────
        // If available width changed (rotation, window resize) the old
        // _uniformHeight belongs to the previous layout → discard it and
        // re-measure in the next frame.
        if (_lastWidth != 0 && (w - _lastWidth).abs() > 1) {
          // schedule reset outside of build
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (mounted) {
              setState(() {
                _uniformHeight = null;
                _lastWidth = w;
              });
              WidgetsBinding.instance.addPostFrameCallback(_measure);
            }
          });
        }
        _lastWidth = w;
        // ────────────────────────────────────────────────────────────────────

        return Wrap(
          spacing: _kSpacing,
          runSpacing: _kSpacing,
          children: List.generate(widget.plans.length, (i) {
            return SizedBox(
              key: _keys[i],
              width: cardWidth,
              // Pass 1 → null  : card measures its own content height
              // Pass 2 → fixed : all cards locked to the tallest card
              height: _uniformHeight,
              child: _PlanCard(
                plan: widget.plans[i],
                isTab: widget.isTab,
                hasFixedHeight: _uniformHeight != null,
              ),
            );
          }),
        );
      },
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Featured banner card
// ─────────────────────────────────────────────────────────────────────────────
class _FeaturedCard extends StatelessWidget {
  final FitnessPlan plan;
  final bool isTab;
  const _FeaturedCard({required this.plan, required this.isTab});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: AspectRatio(
        aspectRatio: 16 / 9, // no explicit height → safe on all sizes
        child: Stack(
          children: [
            // ── background image ─────────────────────────────────────────────
            Positioned.fill(
              child: CachedNetworkImage(
                imageUrl: plan.imageUrl,
                fit: BoxFit.cover,
                placeholder: (_, __) => Container(
                  color: Colors.grey.shade200,
                  child: const Center(
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                ),
                errorWidget: (_, __, ___) => Container(
                  color: Colors.grey.shade200,
                  child: const Icon(Icons.image_not_supported),
                ),
              ),
            ),
            // ── gradient overlay ─────────────────────────────────────────────
            Positioned.fill(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft,
                    colors: [
                      Colors.black.withValues(alpha: 0.7),
                      Colors.black.withValues(alpha: 0.3),
                    ],
                  ),
                ),
              ),
            ),
            // ── text + button ────────────────────────────────────────────────
            Positioned.fill(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (plan.badge != null) _Badge(label: plan.badge!),
                    const SizedBox(height: 8),
                    Text(
                      plan.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.headingMedium.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontFamily: "oswald",
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      plan.subtitle,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.white.withValues(alpha: 0.8),
                        fontSize: 12,
                      ),
                    ),
                    // Spacer is safe here: Positioned.fill gives bounded height
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          plan.formattedPrice,
                          style: AppTextStyles.headingSmall.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontFamily: "oswald",
                          ),
                        ),
                        _GradientButton(
                          label: 'Enroll Now',
                          onTap: () => context.push(
                            RouteList.planDetails,
                            extra: {"planId": plan.id.toString()},
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
  final bool isTab;
  final bool hasFixedHeight;
  const _PlanCard({
    required this.plan,
    required this.isTab,
    required this.hasFixedHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: _C.surface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            blurRadius: 12,
            color: Colors.black.withValues(alpha: 0.08),
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: hasFixedHeight ? MainAxisSize.max : MainAxisSize.min,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(16),
                ),
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: CachedNetworkImage(
                    imageUrl: plan.imageUrl,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    placeholder: (_, __) => Container(
                      color: Colors.grey.shade200,
                      child: const Center(
                        child: CircularProgressIndicator(strokeWidth: 2),
                      ),
                    ),
                    errorWidget: (_, __, ___) => Container(
                      color: Colors.grey.shade200,
                      child: const Icon(Icons.image_not_supported, size: 40),
                    ),
                  ),
                ),
              ),
              if (plan.badge != null)
                Positioned(top: 8, left: 8, child: _Badge(label: plan.badge!)),
            ],
          ),
          if (hasFixedHeight)
            Expanded(
              child: _CardBody(
                plan: plan,
                isTab: isTab,
                useSpacerForButton: true,
              ),
            )
          else
            _CardBody(plan: plan, isTab: isTab, useSpacerForButton: false),
        ],
      ),
    );
  }
}

class _CardBody extends StatelessWidget {
  final FitnessPlan plan;
  final bool isTab;
  final bool useSpacerForButton;
  const _CardBody({
    required this.plan,
    required this.isTab,
    required this.useSpacerForButton,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 8, 10, 10),
      child: Column(
        // Always min here — outer Expanded (Pass 2) or nothing (Pass 1)
        // provides the height constraint; this column just stacks children.
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // title
          Text(
            plan.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.headingSmall.copyWith(
              fontSize: isTab ? 8.sp : 13.sp,
              fontWeight: FontWeight.w700,
              fontFamily: "oswald",
            ),
          ),
          const SizedBox(height: 3),
          Text(
            '${plan.weeks} Weeks',
            style: AppTextStyles.caption.copyWith(
              fontSize: isTab ? 6.sp : null,
            ),
          ),
          const SizedBox(height: 5),
          ...plan.features.map(
            (f) => Padding(
              padding: const EdgeInsets.only(bottom: 3),
              child: Row(
                children: [
                  Icon(
                    Icons.check_circle,
                    size: isTab ? 11 : 13,
                    color: Colors.blue,
                  ),
                  const SizedBox(width: 4),
                  Flexible(
                    child: Text(
                      f,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.text.copyWith(
                        fontSize: isTab ? 8.sp : 11.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 5),

          // price
          Text(
            plan.formattedPrice,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: _C.pricePurple,
            ),
          ),

          // gap before button
          // ─ Pass 1: fixed SizedBox → NO flex, safe in unbounded column
          // ─ Pass 2: Spacer        → flex OK, parent Expanded is bounded
          if (useSpacerForButton)
            const Spacer()
          else
            const SizedBox(height: 10),

          // button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => context.push(
                RouteList.planDetails,
                extra: {"planId": plan.id.toString()},
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: _C.primary,
                padding: const EdgeInsets.symmetric(vertical: 8),
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
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Shimmer skeleton
// ─────────────────────────────────────────────────────────────────────────────
class _FitnessPlansShimmer extends StatelessWidget {
  const _FitnessPlansShimmer();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        final w = constraints.maxWidth;
        final cols = _crossCount(w);
        final cardWidth = (w - _kSpacing * (cols - 1)) / cols;

        return Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // featured skeleton — AspectRatio so no height needed
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Stack(
                    children: [
                      Container(color: Colors.white),
                      Positioned.fill(
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 70,
                                height: 22,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Container(
                                width: w * 0.5,
                                height: 18,
                                color: Colors.white,
                              ),
                              const SizedBox(height: 8),
                              Container(
                                width: w * 0.35,
                                height: 13,
                                color: Colors.white,
                              ),
                              // Spacer OK: Positioned.fill gives bounded height
                              const Spacer(),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: 80,
                                    height: 20,
                                    color: Colors.white,
                                  ),
                                  Container(
                                    width: 110,
                                    height: 38,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(12),
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
              ),

              const SizedBox(height: 12),

              // card skeletons in Wrap, same layout as real grid
              Wrap(
                spacing: _kSpacing,
                runSpacing: _kSpacing,
                children: List.generate(
                  4,
                  (_) => SizedBox(
                    width: cardWidth,
                    child: const _PlanCardSkeleton(),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _PlanCardSkeleton extends StatelessWidget {
  const _PlanCardSkeleton();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min, // no fixed height → min is safe
        children: [
          // image — aspect ratio, no height
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: Container(color: Colors.white),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 14,
                  width: double.infinity,
                  color: Colors.white,
                ),
                const SizedBox(height: 6),
                Container(height: 12, width: 100, color: Colors.white),
                const SizedBox(height: 8),
                Container(height: 11, width: 60, color: Colors.white),
                const SizedBox(height: 10),
                ...List.generate(
                  3,
                  (_) => Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Row(
                      children: [
                        Container(
                          width: 13,
                          height: 13,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 5),
                        Expanded(
                          child: Container(height: 11, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 6),
                Container(height: 14, width: 70, color: Colors.white),
                const SizedBox(height: 12),
                Container(
                  height: 34,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Shared micro-widgets
// ─────────────────────────────────────────────────────────────────────────────
class _Badge extends StatelessWidget {
  final String label;
  const _Badge({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 10,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

class _GradientButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  const _GradientButton({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: const LinearGradient(
          colors: [Color(0xFFFF416C), Color(0xFFFF4B2B)],
        ),
      ),
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          label,
          style: AppTextStyles.buttonTextStyle.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
