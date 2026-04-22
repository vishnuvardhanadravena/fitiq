import 'package:fitiq/core/constants/app_assets.dart';
import 'package:fitiq/core/providers/shared_prefs_provider.dart';
import 'package:fitiq/core/theame/app_colors.dart';
import 'package:fitiq/core/widgets/primary_button.dart';
import 'package:fitiq/routes/route_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class OnboardingPageData {
  final String imageAsset;
  final Color imageOverlayColor;
  final String title;
  final String subtitle;
  final bool isLastPage;

  const OnboardingPageData({
    required this.imageAsset,
    required this.imageOverlayColor,
    required this.title,
    this.subtitle = '',
    this.isLastPage = false,
  });
}

final List<OnboardingPageData> onboardingPages = [
  const OnboardingPageData(
    imageAsset: AppAssets.landing1,
    imageOverlayColor: Color(0xFF2D1B1B),
    title: 'Personalized Diet Plans\nThat Work',
    subtitle: 'Tailored nutrition for your body type and goals',
  ),
  const OnboardingPageData(
    imageAsset: AppAssets.landing2,
    imageOverlayColor: Color(0xFF1B2D2A),
    title: 'Train with Certified Yoga\n& Fitness Experts',
    subtitle: 'World-class trainers at your fingertips',
  ),
  const OnboardingPageData(
    imageAsset: AppAssets.landing3,
    imageOverlayColor: Color(0xFF1B1B2D),
    title: 'Track Progress.Stay\n Motivated.',
    subtitle: 'Celebrate every milestone on your journey',
    isLastPage: true,
  ),
];

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  void _nextPage() {
    if (_currentPage < onboardingPages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _getStarted() async {
    final prefs = ref.read(sharedPrefsProvider);
    await prefs.setBool('isFirstTime', false);
    if (!mounted) return;
    context.pushReplacementNamed(RouteList.login);
  }

  void _skip() {
    context.go(RouteList.login);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: onboardingPages.length,
            onPageChanged: (index) => setState(() => _currentPage = index),
            itemBuilder: (context, index) {
              return _OnboardingPage(data: onboardingPages[index]);
            },
          ),

          SafeArea(
            child: Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: _skip,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 7,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(100.r),
                    ),
                    child: Text(
                      'Skip',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),

          // ── Gradient overlay (IgnorePointer so swipe passes through) ──
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            height: height * 0.6,
            child: IgnorePointer(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.white.withValues(alpha: 0.99),
                      Colors.white,
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: _BottomControls(
              currentPage: _currentPage,
              totalPages: onboardingPages.length,
              isLastPage: onboardingPages[_currentPage].isLastPage,
              onNext: _nextPage,
              onGetStarted: _getStarted,
            ),
          ),
        ],
      ),
    );
  }
}

class _OnboardingPage extends StatelessWidget {
  final OnboardingPageData data;
  const _OnboardingPage({required this.data});
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Positioned(
          left: 0,
          right: 0,
          top: 0,
          height: height * 0.8,
          child: Image.asset(data.imageAsset, fit: BoxFit.cover),
        ),
      ],
    );
  }
}

class _BottomControls extends StatelessWidget {
  final int currentPage;
  final int totalPages;
  final bool isLastPage;
  final VoidCallback onNext;
  final VoidCallback onGetStarted;

  const _BottomControls({
    required this.currentPage,
    required this.totalPages,
    required this.isLastPage,
    required this.onNext,
    required this.onGetStarted,
  });

