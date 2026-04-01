import 'dart:math';

import 'package:fitiq/routes/route_constants.dart';
import 'package:fitiq/views/auth/Screens/forgot_password.dart';
import 'package:fitiq/views/auth/Screens/landing_pages.dart';
import 'package:fitiq/views/auth/Screens/login_screen.dart';
import 'package:fitiq/views/auth/Screens/signup_screen.dart';
import 'package:fitiq/views/auth/Screens/splash_screen.dart';
import 'package:fitiq/views/dashborad/dashboard_screen.dart';
import 'package:fitiq/views/plans/screens/payment_sucesess.dart';
import 'package:fitiq/views/plans/screens/plan_detailes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();
final GoRouter appRouter = GoRouter(
  initialLocation: RouteList.splash,
  navigatorKey: rootNavigatorKey,
  // errorBuilder: (context, state) {
  //   final error = state.error;

  //   AppLogger.error(
  //     "GoRouter Error",
  //     error: error,
  //     // stackTrace: error is Error ? error.toString() : null,
  //   );

  //   return const UnknownRouteScreen();
  // },
  // redirect: (context, state) {
  //   final container = ProviderScope.containerOf(context);

  //   final storage = container.read(secureStorageProvider);
  //   final prefs = container.read(sharedPrefsProvider);
  //   final isFirstTime = prefs.getBool('isFirstTime') ?? true;
  //   final isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

  //   final isGoingToLogin = state.matchedLocation == RouteList.login;
  //   final isGoingToOnboarding = state.matchedLocation == RouteList.onboarding;

  //   if (isFirstTime && !isGoingToOnboarding) {
  //     return RouteList.onboarding;
  //   }

  //   if (!isLoggedIn && !isGoingToLogin) {
  //     return RouteList.login;
  //   }

  //   return null; // allow navigation
  // },
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

    // ShellRoute(
    //   builder: (context, state, child) {
    //     return MainNavBarScreen(child: child);
    //   },
    //   routes: [
    GoRoute(
      path: RouteList.home,
      name: RouteList.home,
      builder: (context, state) => const DashboardScreen(),
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

    //     GoRoute(
    //       path: RouteList.bookings,
    //       name: RouteList.bookings,
    //       builder: (context, state) => const BookingsScreen(),
    //     ),
    //     GoRoute(
    //       path: RouteList.profile,
    //       name: RouteList.profile,
    //       builder: (context, state) => const ProfileScreen(),
    //     ),
    //   ],
    // ),
    // GoRoute(
    //   path: RouteList.otp,
    //   name: RouteList.otp,
    //   builder: (context, state) {
    //     final data = state.extra as Map<String, dynamic>;

    //     final phone = data["phone"] as String;
    //     final type = data["type"] as LoginType;
    //     final otp = data["otp"] as int;

    //     return Otpverifyscreen(phone: phone, type: type, otp: otp);
    //   },
    // ),
    GoRoute(
      path: RouteList.forgotPassword,
      name: RouteList.forgotPassword,
      builder: (context, state) => const ForgotPassword(),
    ),

    // GoRoute(
    //   path: RouteList.changePassword,
    //   name: RouteList.changePassword,
    //   builder: (context, state) => const ChangePasswordScreen(),
    // ),
    // GoRoute(
    //   path: RouteList.editProfile,
    //   name: RouteList.editProfile,
    //   builder: (context, state) => const EditProfileScreen(),
    // ),

    // GoRoute(
    //   path: RouteList.rooms,
    //   name: RouteList.rooms,
    //   builder: (context, state) {
    //     final args = state.extra as RoomsArgs?;
    //     if (args == null) {
    //       return const Scaffold(body: Center(child: Text("Invalid room data")));
    //     }
    //     return RoomsScreen(acommodation: args.acommodation);
    //   },
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
            return AnimatedBuilder(
              animation: animation,
              builder: (context, _) {
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
        );
      },
    ),

    // GoRoute(
    //   path: RouteList.contactus,
    //   name: RouteList.contactus,
    //   builder: (context, state) => ContactUsScreen(),
    // ),
  ],
);

// class RoomDetailArgs {
//   final roommodel.RoomModel room;
//   final Acommodation? acommodation;

//   RoomDetailArgs({required this.room, this.acommodation});
// }

// class RoomsArgs {
//   final List<roommodel.RoomModel> rooms;
//   final Acommodation? acommodation;

//   RoomsArgs({required this.rooms, required this.acommodation});
// }

class _CircularRevealClipper extends CustomClipper<Path> {
  final double radius;
  final Offset center;

  _CircularRevealClipper({required this.radius, required this.center});

  @override
  Path getClip(Size size) {
    return Path()..addOval(Rect.fromCircle(center: center, radius: radius));
  }

  @override
  bool shouldReclip(_CircularRevealClipper old) =>
      old.radius != radius || old.center != center;
}
