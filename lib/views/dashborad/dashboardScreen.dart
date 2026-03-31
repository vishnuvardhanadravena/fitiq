import 'package:fitiq/views/dashborad/provider/dashbordprovider.dart';
import 'package:fitiq/views/dashborad/screens/home_screen.dart';
import 'package:fitiq/views/dashborad/screens/profile_screen.dart';
import 'package:fitiq/views/dashborad/screens/programs_screen.dart';
import 'package:fitiq/views/dashborad/screens/schedule_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ── Theme constants ──────────────────────────────────────────────────────────

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
  _NavItem(
    label: '  Home  ',
    icon: Icons.home_outlined,
    activeIcon: Icons.home_rounded,
  ),
  _NavItem(
    label: 'Trainers',
    icon: Icons.people_outline_rounded,
    activeIcon: Icons.people_rounded,
  ),
  _NavItem(
    label: 'Programs',
    icon: Icons.assignment_outlined,
    activeIcon: Icons.assignment_rounded,
  ),
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

// ── Pages ─────────────────────────────────────────────────────────────────────

const List<Widget> _pages = [
  HomeScreen(),
  // TrainersScreen(),   ← add when ready
  ProgramsScreen(),
  ScheduleScreen(),
  ProfileScreen(),
];

// ── Dashboard screen ──────────────────────────────────────────────────────────

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(dashboardIndexProvider);

    return Scaffold(
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
    );
  }
}

// ── Floating bottom nav bar ───────────────────────────────────────────────────

class _BottomNavBar extends StatelessWidget {
  const _BottomNavBar({
    required this.currentIndex,
    required this.onTap,
  });

  final int currentIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    final bottomPadding = MediaQuery.of(context).padding.bottom;

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

// ── Nav item widget ───────────────────────────────────────────────────────────

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
          // color: FitiqTheme.textSecondary.withOpacity(0.1), // light grey circle
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
