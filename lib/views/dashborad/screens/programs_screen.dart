// // import 'package:fitiq/core/theame/app_text_styles.dart';
// // import 'package:fitiq/core/widgets/blue_container_wraper.dart';
// // import 'package:fitiq/views/auth/Screens/login_screen.dart';
// // import 'package:fitiq/views/plans/provider/category_provider.dart';
// // import 'package:fitiq/views/plans/screens/finaness_plan_screen.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter_riverpod/flutter_riverpod.dart';
// // import 'package:flutter_screenutil/flutter_screenutil.dart';

// // class ProgramsScreen extends ConsumerWidget {
// //   const ProgramsScreen({super.key});

// //   @override
// //   Widget build(BuildContext context, WidgetRef ref) {
// //     final selectedIndex = ref.watch(categoryProvider);
// //     final isTab = checkTablet(context);
// //     final size = MediaQuery.of(context).size;

// //     return Scaffold(
// //       body: CustomScrollView(
// //         slivers: [
// //           /// 🔥 HEADER
// //           SliverToBoxAdapter(
// //             child: BackgroundContainer(
// //               borderRadius: const BorderRadius.only(
// //                 bottomLeft: Radius.circular(24),
// //                 bottomRight: Radius.circular(24),
// //               ),
// //               height: isTab ? size.height * 0.3 : size.height * 0.26,
// //               child: Padding(
// //                 padding: EdgeInsets.symmetric(horizontal: 16.w),
// //                 child: Column(
// //                   mainAxisAlignment: MainAxisAlignment.center,
// //                   children: [
// //                     const Spacer(),
// //                     Text(
// //                       "Transform With Structured Programs",
// //                       textAlign: TextAlign.center,
// //                       style: AppTextStyles.headingLarge.copyWith(
// //                         color: Colors.white,
// //                         fontSize: isTab ? 16.sp : 24.sp,
// //                       ),
// //                     ),
// //                     SizedBox(height: 12.h),
// //                     Text(
// //                       "Choose from expert-designed fitness, yoga, and nutrition plans tailored to your goals.",
// //                       textAlign: TextAlign.center,
// //                       style: AppTextStyles.subheading.copyWith(
// //                         color: Colors.white70,
// //                         fontSize: isTab ? 10.sp : 12.sp,
// //                       ),
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //             ),
// //           ),

// //           /// 🔥 CATEGORY TITLE
// //           SliverToBoxAdapter(
// //             child: Padding(
// //               padding: EdgeInsets.fromLTRB(16.w, 10.h, 16.w, 5.h),
// //               child: Text(
// //                 "Browse by Category",
// //                 style: AppTextStyles.headingMedium.copyWith(
// //                   fontWeight: FontWeight.w900,
// //                   fontSize: isTab ? 14.sp : null,
// //                 ),
// //               ),
// //             ),
// //           ),

// //           /// 🔥 CATEGORY LIST
// //           SliverToBoxAdapter(
// //             child: SizedBox(
// //               height: isTab ? 100.h : 50.h,
// //               child: ListView.builder(
// //                 scrollDirection: Axis.horizontal,
// //                 itemCount: categories.length,
// //                 padding: EdgeInsets.symmetric(horizontal: 16.w),
// //                 itemBuilder: (context, index) {
// //                   final isSelected = selectedIndex == index;

// //                   return GestureDetector(
// //                     onTap: () {
// //                       ref.read(categoryProvider.notifier).setIndex(index);
// //                     },
// //                     child: Container(
// //                       margin: EdgeInsets.only(right: 10.w),
// //                       padding: EdgeInsets.symmetric(
// //                         horizontal: isTab ? 20.w : 16.w,
// //                         vertical: isTab ? 0.h : 5.h,
// //                       ),
// //                       decoration: BoxDecoration(
// //                         color: isSelected ? Colors.blue : Colors.grey.shade200,
// //                         borderRadius: BorderRadius.circular(20),
// //                       ),
// //                       child: Center(
// //                         child: Text(
// //                           categories[index],
// //                           style: TextStyle(
// //                             color: isSelected ? Colors.white : Colors.black,
// //                             fontWeight: FontWeight.w600,
// //                             fontSize: isTab ? 10.sp : 12.sp,
// //                           ),
// //                         ),
// //                       ),
// //                     ),
// //                   );
// //                 },
// //               ),
// //             ),
// //           ),

