import 'package:fitiq/core/widgets/exit_bottom_sheet.dart';
import 'package:fitiq/views/dashborad/provider/dashbordprovider.dart';
import 'package:fitiq/views/profile/screens/profile_screen.dart';
import 'package:fitiq/views/dashborad/screens/programs_screen.dart';
import 'package:fitiq/views/schedules/views/schedule_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:google_maps_flutter/google_maps_flutter.dart';

Future<LatLng> getLatLngFromShortUrl(String shortUrl) async {
  debugPrint("🔗 Input Short URL: $shortUrl");

  try {
    final response = await http
        .get(Uri.parse(shortUrl), headers: {"User-Agent": "Mozilla/5.0"})
        .timeout(const Duration(seconds: 10));

    debugPrint("📡 Status Code: ${response.statusCode}");

    final body = response.body;
    final finalUrl = response.request?.url.toString() ?? "";

    debugPrint("➡️ Final Resolved URL: $finalUrl");
    final latLngFromUrl = _tryExtract(
      () => extractLatLngFromGoogleUrl(finalUrl),
    );
    if (latLngFromUrl != null) {
      debugPrint("✅ Extracted using @ format: $latLngFromUrl");
      return latLngFromUrl;
    }
    final latLngAdvanced = _tryExtract(() => extractLatLngAdvanced(finalUrl));
    if (latLngAdvanced != null) {
      debugPrint("✅ Extracted using !3d !2d format: $latLngAdvanced");
      return latLngAdvanced;
    }
    final latLngHtml = _tryExtract(() => extractFromHtml(body));
    if (latLngHtml != null) {
      debugPrint("✅ Extracted from HTML: $latLngHtml");
      return latLngHtml;
    }
    throw Exception("❌ Unable to extract LatLng from any method");
  } catch (e) {
    debugPrint("❌ Error in getLatLngFromShortUrl: $e");
    rethrow;
  }
}

LatLng? _tryExtract(LatLng Function() fn) {
  try {
    return fn();
  } catch (_) {
    return null;
  }
}

LatLng extractFromHtml(String html) {
  final latMatch = RegExp(r'!3d(-?\d+\.\d+)').firstMatch(html);
  final lngMatch = RegExp(r'!4d(-?\d+\.\d+)').firstMatch(html);
  if (latMatch != null && lngMatch != null) {
    final lat = double.parse(latMatch.group(1)!);
    final lng = double.parse(lngMatch.group(1)!);
    return LatLng(lat, lng);
  }
  throw Exception("LatLng not found in HTML");
}

void logLongString(String text) {
  const chunkSize = 800;
  for (int i = 0; i < text.length; i += chunkSize) {
    if (kDebugMode) {
      print(
        text.substring(
          i,
          i + chunkSize > text.length ? text.length : i + chunkSize,
        ),
      );
    }
  }
}

LatLng extractLatLngFromGoogleUrl(String url) {
  if (kDebugMode) {
    print("🔍 Trying @ format extraction...");
  }
  final regExp = RegExp(r'@([-0-9.]+),([-0-9.]+)');
  final match = regExp.firstMatch(url);
  if (match != null) {
    final lat = double.parse(match.group(1)!);
    final lng = double.parse(match.group(2)!);
    if (kDebugMode) {
      print("📍 Found @ coords → lat: $lat, lng: $lng");
    }
    return LatLng(lat, lng);
  }
  if (kDebugMode) {
    print("❌ @ format not found");
  }
  throw Exception("LatLng not found in @ format");
}

LatLng extractLatLngAdvanced(String url) {
  if (kDebugMode) {
    print("🔍 Trying !3d !2d extraction...");
  }
  final latMatch = RegExp(r'!3d([-0-9.]+)').firstMatch(url);
  final lngMatch = RegExp(r'!2d([-0-9.]+)').firstMatch(url);
  if (kDebugMode) {
    print("latMatch: ${latMatch?.group(1)}");
  }
  if (kDebugMode) {
    print("lngMatch: ${lngMatch?.group(1)}");
  }
  if (latMatch != null && lngMatch != null) {
    final lat = double.parse(latMatch.group(1)!);
    final lng = double.parse(lngMatch.group(1)!); // ✅ FIXED
    if (kDebugMode) {
      print("📍 Found !3d!2d coords → lat: $lat, lng: $lng");
    }
    return LatLng(lat, lng);
  }
  if (kDebugMode) {
    print("❌ !3d !2d format not found");
  }
  throw Exception("LatLng not found in advanced format");
}

