import 'dart:math';

import 'package:fitiq/routes/route_constants.dart';
import 'package:fitiq/views/auth/Screens/landing_pages.dart';
import 'package:fitiq/views/auth/Screens/login_screen.dart';
import 'package:fitiq/views/auth/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
    // GoRoute(
    //   path: RouteList.signup,
    //   name: RouteList.signup,
    //   builder: (context, state) => const SignUpScreen(),
    // ),
     GoRoute(
      path: RouteList.login,
      name: RouteList.login,
      builder: (context, state) => const LoginScreen(),
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
    //     GoRoute(
    //       path: RouteList.home,
    //       name: RouteList.home,
    //       builder: (context, state) => const HomeScreen(),
    //     ),
    //     GoRoute(
    //       path: RouteList.search,
    //       name: RouteList.search,
    //       builder: (context, state) => const SearchScreen(),
    //     ),

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
    // GoRoute(
    //   path: RouteList.forgotPassword,
    //   name: RouteList.forgotPassword,
    //   builder: (context, state) => const Forgotpassword(),
    // ),
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
  
  
  


    // GoRoute(
    //   path: RouteList.paymentsuccess,
    //   name: RouteList.paymentsuccess,
    //   pageBuilder: (context, state) {
    //     return CustomTransitionPage(
    //       key: state.pageKey,
    //       child: const PaymentSuccessScreen(),
    //       transitionDuration: const Duration(milliseconds: 400),
    //       transitionsBuilder: (context, animation, secondaryAnimation, child) {
    //         return AnimatedBuilder(
    //           animation: animation,
    //           builder: (context, _) {
    //             final size = MediaQuery.of(context).size;

    //             final maxRadius = sqrt(
    //               (size.width * size.width) + (size.height * size.height),
    //             );

    //             final radius =
    //                 CurvedAnimation(
    //                   parent: animation,
    //                   curve: Curves.easeInOut,
    //                 ).value *
    //                 maxRadius;

    //             return ClipPath(
    //               clipper: _CircularRevealClipper(
    //                 radius: radius,
    //                 center: Offset(size.width / 2, size.height / 2),
    //               ),
    //               child: child,
    //             );
    //           },
    //         );
    //       },
    //     );
    //   },
    // ),
    
   

    
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

// class _CircularRevealClipper extends CustomClipper<Path> {
//   final double radius;
//   final Offset center;

//   _CircularRevealClipper({required this.radius, required this.center});

//   @override
//   Path getClip(Size size) {
//     return Path()..addOval(Rect.fromCircle(center: center, radius: radius));
//   }

//   @override
//   bool shouldReclip(_CircularRevealClipper old) =>
//       old.radius != radius || old.center != center;
// }