// //           /// 🔥 PLANS GRID (IMPORTANT)
// //           SliverPadding(
// //             padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
// //             sliver: SliverToBoxAdapter(child: FitnessPlansScreen()),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }
// import 'package:fitiq/core/theame/app_text_styles.dart';
// import 'package:fitiq/core/widgets/blue_container_wraper.dart';
// import 'package:fitiq/views/auth/Screens/login_screen.dart';
// import 'package:fitiq/views/plans/provider/category_provider.dart';
// import 'package:fitiq/views/plans/screens/finaness_plan_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class ProgramsScreen extends ConsumerWidget {
//   const ProgramsScreen({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final selectedIndex = ref.watch(categoryProvider);
//     final isTab = checkTablet(context);
//     final size = MediaQuery.of(context).size;
//     final orientation = MediaQuery.of(context).orientation;
//     final isLandscape = orientation == Orientation.landscape;

//     // Use the SMALLER dimension for header so it never dominates in landscape
//     final shortSide = size.shortestSide;

//     // Header height: based on shortestSide so landscape doesn't squish it
//     final double headerHeight;
//     if (isTab && isLandscape) {
//       headerHeight = shortSide * 0.32;
//     } else if (isTab) {
//       headerHeight = shortSide * 0.32;
//     } else if (isLandscape) {
//       headerHeight = shortSide * 0.40;
//     } else {
//       headerHeight = size.height * 0.26;
//     }

//     final double chipListHeight = isTab ? 52.0 : 44.0;

//     return Scaffold(
//       body: CustomScrollView(
//         slivers: [
//           /// Header
//           SliverToBoxAdapter(
//             child: BackgroundContainer(
//               borderRadius: const BorderRadius.only(
//                 bottomLeft: Radius.circular(24),
//                 bottomRight: Radius.circular(24),
//               ),
//               // height: headerHeight,
//               child: SafeArea(
//                 top: false,
//                 bottom: false,
//                 child: Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 16.w),
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       const Spacer(),
//                       Text(
//                         "Transform With Structured Programs",
//                         textAlign: TextAlign.center,
//                         style: AppTextStyles.headingLarge.copyWith(
//                           color: Colors.white,
//                           fontSize: isTab ? 16.sp : 22.sp,
//                         ),
//                       ),
//                       SizedBox(height: isLandscape ? 6 : 12),
//                       Text(
//                         "Choose from expert-designed fitness, yoga, and nutrition plans tailored to your goals.",
//                         textAlign: TextAlign.center,
//                         style: AppTextStyles.subheading.copyWith(
//                           color: Colors.white70,
//                           fontSize: isTab ? 10.sp : 12.sp,
//                         ),
//                       ),
//                       const Spacer(),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),

//           /// Category title
//           SliverToBoxAdapter(
//             child: Padding(
//               padding: EdgeInsets.fromLTRB(16.w, 10, 16.w, 5),
//               child: Text(
//                 "Browse by Category",
//                 style: AppTextStyles.headingMedium.copyWith(
//                   fontWeight: FontWeight.w900,
//                   fontSize: isTab ? 14.sp : null,
//                 ),
//               ),
//             ),
//           ),

//           /// Category chips
//           SliverToBoxAdapter(
//             child: SizedBox(
//               height: chipListHeight,
//               child: ListView.builder(
//                 scrollDirection: Axis.horizontal,
//                 itemCount: categories.length,
//                 padding: EdgeInsets.symmetric(horizontal: 16.w),
//                 itemBuilder: (context, index) {
//                   final isSelected = selectedIndex == index;
//                   return GestureDetector(
//                     onTap: () =>
//                         ref.read(categoryProvider.notifier).setIndex(index),
//                     child: Container(
//                       margin: EdgeInsets.only(right: 10.w),
//                       padding: EdgeInsets.symmetric(
//                         horizontal: isTab ? 18.0 : 14.0,
//                         vertical: 6,
//                       ),
//                       decoration: BoxDecoration(
//                         color: isSelected ? Colors.blue : Colors.grey.shade200,
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                       child: Center(
//                         child: Text(
//                           categories[index],
//                           style: TextStyle(
//                             color: isSelected ? Colors.white : Colors.black,
//                             fontWeight: FontWeight.w600,
//                             fontSize: isTab ? 10.sp : 12.sp,
//                           ),
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ),