class FitiqTheme {
  static const Color background = Color(0xFFF2F2F7); // light grey page bg
  static const Color surface = Color(0xFFFFFFFF);
  static const Color accent = Color(0xFFFF2D78); // hot pink
  static const Color accentLight = Color(0x1AFF2D78); // 10% pink tint
  static const Color textPrimary = Color(0xFF1C1C1E);
  static const Color textSecondary = Color(0xFF8E8E93);
  static const Color navBackground = Color(0xFFFFFFFF);
  static const Color navShadow = Color(0x14000000);
}

// ── Nav item model ────────────────────────────────────────────────────────────

class _NavItem {
  const _NavItem({
    required this.label,
    required this.icon,
    required this.activeIcon,
  });

  final String label;
  final IconData icon;
  final IconData activeIcon;
}

const List<_NavItem> _navItems = [
  // _NavItem(
  //   label: '  Home  ',
  //   icon: Icons.home_outlined,
  //   activeIcon: Icons.home_rounded,
  // ),
  // _NavItem(
  //   label: 'Trainers',
  //   icon: Icons.people_outline_rounded,
  //   activeIcon: Icons.people_rounded,
  // ),
  _NavItem(
    label: 'Programs',
    icon: Icons.assignment_outlined,
    activeIcon: Icons.assignment_rounded,
  ),
  // _NavItem(
  //   label: 'maps',
  //   icon: Icons.people_outline_rounded,
  //   activeIcon: Icons.people_rounded,
  // ),
  _NavItem(
    label: 'Schedule',
    icon: Icons.calendar_month_outlined,
    activeIcon: Icons.calendar_month_rounded,
  ),
  _NavItem(
    label: ' Profile',
    icon: Icons.person_outline_rounded,
    activeIcon: Icons.person_rounded,
  ),
];

const List<Widget> _pages = [
  ProgramsScreen(),
  // MapScreen(),
  ScheduleScreen(),
  ProfileScreen(),
];

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(dashboardIndexProvider);
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return;
        if (currentIndex != 0) {
          ref.read(dashboardIndexProvider.notifier).state = 0; 
          return;
        }
        await showExitBottomSheet(
          context: context,
          // imageAsset: "assets/exist2.svg",
          imageUrl:
              "https://img.freepik.com/premium-vector/photo-vector-illustration-happy-face-sad-face-funny-face-expression-with-tears_763111-106679.jpg?semt=ais_hybrid&w=740&q=80",
          // "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRCcXdVOFYRpH-Bd1WV50YDFftBhPvff3oqXQ&s",

          // imageUrl:
          //     "https://market-resized.envatousercontent.com/previews/files/345160807/preview.jpg?w=590&h=590&cf_fit=crop&crop=top&format=auto&q=85&s=6a6a5e559fc499ffad80b0fcfdc6fe4b5058fd68891cc7f6b592b65d37542acf",
        );
        // if (shouldExit == true) {
        //   SystemNavigator.pop();
        // }
      },
      child: SafeArea(
        top: false,
        child: Scaffold(
          backgroundColor: FitiqTheme.background,
          extendBody: true,
          body: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            switchInCurve: Curves.easeOutCubic,
            switchOutCurve: Curves.easeInCubic,
            transitionBuilder: (child, animation) => FadeTransition(
              opacity: animation,
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0, 0.025),
                  end: Offset.zero,
                ).animate(animation),
                child: child,
              ),
            ),
            child: KeyedSubtree(
              key: ValueKey(currentIndex),
              // Guard against index mismatch if pages list is shorter than navItems
              child: _pages[currentIndex.clamp(0, _pages.length - 1)],
            ),
          ),
          bottomNavigationBar: _BottomNavBar(
            currentIndex: currentIndex,
            onTap: (index) {
              HapticFeedback.selectionClick();
              ref.read(dashboardIndexProvider.notifier).state = index;
            },
          ),
        ),
      ),
    );
  }
}

class _BottomNavBar extends StatelessWidget {
  const _BottomNavBar({required this.currentIndex, required this.onTap});
  final int currentIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    // final bottomPadding = MediaQuery.of(context).padding.bottom;