  @override
  Widget build(BuildContext context) {
    final page = onboardingPages[currentPage];

    return Padding(
      padding: const EdgeInsets.only(left: 28, right: 28, bottom: 40),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            textAlign: TextAlign.center,
            page.title,
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: 26,
              fontWeight: FontWeight.w800,
              height: 1.25,
              letterSpacing: -0.5,
            ),
          ),
          SizedBox(height: 30.h),
          _PageDots(current: currentPage, total: totalPages),
          SizedBox(height: 50.h),
          Row(
            children: [
              const Spacer(),
              // isLastPage
              //     ? AppButton(
              //         label: 'Get Started',
              //         onPressed: onGetStarted,
              //         variant: ButtonVariant.primary,
              //         size: ButtonSize.large,
              //         shape: ButtonShape.pill,
              //         isFullWidth: false,
              //         suffixIcon: Icons.arrow_forward_rounded,
              //         // FIX: use a wider explicit width that fits
              //         // "Get Started" + icon at any text scale
              //         width: MediaQuery.of(context).size.width * 0.6,
              //       )
              //     :
              AppButton(
                label: isLastPage ? 'Get Started' : 'Next',
                onPressed: isLastPage ? onGetStarted : onNext,
                variant: ButtonVariant.primary,
                size: ButtonSize.large,
                shape: ButtonShape.pill,
                isFullWidth: false,
                suffixIcon: Icons.arrow_forward_rounded,
                // width: 150.w,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _PageDots extends StatelessWidget {
  final int current;
  final int total;

  const _PageDots({required this.current, required this.total});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(total, (index) {
        final isActive = index == current;
        return Container(
          margin: const EdgeInsets.only(right: 6),
          width: isActive ? 24 : 8,
          height: 8,
          decoration: BoxDecoration(
            color: isActive
                ? const Color(0xFFE8175D)
                : Colors.white.withValues(alpha: 0.3),
            borderRadius: BorderRadius.circular(100),
          ),
        );
      }),
    );
  }
}
// import 'package:flutter/material.dart';

// /// 🔹 DATA MODEL
// class OnboardingPageData {
//   final String image;
//   final String title;
//   final String subtitle;

//   const OnboardingPageData({
//     required this.image,
//     required this.title,
//     required this.subtitle,
//   });
// }

// /// 🔹 DATA
// final pages = [
//   const OnboardingPageData(
//     image: 'assets/1.png',
//     title: 'Personalized Diet Plans That Work',
//     subtitle: 'Tailored nutrition for your body type',
//   ),
//   const OnboardingPageData(
//     image: 'assets/2.png',
//     title: 'Train with Experts',
//     subtitle: 'World-class trainers at your fingertips',
//   ),
//   const OnboardingPageData(
//     image: 'assets/3.png',
//     title: 'Track Progress',
//     subtitle: 'Stay motivated every day',
//   ),
// ];

// /// 🔹 MAIN SCREEN
// class OnboardingScreen extends StatefulWidget {
//   const OnboardingScreen({super.key});

//   @override
//   State<OnboardingScreen> createState() => _OnboardingScreenState();
// }

// class _OnboardingScreenState extends State<OnboardingScreen> {
//   final PageController controller = PageController();
//   int current = 0;

//   void next() {
//     if (current < pages.length - 1) {
//       controller.nextPage(
//         duration: const Duration(milliseconds: 300),
//         curve: Curves.ease,
//       );
//     }
//   }

//   void skip() {
//     controller.jumpToPage(pages.length - 1);
//   }

//   void done() {
//     debugPrint("Navigate to Home");
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           /// ✅ PAGE VIEW (SWIPE WORKS)
//           PageView.builder(
//             controller: controller,
//             physics: const BouncingScrollPhysics(),
//             itemCount: pages.length,
//             onPageChanged: (i) => setState(() => current = i),
//             itemBuilder: (_, i) => _Page(data: pages[i]),
//           ),

//           /// ✅ GRADIENT (NO BLOCK)
//           IgnorePointer(
//             child: Container(
//               decoration: const BoxDecoration(
//                 gradient: LinearGradient(
//                   begin: Alignment.bottomCenter,
//                   end: Alignment.center,
//                   colors: [
//                     Colors.white,
//                     Colors.white70,
//                     Colors.transparent,
//                   ],
//                 ),
//               ),
//             ),
//           ),

//           /// ✅ SKIP BUTTON
//           SafeArea(
//             child: Align(
//               alignment: Alignment.topRight,
//               child: TextButton(
//                 onPressed: skip,
//                 child: const Text("Skip"),
//               ),
//             ),
//           ),

//           /// ✅ BOTTOM CONTROLS
//           Align(
//             alignment: Alignment.bottomCenter,
//             child: Padding(
//               padding: const EdgeInsets.all(24),
//               child: _Bottom(
//                 current: current,
//                 total: pages.length,
//                 isLast: current == pages.length - 1,
//                 onNext: next,
//                 onDone: done,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// /// 🔹 PAGE UI
// class _Page extends StatelessWidget {
//   final OnboardingPageData data;

//   const _Page({required this.data});

//   @override
//   Widget build(BuildContext context) {
//     return Positioned.fill(
//       child: Image.asset(
//         data.image,
//         fit: BoxFit.cover,
//       ),
//     );
//   }
// }

// /// 🔹 BOTTOM CONTROLS
// class _Bottom extends StatelessWidget {
//   final int current;
//   final int total;
//   final bool isLast;
//   final VoidCallback onNext;
//   final VoidCallback onDone;

//   const _Bottom({
//     required this.current,
//     required this.total,
//     required this.isLast,
//     required this.onNext,
//     required this.onDone,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final page = pages[current];

//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         /// 🔹 TEXT (DOESN'T BLOCK SWIPE)
//         IgnorePointer(
//           ignoring: true,
//           child: Column(
//             children: [
//               Text(
//                 page.title,
//                 textAlign: TextAlign.center,
//                 style: const TextStyle(
//                   fontSize: 26,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               const SizedBox(height: 10),
//               Text(
//                 page.subtitle,
//                 textAlign: TextAlign.center,
//               ),
//               const SizedBox(height: 20),
//               _Dots(current: current, total: total),
//             ],
//           ),
//         ),

//         const SizedBox(height: 30),

//         /// 🔹 BUTTON (ONLY CLICKABLE AREA)
//         SizedBox(
//           width: double.infinity,
//           child: ElevatedButton(
//             onPressed: isLast ? onDone : onNext,
//             style: ElevatedButton.styleFrom(
//               padding: const EdgeInsets.symmetric(vertical: 14),
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Flexible(
//                   child: Text(
//                     isLast ? "Get Started" : "Next",
//                     overflow: TextOverflow.ellipsis,
//                   ),
//                 ),
//                 const SizedBox(width: 8),
//                 const Icon(Icons.arrow_forward),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

// /// 🔹 DOT INDICATOR
// class _Dots extends StatelessWidget {
//   final int current;
//   final int total;

//   const _Dots({required this.current, required this.total});

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: List.generate(total, (i) {
//         final active = i == current;
//         return AnimatedContainer(
//           duration: const Duration(milliseconds: 250),
//           margin: const EdgeInsets.symmetric(horizontal: 4),
//           width: active ? 20 : 8,
//           height: 8,
//           decoration: BoxDecoration(
//             color: active ? Colors.pink : Colors.grey,
//             borderRadius: BorderRadius.circular(20),
//           ),
//         );
//       }),
//     );
//   }
// }
