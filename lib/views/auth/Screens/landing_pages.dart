// import 'package:fitiq/core/widgets/primary_button.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// class OnboardingPageData {
//   final String imageAsset; // Replace with your real assets
//   final Color imageOverlayColor;
//   final String title;
//   final String subtitle;
//   final bool isLastPage;

//   const OnboardingPageData({
//     required this.imageAsset,
//     required this.imageOverlayColor,
//     required this.title,
//     this.subtitle = '',
//     this.isLastPage = false,
//   });
// }

// final List<OnboardingPageData> onboardingPages = [
//   const OnboardingPageData(
//     imageAsset: 'assets/images/onboarding_diet.jpg',
//     imageOverlayColor: Color(0xFF2D1B1B),
//     title: 'Personalized Diet Plans\nThat Work',
//     subtitle: 'Tailored nutrition for your body type and goals',
//     isLastPage: false,
//   ),
//   const OnboardingPageData(
//     imageAsset: 'assets/images/onboarding_yoga.jpg',
//     imageOverlayColor: Color(0xFF1B2D2A),
//     title: 'Train with Certified Yoga\n& Fitness Experts',
//     subtitle: 'World-class trainers at your fingertips',
//     isLastPage: false,
//   ),
//   const OnboardingPageData(
//     imageAsset: 'assets/images/onboarding_progress.jpg',
//     imageOverlayColor: Color(0xFF1B1B2D),
//     title: 'Track Progress.\nStay Motivated.',
//     subtitle: 'Celebrate every milestone on your journey',
//     isLastPage: true,
//   ),
// ];

// class OnboardingScreen extends StatefulWidget {
//   const OnboardingScreen({super.key});

//   @override
//   State<OnboardingScreen> createState() => _OnboardingScreenState();
// }

// class _OnboardingScreenState extends State<OnboardingScreen>
//     with TickerProviderStateMixin {
//   final PageController _pageController = PageController();
//   int _currentPage = 0;
//   bool _isNextLoading = false;

//   late AnimationController _fadeController;
//   late Animation<double> _fadeAnimation;

//   @override
//   void initState() {
//     super.initState();
//     _fadeController = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 400),
//     );
//     _fadeAnimation = CurvedAnimation(
//       parent: _fadeController,
//       curve: Curves.easeOut,
//     );
//     _fadeController.forward();
//   }

//   @override
//   void dispose() {
//     _pageController.dispose();
//     _fadeController.dispose();
//     super.dispose();
//   }

//   void _nextPage() async {
//     if (_currentPage < onboardingPages.length - 1) {
//       setState(() => _isNextLoading = true);
//       await Future.delayed(const Duration(milliseconds: 400));
//       setState(() => _isNextLoading = false);
//       _pageController.nextPage(
//         duration: const Duration(milliseconds: 500),
//         curve: Curves.easeInOutCubic,
//       );
//     }
//   }

//   void _getStarted() {
//     // Navigate to your home/auth screen
//     ScaffoldMessenger.of(context).showSnackBar(
//       const SnackBar(content: Text('Welcome to FitLife! 🎉')),
//     );
//   }