    return Container(
      // Outer wrapper gives the grey page background behind the floating card
      color: Colors.transparent,
      // padding: EdgeInsets.fromLTRB(16, 8, 16, bottomPadding + 12),
      child: Container(
        // The white floating card
        decoration: BoxDecoration(
          color: FitiqTheme.navBackground,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
          boxShadow: const [
            BoxShadow(
              color: FitiqTheme.navShadow,
              blurRadius: 20,
              offset: Offset(0, 4),
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(
            _navItems.length,
            (index) => _NavItemWidget(
              item: _navItems[index],
              isActive: index == currentIndex,
              onTap: () => onTap(index),
            ),
          ),
        ),
      ),
    );
  }
}

class _NavItemWidget extends StatefulWidget {
  const _NavItemWidget({
    required this.item,
    required this.isActive,
    required this.onTap,
  });
  final _NavItem item;
  final bool isActive;
  final VoidCallback onTap;
  @override
  State<_NavItemWidget> createState() => _NavItemWidgetState();
}

class _NavItemWidgetState extends State<_NavItemWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 110),
      lowerBound: 0.88,
      upperBound: 1.0,
      value: 1.0,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _handleTap() async {
    await _controller.reverse();
    await _controller.forward();
    widget.onTap();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      behavior: HitTestBehavior.opaque,
      child: ScaleTransition(
        scale: _controller,
        child: widget.isActive
            ? _ActiveItem(item: widget.item)
            : _InactiveItem(item: widget.item),
      ),
    );
  }
}

