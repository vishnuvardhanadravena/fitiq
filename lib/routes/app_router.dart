import 'dart:math';
import 'package:fitiq/views/Notifications/Screens/notificationScreen.dart';
import 'package:fitiq/views/PrivacyPolicy/screens/privacy_policy_screen.dart';
import 'package:fitiq/views/profile/screens/edit_profile.dart';
import 'package:fitiq/views/support/screens/support.dart';
import 'package:fitiq/views/user_info/screens/main_step_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:fitiq/routes/route_constants.dart';
import 'package:fitiq/views/Subscription/views/subscription.dart';
import 'package:fitiq/views/auth/Screens/forgot_password.dart';
import 'package:fitiq/views/auth/Screens/landing_pages.dart';
import 'package:fitiq/views/auth/Screens/login_screen.dart';
import 'package:fitiq/views/auth/Screens/signup_screen.dart';
import 'package:fitiq/views/auth/Screens/splash_screen.dart';
import 'package:fitiq/views/dashborad/dashboard_screen.dart';
import 'package:fitiq/views/payments/screens/payment_hostory.dart';
import 'package:fitiq/views/plans/screens/payment_sucesess.dart';
import 'package:fitiq/views/plans/screens/plan_detailes.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter appRouter = GoRouter(
  initialLocation: RouteList.splash,
  navigatorKey: rootNavigatorKey,
  routes: [
    GoRoute(
      path: RouteList.splash,
      name: RouteList.splash,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: RouteList.signup,
      name: RouteList.signup,
      builder: (context, state) => const SignupScreen(),
    ),
    GoRoute(
      path: RouteList.login,
      name: RouteList.login,
      builder: (context, state) => const FitiqSignInScreen(),
    ),
    GoRoute(
      path: RouteList.onboarding,
      name: RouteList.onboarding,
      builder: (context, state) => const OnboardingScreen(),
    ),
    GoRoute(
      path: RouteList.stepscreens,
      name: RouteList.stepscreens,
      builder: (context, state) => const StepFlowScreen(),
    ),

    GoRoute(
      path: RouteList.home,
      name: RouteList.home,
      builder: (context, state) => const DashboardScreen(),
    ),
    GoRoute(
      path: RouteList.editProfile,
      name: RouteList.editProfile,
      builder: (context, state) => const EditProfileScreen(),
    ),
    GoRoute(
      path: RouteList.planDetails,
      name: RouteList.planDetails,
      builder: (context, state) {
        final data = state.extra as Map<String, dynamic>;
        final planId = data["planId"] as String;
        return FitnessPlanDetailScreen(planId: planId);
      },
    ),
    GoRoute(
      path: RouteList.forgotPassword,
      name: RouteList.forgotPassword,
      builder: (context, state) => const ForgotPassword(),
    ),
    // GoRoute(
    //   path: RouteList.changePassword,
    //   name: RouteList.changePassword,
    //   builder: (context, state) => const SubscriptionScreen(),
    // ),
    GoRoute(
      path: RouteList.paymentsuccess,
      name: RouteList.paymentsuccess,
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: const EnrollmentSuccessScreen(),
          transitionDuration: const Duration(milliseconds: 1000),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            final size = MediaQuery.of(context).size;
            final maxRadius = sqrt(
              (size.width * size.width) + (size.height * size.height),
            );
            final radius =
                CurvedAnimation(
                  parent: animation,
                  curve: Curves.easeInOut,
                ).value *
                maxRadius;

            return ClipPath(
              clipper: _CircularRevealClipper(
                radius: radius,
                center: Offset(size.width / 2, size.height / 2),
              ),
              child: child,
            );
          },
        );
      },
    ),
    GoRoute(
      path: RouteList.paymenthistory,
      name: RouteList.paymenthistory,
      builder: (context, state) => PaymentHistoryScreen(),
    ),
    GoRoute(
      path: RouteList.subscription,
      name: RouteList.subscription,
      builder: (context, state) => SubscriptionScreen(),
    ),
    GoRoute(
      path: RouteList.notificationSettigs,
      name: RouteList.notificationSettigs,
      builder: (context, state) => NotificationsScreen(),
    ),
    GoRoute(
      path: RouteList.privacy,
      name: RouteList.privacy,
      builder: (context, state) => PrivacyPolicyScreen(),
    ),
    GoRoute(
      path: RouteList.help,
      name: RouteList.help,
      builder: (context, state) => SupportScreen(),
    ),
  ],
);

class _CircularRevealClipper extends CustomClipper<Path> {
  final double radius;
  final Offset center;

  _CircularRevealClipper({required this.radius, required this.center});

  @override
  Path getClip(Size size) =>
      Path()..addOval(Rect.fromCircle(center: center, radius: radius));

  @override
  bool shouldReclip(_CircularRevealClipper old) =>
      old.radius != radius || old.center != center;
}
