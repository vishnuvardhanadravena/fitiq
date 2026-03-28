import 'package:fitiq/core/constants/app_assets.dart';
import 'package:fitiq/core/theame/app_colors.dart';
import 'package:fitiq/core/theame/app_text_styles.dart';
import 'package:fitiq/routes/route_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _logoController;
  late AnimationController _textController;
  late AnimationController _taglineController;

  late Animation<double> _logoScale;
  late Animation<double> _logoOpacity;

  late Animation<double> _textWidth;
  late Animation<double> _textOpacity;
  late Animation<Offset> _textSlide;

  late Animation<double> _taglineOpacity;

  @override
  void initState() {
    super.initState();

    /// LOGO
    _logoController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );

    _logoScale = Tween(begin: 10.0, end: 1.5).animate(
      CurvedAnimation(parent: _logoController, curve: Curves.easeOutCubic),
    );

    _logoOpacity = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _logoController,
        curve: const Interval(0.0, 0.3),
      ),
    );

    /// TEXT
    _textController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 650),
    );

    _textWidth = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _textController, curve: Curves.easeInOut),
    );

    _textSlide = Tween(
      begin: const Offset(-0.15, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _textController, curve: Curves.easeOut));

    _textOpacity = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _textController,
        curve: const Interval(0.0, 0.4),
      ),
    );

    /// TAGLINE
    _taglineController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _taglineOpacity = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _taglineController, curve: Curves.easeIn),
    );

    _startAnimations();
  }

  Future<void> _startAnimations() async {
    await _logoController.forward();
    await Future.delayed(const Duration(milliseconds: 200));

    await _textController.forward();
    await Future.delayed(const Duration(milliseconds: 150));

    await _taglineController.forward();

    await Future.delayed(const Duration(milliseconds: 800));
    if (mounted) {
      context.go(RouteList.onboarding);
      // Navigator.pushReplacementNamed(context, '/home');
    }
  }

  @override
  void dispose() {
    _logoController.dispose();
    _textController.dispose();
    _taglineController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isTablet = constraints.maxWidth > 600;

          return Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColors.primaryStart,
                  AppColors.white,
                  AppColors.primaryEnd,
                ],
              ),
            ),
            child: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: isTablet ? 500 : double.infinity,
                ),
                child: _buildContent(isTablet),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildContent(bool isTablet) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        /// LOGO + TEXT
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ScaleTransition(
              scale: _logoScale,
              child: FadeTransition(
                opacity: _logoOpacity,
                child: Image.asset(
                  AppAssets.logo,
                  width: isTablet ? 100.w : 60.w,
                  height: isTablet ? 100.h : 60.h,
                ),
              ),
            ),
            // SizedBox(width: 8.w),
            AnimatedBuilder(
              animation: _textController,
              builder: (context, child) {
                return ClipRect(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    widthFactor: _textWidth.value,
                    child: SlideTransition(
                      position: _textSlide,
                      child: FadeTransition(
                        opacity: _textOpacity,
                        child: child,
                      ),
                    ),
                  ),
                );
              },
              child: Image.asset(
                AppAssets.logotext,
                height: isTablet ? 60.h : 90.h,
                width: isTablet ? 120.w : 120.w,
              ),
            ),
          ],
        ),

        SizedBox(height: isTablet ? 30.h : 10.h),

        /// TAGLINE
        AnimatedBuilder(
          animation: _taglineController,
          builder: (context, child) {
            return FadeTransition(
              opacity: _taglineOpacity,
              child: Column(
                children: [
                  Text(
                    'Fit IQ',
                    style: AppTextStyles.heading.copyWith(
                      color: AppColors.primaryEnd,
                      fontFamily: "Oswald",
                      fontWeight: FontWeight.bold,
                      fontSize: isTablet ? 40.sp : 34.sp,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'Nutrition. Yoga. Transformation.',
                    style: AppTextStyles.title.copyWith(
                      fontSize: isTablet ? 16.sp : 12.sp,
                    ),
                  ),
                  SizedBox(height: 6.h),
                  Container(
                    width: isTablet ? 80.w : 48.w,
                    height: 3.h,
                    decoration: BoxDecoration(
                      color: AppColors.accent,
                      borderRadius: BorderRadius.circular(2.r),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