class _ActiveItem extends StatelessWidget {
  const _ActiveItem({required this.item});
  final _NavItem item;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 220),
      curve: Curves.easeOutBack,
      decoration: BoxDecoration(
        color: FitiqTheme.accent,
        borderRadius: BorderRadius.vertical(
          top: const Radius.circular(40),
          bottom: const Radius.circular(18),
        ),
      ),
      child: IntrinsicWidth(
        child: IntrinsicHeight(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(item.activeIcon, color: Colors.white, size: 22),
                const SizedBox(height: 4),
                Text(
                  item.label,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _InactiveItem extends StatelessWidget {
  const _InactiveItem({required this.item});

  final _NavItem item;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 70,
      height: 70,
      child: DecoratedBox(
        decoration: BoxDecoration(
          // color: FitiqTheme.textSecondary.withValues(alpha:0.1), // light grey circle
          shape: BoxShape.circle,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(item.icon, color: FitiqTheme.textSecondary, size: 22),
            const SizedBox(height: 2),
            Text(
              item.label,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w400,
                color: FitiqTheme.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class FitiqTheme {
//   static const Color background = Color(0xFFF2F2F7);
//   static const Color surface = Color(0xFFFFFFFF);
//   static const Color accent = Color(0xFFFF2D78);
//   static const Color accentLight = Color(0x1AFF2D78);
//   static const Color textPrimary = Color(0xFF1C1C1E);
//   static const Color textSecondary = Color(0xFF8E8E93);
//   static const Color navBackground = Color(0xFFFFFFFF);
//   static const Color navShadow = Color(0x14000000);
// }

// class _NavItem {
//   const _NavItem({
//     required this.label,
//     required this.icon,
//     required this.activeIcon,
//   });

//   final String label;
//   final IconData icon;
//   final IconData activeIcon;
// }

// const List<_NavItem> _navItems = [
//   _NavItem(
//     label: 'Programs',
//     icon: Icons.assignment_outlined,
//     activeIcon: Icons.assignment_rounded,
//   ),
//   _NavItem(
//     label: 'Schedule',
//     icon: Icons.calendar_month_outlined,
//     activeIcon: Icons.calendar_month_rounded,
//   ),
//   _NavItem(
//     label: ' Profile',
//     icon: Icons.person_outline_rounded,
//     activeIcon: Icons.person_rounded,
//   ),
// ];

// // MapScreen is at index 0 — handled via Offstage separately
// // Other pages start at index 1
// const List<Widget> _otherPages = [
//   ScheduleScreen(), // index 1
//   ProfileScreen(), // index 2
// ];

// class DashboardScreen extends ConsumerWidget {
//   const DashboardScreen({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final currentIndex = ref.watch(dashboardIndexProvider);

//     return SafeArea(
//       top: false,
//       child: Scaffold(
//         backgroundColor: FitiqTheme.background,
//         extendBody: true,
//         body: Stack(
//           children: [
//             // ✅ MapScreen always mounted — never rebuilt, runs in background
//             Offstage(offstage: currentIndex != 0, child: const MapScreen()),

//             // ✅ All other screens use AnimatedSwitcher — rebuild on every visit
//             if (currentIndex != 0)
//               AnimatedSwitcher(
//                 duration: const Duration(milliseconds: 300),
//                 switchInCurve: Curves.easeOutCubic,
//                 switchOutCurve: Curves.easeInCubic,
//                 transitionBuilder: (child, animation) => FadeTransition(
//                   opacity: animation,
//                   child: SlideTransition(
//                     position: Tween<Offset>(
//                       begin: const Offset(0, 0.025),
//                       end: Offset.zero,
//                     ).animate(animation),
//                     child: child,
//                   ),
//                 ),
//                 child: KeyedSubtree(
//                   key: ValueKey(currentIndex),
//                   // currentIndex 1 → _otherPages[0], index 2 → _otherPages[1]
//                   child:
//                       _otherPages[(currentIndex - 1).clamp(
//                         0,
//                         _otherPages.length - 1,
//                       )],
//                 ),
//               ),
//           ],
//         ),
//         bottomNavigationBar: _BottomNavBar(
//           currentIndex: currentIndex,
//           onTap: (index) {
//             HapticFeedback.selectionClick();
//             ref.read(dashboardIndexProvider.notifier).state = index;
//           },
//         ),
//       ),
//     );
//   }
// }

// class _BottomNavBar extends StatelessWidget {
//   const _BottomNavBar({required this.currentIndex, required this.onTap});

//   final int currentIndex;
//   final ValueChanged<int> onTap;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.transparent,
//       child: Container(
//         decoration: BoxDecoration(
//           color: FitiqTheme.navBackground,
//           borderRadius: const BorderRadius.only(
//             topLeft: Radius.circular(24),
//             topRight: Radius.circular(24),
//           ),
//           boxShadow: const [
//             BoxShadow(
//               color: FitiqTheme.navShadow,
//               blurRadius: 20,
//               offset: Offset(0, 4),
//             ),
//           ],
//         ),
//         padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: List.generate(
//             _navItems.length,
//             (index) => _NavItemWidget(
//               item: _navItems[index],
//               isActive: index == currentIndex,
//               onTap: () => onTap(index),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class _NavItemWidget extends StatefulWidget {
//   const _NavItemWidget({
//     required this.item,
//     required this.isActive,
//     required this.onTap,
//   });

//   final _NavItem item;
//   final bool isActive;
//   final VoidCallback onTap;

//   @override
//   State<_NavItemWidget> createState() => _NavItemWidgetState();
// }

// class _NavItemWidgetState extends State<_NavItemWidget>
//     with SingleTickerProviderStateMixin {
//   late final AnimationController _controller;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 110),
//       lowerBound: 0.88,
//       upperBound: 1.0,
//       value: 1.0,
//     );
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   Future<void> _handleTap() async {
//     await _controller.reverse();
//     await _controller.forward();
//     widget.onTap();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: _handleTap,
//       behavior: HitTestBehavior.opaque,
//       child: ScaleTransition(
//         scale: _controller,
//         child: widget.isActive
//             ? _ActiveItem(item: widget.item)
//             : _InactiveItem(item: widget.item),
//       ),
//     );
//   }
// }

// class _ActiveItem extends StatelessWidget {
//   const _ActiveItem({required this.item});

//   final _NavItem item;

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedContainer(
//       duration: const Duration(milliseconds: 220),
//       curve: Curves.easeOutBack,
//       decoration: BoxDecoration(
//         color: FitiqTheme.accent,
//         borderRadius: const BorderRadius.vertical(
//           top: Radius.circular(40),
//           bottom: Radius.circular(18),
//         ),
//       ),
//       child: IntrinsicWidth(
//         child: IntrinsicHeight(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Icon(item.activeIcon, color: Colors.white, size: 22),
//                 const SizedBox(height: 4),
//                 Text(
//                   item.label,
//                   textAlign: TextAlign.center,
//                   style: const TextStyle(
//                     fontSize: 10,
//                     fontWeight: FontWeight.w600,
//                     color: Colors.white,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class _InactiveItem extends StatelessWidget {
//   const _InactiveItem({required this.item});

//   final _NavItem item;

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: 70,
//       height: 70,
//       child: DecoratedBox(
//         decoration: const BoxDecoration(shape: BoxShape.circle),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(item.icon, color: FitiqTheme.textSecondary, size: 22),
//             const SizedBox(height: 2),
//             Text(
//               item.label,
//               textAlign: TextAlign.center,
//               style: const TextStyle(
//                 fontSize: 10,
//                 fontWeight: FontWeight.w400,
//                 color: FitiqTheme.textSecondary,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