//   void _skip() {
//     _pageController.animateToPage(
//       onboardingPages.length - 1,
//       duration: const Duration(milliseconds: 500),
//       curve: Curves.easeInOutCubic,
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: Stack(
//         children: [
//           // ── Page View ──────────────────────────────────────────────
//           PageView.builder(
//             controller: _pageController,
//             itemCount: onboardingPages.length,
//             onPageChanged: (index) {
//               setState(() => _currentPage = index);
//               _fadeController.forward(from: 0);
//             },
//             itemBuilder: (context, index) {
//               return _OnboardingPage(data: onboardingPages[index]);
//             },
//           ),

//           // ── Skip Button ────────────────────────────────────────────
//           SafeArea(
//             child: Align(
//               alignment: Alignment.topRight,
//               child: AnimatedOpacity(
//                 opacity: _currentPage < onboardingPages.length - 1 ? 1.0 : 0.0,
//                 duration: const Duration(milliseconds: 300),
//                 child: Padding(
//                   padding: const EdgeInsets.only(top: 12, right: 20),
//                   child: AppButton(
//                     label: 'Skip',
//                     onPressed: _skip,
//                     variant: ButtonVariant.ghost,
//                     size: ButtonSize.small,
//                     shape: ButtonShape.pill,
//                     isFullWidth: false,
//                     foregroundColor: Colors.white,
//                     labelStyle: const TextStyle(fontWeight: FontWeight.w500),
//                     backgroundColor: Colors.white.withOpacity(0.2),
//                   ),
//                 ),
//               ),
//             ),
//           ),

//           // ── Bottom Controls ────────────────────────────────────────
//           Positioned(
//             left: 0,
//             right: 0,
//             bottom: 0,
//             child: _BottomControls(
//               currentPage: _currentPage,
//               totalPages: onboardingPages.length,
//               isLastPage: onboardingPages[_currentPage].isLastPage,
//               isLoading: _isNextLoading,
//               onNext: _nextPage,
//               onGetStarted: _getStarted,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class _OnboardingPage extends StatelessWidget {
//   final OnboardingPageData data;

//   const _OnboardingPage({required this.data});

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;

//     return Stack(
//       fit: StackFit.expand,
//       children: [
//         _PlaceholderImage(color: data.imageOverlayColor),

//         DecoratedBox(
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               begin: Alignment.topCenter,
//               end: Alignment.bottomCenter,
//               stops: const [0.0, 0.4, 0.65, 1.0],
//               colors: [
//                 Colors.black.withOpacity(0.05),
//                 Colors.black.withOpacity(0.0),
//                 Colors.black.withOpacity(0.5),
//                 Colors.black.withOpacity(0.95),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

// /// Swap this with Image.asset(...) in your real app
// class _PlaceholderImage extends StatelessWidget {
//   final Color color;
//   const _PlaceholderImage({required this.color});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           colors: [
//             color.withOpacity(0.8),
//             color,
//             Colors.black,
//           ],
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//         ),
//       ),
//       child: Center(
//         child: Icon(
//           Icons.fitness_center,
//           size: 100,
//           color: Colors.white.withOpacity(0.1),
//         ),
//       ),
//     );
//   }
// }

// class _BottomControls extends StatelessWidget {
//   final int currentPage;
//   final int totalPages;
//   final bool isLastPage;
//   final bool isLoading;
//   final VoidCallback onNext;
//   final VoidCallback onGetStarted;

//   const _BottomControls({
//     required this.currentPage,
//     required this.totalPages,
//     required this.isLastPage,
//     required this.isLoading,
//     required this.onNext,
//     required this.onGetStarted,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final page = onboardingPages[currentPage];

//     return Container(
//       padding: const EdgeInsets.fromLTRB(28, 32, 28, 48),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           AnimatedSwitcher(
//             duration: const Duration(milliseconds: 400),
//             transitionBuilder: (child, animation) => FadeTransition(
//               opacity: animation,
//               child: SlideTransition(
//                 position: Tween<Offset>(
//                   begin: const Offset(0, 0.15),
//                   end: Offset.zero,
//                 ).animate(animation),
//                 child: child,
//               ),
//             ),
//             child: Text(
//               page.title,
//               key: ValueKey(currentPage),
//               style: const TextStyle(
//                 color: Colors.white,
//                 fontSize: 26,
//                 fontWeight: FontWeight.w800,
//                 height: 1.25,
//                 letterSpacing: -0.5,
//               ),
//             ),
//           ),

//           if (page.subtitle.isNotEmpty) ...[
//             const SizedBox(height: 10),
//             AnimatedSwitcher(
//               duration: const Duration(milliseconds: 400),
//               child: Text(
//                 page.subtitle,
//                 key: ValueKey('sub_$currentPage'),
//                 style: TextStyle(
//                   color: Colors.white.withOpacity(0.6),
//                   fontSize: 14,
//                   fontWeight: FontWeight.w400,
//                   height: 1.5,
//                 ),
//               ),
//             ),
//           ],

//           const SizedBox(height: 28),

//           Row(
//             children: [
//               // Dots
//               _PageDots(
//                 current: currentPage,
//                 total: totalPages,
//               ),

//               const Spacer(),

//               // Action Button — using AppButton
//               AnimatedSwitcher(
//                 duration: const Duration(milliseconds: 300),
//                 child: isLastPage
//                     ? AppButton(
//                         key: const ValueKey('get_started'),
//                         label: 'Get Started',
//                         onPressed: onGetStarted,
//                         variant: ButtonVariant.primary,
//                         size: ButtonSize.medium,
//                         shape: ButtonShape.pill,
//                         isFullWidth: false,
//                         suffixIcon: Icons.arrow_forward_rounded,
//                         width: 180,
//                       )
//                     : AppButton(
//                         key: const ValueKey('next'),
//                         label: 'Next',
//                         onPressed: onNext,
//                         variant: ButtonVariant.primary,
//                         size: ButtonSize.medium,
//                         shape: ButtonShape.pill,
//                         isFullWidth: false,
//                         isLoading: isLoading,
//                         loadingText: 'Next',
//                         suffixIcon: Icons.arrow_forward_rounded,
//                         width: 140,
//                       ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

// // ─────────────────────────────────────────────────────────────────────────────
// // PAGE INDICATOR DOTS
// // ─────────────────────────────────────────────────────────────────────────────

// class _PageDots extends StatelessWidget {
//   final int current;
//   final int total;

//   const _PageDots({required this.current, required this.total});

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: List.generate(total, (index) {
//         final isActive = index == current;
//         return AnimatedContainer(
//           duration: const Duration(milliseconds: 300),
//           curve: Curves.easeInOutCubic,
//           margin: const EdgeInsets.only(right: 6),
//           width: isActive ? 24 : 8,
//           height: 8,
//           decoration: BoxDecoration(
//             color: isActive
//                 ? const Color(0xFFE8175D)
//                 : Colors.white.withOpacity(0.3),
//             borderRadius: BorderRadius.circular(100),
//           ),
//         );
//       }),
//     );
//   }
// }

// // ─────────────────────────────────────────────────────────────────────────────
// // BUTTON SHOWCASE SCREEN — Demo of all AppButton options
// // ─────────────────────────────────────────────────────────────────────────────

// class ButtonShowcaseScreen extends StatefulWidget {
//   const ButtonShowcaseScreen({super.key});

//   @override
//   State<ButtonShowcaseScreen> createState() => _ButtonShowcaseScreenState();
// }

// class _ButtonShowcaseScreenState extends State<ButtonShowcaseScreen> {
//   bool _loading = false;

//   void _simulateLoad() async {
//     setState(() => _loading = true);
//     await Future.delayed(const Duration(seconds: 2));
//     setState(() => _loading = false);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFF8F9FA),
//       appBar: AppBar(
//         title: const Text('AppButton Showcase',
//             style: TextStyle(fontWeight: FontWeight.w700)),
//         backgroundColor: Colors.white,
//         foregroundColor: const Color(0xFF1A1A2E),
//         elevation: 0,
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(24),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             _sectionTitle('Variants'),
//             const SizedBox(height: 12),
//             AppButton(
//               label: 'Primary Button',
//               onPressed: () {},
//               variant: ButtonVariant.primary,
//             ),
//             const SizedBox(height: 12),
//             AppButton(
//               label: 'Secondary Button',
//               onPressed: () {},
//               variant: ButtonVariant.secondary,
//             ),
//             const SizedBox(height: 12),
//             AppButton(
//               label: 'Outline Button',
//               onPressed: () {},
//               variant: ButtonVariant.outline,
//             ),
//             const SizedBox(height: 12),
//             AppButton(
//               label: 'Ghost Button',
//               onPressed: () {},
//               variant: ButtonVariant.ghost,
//             ),
//             const SizedBox(height: 12),
//             AppButton(
//               label: 'Danger Button',
//               onPressed: () {},
//               variant: ButtonVariant.danger,
//             ),
//             const SizedBox(height: 12),
//             AppButton(
//               label: 'Success Button',
//               onPressed: () {},
//               variant: ButtonVariant.success,
//             ),
//             const SizedBox(height: 12),
//             AppButton(
//               label: 'Text Button',
//               onPressed: () {},
//               variant: ButtonVariant.text,
//             ),

//             const SizedBox(height: 32),
//             _sectionTitle('Sizes'),
//             const SizedBox(height: 12),
//             AppButton(label: 'Small', onPressed: () {}, size: ButtonSize.small),
//             const SizedBox(height: 12),
//             AppButton(
//                 label: 'Medium', onPressed: () {}, size: ButtonSize.medium),
//             const SizedBox(height: 12),
//             AppButton(label: 'Large', onPressed: () {}, size: ButtonSize.large),
//             const SizedBox(height: 12),
//             AppButton(
//                 label: 'Extra Large',
//                 onPressed: () {},
//                 size: ButtonSize.extraLarge),

//             const SizedBox(height: 32),
//             _sectionTitle('Shapes'),
//             const SizedBox(height: 12),
//             AppButton(
//                 label: 'Pill Shape', onPressed: () {}, shape: ButtonShape.pill),
//             const SizedBox(height: 12),
//             AppButton(
//                 label: 'Rounded Shape',
//                 onPressed: () {},
//                 shape: ButtonShape.rounded),
//             const SizedBox(height: 12),
//             AppButton(
//                 label: 'Square Shape',
//                 onPressed: () {},
//                 shape: ButtonShape.square),

//             const SizedBox(height: 32),
//             _sectionTitle('With Icons'),
//             const SizedBox(height: 12),
//             AppButton(
//               label: 'Prefix Icon',
//               onPressed: () {},
//               prefixIcon: Icons.star_rounded,
//             ),
//             const SizedBox(height: 12),
//             AppButton(
//               label: 'Suffix Icon',
//               onPressed: () {},
//               suffixIcon: Icons.arrow_forward_rounded,
//             ),
//             const SizedBox(height: 12),
//             AppButton(
//               label: 'Both Icons',
//               onPressed: () {},
//               prefixIcon: Icons.favorite_rounded,
//               suffixIcon: Icons.arrow_forward_rounded,
//             ),

//             const SizedBox(height: 32),
//             _sectionTitle('States'),
//             const SizedBox(height: 12),
//             AppButton(
//               label: 'Loading State',
//               onPressed: _simulateLoad,
//               isLoading: _loading,
//               loadingText: 'Processing...',
//             ),
//             const SizedBox(height: 12),
//             AppButton(
//               label: 'Disabled State',
//               onPressed: () {},
//               isDisabled: true,
//             ),

//             const SizedBox(height: 32),
//             _sectionTitle('Custom Gradient'),
//             const SizedBox(height: 12),
//             AppButton(
//               label: 'Custom Gradient',
//               onPressed: () {},
//               gradient: const LinearGradient(
//                 colors: [Color(0xFF667EEA), Color(0xFF764BA2)],
//                 begin: Alignment.centerLeft,
//                 end: Alignment.centerRight,
//               ),
//             ),

//             const SizedBox(height: 32),
//             _sectionTitle('Not Full Width'),
//             const SizedBox(height: 12),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 AppButton(
//                   label: 'Cancel',
//                   onPressed: () {},
//                   variant: ButtonVariant.outline,
//                   isFullWidth: false,
//                   width: 130,
//                 ),
//                 const SizedBox(width: 12),
//                 AppButton(
//                   label: 'Confirm',
//                   onPressed: () {},
//                   isFullWidth: false,
//                   width: 130,
//                 ),
//               ],
//             ),

//             const SizedBox(height: 48),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _sectionTitle(String title) {
//     return Text(
//       title,
//       style: const TextStyle(
//         fontSize: 18,
//         fontWeight: FontWeight.w700,
//         color: Color(0xFF1A1A2E),
//         letterSpacing: -0.3,
//       ),
//     );
//   }
// }
import 'package:fitiq/core/constants/app_assets.dart';
import 'package:fitiq/core/theame/app_colors.dart';
import 'package:fitiq/core/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ─────────────────────────────────────────────────────────────────────────────
// DATA MODEL
// ─────────────────────────────────────────────────────────────────────────────

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

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
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

  void _getStarted() {
    // Navigate to your home/auth screen
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Welcome to FitIQ! 🎉')),
    );
  }

  void _skip() {
    _pageController.jumpToPage(onboardingPages.length - 1);
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

          // if (_currentPage < onboardingPages.length - 1)
          SafeArea(
            child: Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: _skip,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 7),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
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

          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            height: height * 0.65,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,

                    Colors.white.withValues(alpha: 0.99),
                    Colors.white, // strong bottom
                  ],
                ),
              ),
            ),
          ),
          // ── Bottom Controls ────────────────────────────────────────
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
        /// 🔹 Background Image (Fixed Height)
        Positioned(
          left: 0,
          right: 0,
          top: 0,
          height: height * 0.7,
          child: Image.asset(
            data.imageAsset,
            fit: BoxFit.cover,
          ),
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
          // Title
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

          // Increase space between subtitle and button
          SizedBox(height: 20.h),
          _PageDots(current: currentPage, total: totalPages),
          SizedBox(height: 70.h),
          Row(
            children: [
              const Spacer(),
              isLastPage
                  ? AppButton(
                      label: 'Get Started',
                      onPressed: onGetStarted,
                      variant: ButtonVariant.primary,
                      size: ButtonSize.medium,
                      shape: ButtonShape.pill,
                      isFullWidth: false,
                      suffixIcon: Icons.arrow_forward_rounded,
                      width: 180,
                    )
                  : AppButton(
                      label: 'Next',
                      onPressed: onNext,
                      variant: ButtonVariant.primary,
                      size: ButtonSize.medium,
                      shape: ButtonShape.pill,
                      isFullWidth: false,
                      suffixIcon: Icons.arrow_forward_rounded,
                      width: 140,
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
                : Colors.white.withOpacity(0.3),
            borderRadius: BorderRadius.circular(100),
          ),
        );
      }),
    );
  }
}