//           /// Plans grid
//           SliverPadding(
//             padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10),
//             sliver: const SliverToBoxAdapter(child: FitnessPlansScreen()),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:fitiq/core/theame/app_text_styles.dart';
import 'package:fitiq/core/widgets/blue_container_wraper.dart';
import 'package:fitiq/views/auth/Screens/login_screen.dart';
import 'package:fitiq/views/plans/provider/category_provider.dart';
import 'package:fitiq/views/plans/screens/finaness_plan_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ProgramsScreen extends ConsumerStatefulWidget {
  const ProgramsScreen({super.key});

  @override
  ConsumerState<ProgramsScreen> createState() => _ProgramsScreenState();
}

class _ProgramsScreenState extends ConsumerState<ProgramsScreen> {
  LatLng? destination;

  @override
  void initState() {
    super.initState();

    // _loadLocation(); // call here
  }

  // Future<void> _loadLocation() async {
  //   final latLng = await getLatLngFromShortUrl(
  //     "https://maps.app.goo.gl/ofZaduJMubVsTrdv7",
  //   );
  //   if (!mounted) {
  //     return;
  //   }
  //   setState(() {
  //     destination = latLng;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final selectedIndex = ref.watch(categoryProvider);
    final isTab = checkTablet(context);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // ── Header ──────────────────────────────────────────────────────────
          // No height at all — BackgroundContainer wraps its Column content.
          // SafeArea(top:true) handles the status bar so text never goes under it.
          // Vertical padding creates the visual breathing room on every device.
          SliverToBoxAdapter(
            child: BackgroundContainer(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(24),
                bottomRight: Radius.circular(24),
              ),
              child: SafeArea(
                // top: true  → respects status bar height automatically
                // bottom: false → we don't need safe area at the bottom
                bottom: false,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    // fixed vertical padding — works on all sizes & orientations
                    vertical: isTab ? 28.0 : 22.0,
                  ),
                  child: Column(
                    // mainAxisSize.min → column wraps its children, no Spacer needed
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Transform With Structured Programs",
                        textAlign: TextAlign.center,
                        style: AppTextStyles.headingLarge.copyWith(
                          color: Colors.white,
                          fontSize: isTab ? 16.sp : 22.sp,
                        ),
                      ),
                      SizedBox(height: isTab ? 10.0 : 8.0),
                      Text(
                        "Choose from expert-designed fitness, yoga, and "
                        "nutrition plans tailored to your goals.",
                        textAlign: TextAlign.center,
                        style: AppTextStyles.subheading.copyWith(
                          color: Colors.white70,
                          fontSize: isTab ? 10.sp : 12.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // ── "Browse by Category" label ───────────────────────────────────
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.fromLTRB(16.w, 14, 16.w, 6),
              child: Text(
                "Browse by Category",
                style: AppTextStyles.headingMedium.copyWith(
                  fontWeight: FontWeight.w900,
                  fontSize: isTab ? 14.sp : null,
                ),
              ),
            ),
          ),

          // ── Category chips ───────────────────────────────────────────────
          // Height is just enough for one chip row.
          // Fixed px (not .h) so it never misbehaves on orientation change.
          SliverToBoxAdapter(
            child: SizedBox(
              height: isTab ? 52.0 : 44.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                itemBuilder: (context, index) {
                  final isSelected = selectedIndex == index;
                  return GestureDetector(
                    onTap: () =>
                        ref.read(categoryProvider.notifier).setIndex(index),
                    child: Container(
                      margin: EdgeInsets.only(right: 10.w),
                      padding: EdgeInsets.symmetric(
                        horizontal: isTab ? 18.0 : 14.0,
                        vertical: 6.0,
                      ),
                      decoration: BoxDecoration(
                        color: isSelected ? Colors.blue : Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          categories[index],
                          style: TextStyle(
                            color: isSelected ? Colors.white : Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: isTab ? 10.sp : 12.sp,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),

          // ── Plans grid ───────────────────────────────────────────────────
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10),
            sliver: const SliverToBoxAdapter(child: FitnessPlansScreen()),
          ),
        ],
      ),
    );
  }
}
