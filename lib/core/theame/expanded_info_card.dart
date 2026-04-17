import 'package:flutter/material.dart';

/// A production-level reusable Expandable Info Section Card widget.
///
/// Shows only the header by default. Tapping expands/collapses the item list
/// with a smooth animation. Pass any widget as title or list items.
///
/// ---
/// Basic Usage:
/// ```dart
/// ExpandableInfoCard(
///   title: Text('Information We Collect', style: TextStyle(fontWeight: FontWeight.bold)),
///   items: [
///     Text('Personal details (name, email, phone)'),
///     Text('Health & fitness data'),
///     Text('Payment information'),
///     Text('Device & usage data'),
///   ],
/// )
/// ```
class ExpandableInfoCard extends StatefulWidget {
  /// Widget displayed as the section header/title.
  final Widget title;

  /// List of widgets displayed as bullet rows when expanded.
  final List<Widget> items;

  /// Whether the section is expanded on first render. Default: false.
  final bool initiallyExpanded;

  // ── Bullet options ──────────────────────────────────────────────────────────

  /// Whether to show a bullet dot before each item. Default: true.
  final bool showBullet;

  /// Color of the bullet dot. Defaults to theme body text color.
  final Color? bulletColor;

  /// Diameter of the bullet dot. Default: 5.5.
  final double bulletSize;

  /// Gap between bullet dot and item widget. Default: 10.
  final double bulletSpacing;

  // ── Divider options ─────────────────────────────────────────────────────────

  /// Whether to show a divider between title and items. Default: true.
  final bool showDivider;

  /// Color of the divider. Default: Colors.grey.shade200.
  final Color? dividerColor;

  /// Thickness of the divider. Default: 1.
  final double dividerThickness;

  // ── Icon options ────────────────────────────────────────────────────────────

  /// Icon shown when section is collapsed. Default: Icons.keyboard_arrow_down.
  final IconData collapsedIcon;

  /// Icon shown when section is expanded. Default: Icons.keyboard_arrow_up.
  final IconData expandedIcon;

  /// Color of the toggle icon. Defaults to theme icon color.
  final Color? iconColor;

  /// Size of the toggle icon. Default: 22.
  final double iconSize;

  // ── Layout & spacing ────────────────────────────────────────────────────────

  /// Vertical gap between each bullet item. Default: 10.
  final double itemSpacing;

  /// Padding inside the card. Default: EdgeInsets.symmetric(horizontal: 16, vertical: 14).
  final EdgeInsetsGeometry? contentPadding;

  /// Padding around the items body section.
  final EdgeInsetsGeometry? bodyPadding;

  /// Space between divider and first item. Default: 12.
  final double dividerBottomSpacing;

  // ── Card decoration ─────────────────────────────────────────────────────────

  /// Background color of the card. Default: Colors.white.
  final Color? backgroundColor;

  /// Border radius of the card. Default: 12.
  final double borderRadius;

  /// Card shadow elevation. Default: 4.
  final double elevation;

  /// Card border. Default: no border (shadow used instead).
  final BoxBorder? border;

  /// Shadow color when elevation > 0.
  final Color? shadowColor;

  // ── Animation ───────────────────────────────────────────────────────────────

  /// Duration of expand/collapse animation. Default: 280ms.
  final Duration animationDuration;

  /// Curve of expand/collapse animation. Default: Curves.easeInOut.
  final Curve animationCurve;

  /// Called whenever the expansion state changes.
  final ValueChanged<bool>? onExpansionChanged;

  const ExpandableInfoCard({
    super.key,
    required this.title,
    required this.items,
    this.initiallyExpanded = false,
    // Bullet
    this.showBullet = true,
    this.bulletColor,
    this.bulletSize = 5.5,
    this.bulletSpacing = 10,
    // Divider
    this.showDivider = true,
    this.dividerColor,
    this.dividerThickness = 1,
    // Icon
    this.collapsedIcon = Icons.keyboard_arrow_down,
    this.expandedIcon = Icons.keyboard_arrow_up,
    this.iconColor,
    this.iconSize = 22,
    // Layout
    this.itemSpacing = 10,
    this.contentPadding,
    this.bodyPadding,
    this.dividerBottomSpacing = 12,
    // Card
    this.backgroundColor,
    this.borderRadius = 12,
    this.elevation = 4,
    this.border,
    this.shadowColor,
    // Animation
    this.animationDuration = const Duration(milliseconds: 280),
    this.animationCurve = Curves.easeInOut,
    this.onExpansionChanged,
  });

  @override
  State<ExpandableInfoCard> createState() => _ExpandableInfoCardState();
}

class _ExpandableInfoCardState extends State<ExpandableInfoCard>
    with SingleTickerProviderStateMixin {
  late bool _isExpanded;
  late AnimationController _controller;
  late Animation<double> _heightFactor;
  late Animation<double> _iconTurn;

  @override
  void initState() {
    super.initState();
    _isExpanded = widget.initiallyExpanded;

    _controller = AnimationController(
      vsync: this,
      duration: widget.animationDuration,
      value: _isExpanded ? 1.0 : 0.0,
    );

    _heightFactor = CurvedAnimation(
      parent: _controller,
      curve: widget.animationCurve,
    );

    _iconTurn = Tween<double>(begin: 0.0, end: 0.5).animate(
      CurvedAnimation(parent: _controller, curve: widget.animationCurve),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggle() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
      widget.onExpansionChanged?.call(_isExpanded);
    });
  }

  @override
  Widget build(BuildContext context) {
    final effectiveBulletColor =
        widget.bulletColor ??
        Theme.of(context).textTheme.bodyMedium?.color ??
        Colors.black87;

    final effectiveDividerColor = widget.dividerColor ?? Colors.grey.shade200;
    final effectiveBorder = widget.border;
    final effectiveBg = widget.backgroundColor ?? Colors.white;
    final effectivePadding =
        widget.contentPadding ??
        const EdgeInsets.symmetric(horizontal: 16, vertical: 14);
    final effectiveBodyPadding =
        widget.bodyPadding ??
        const EdgeInsets.symmetric(horizontal: 16, vertical: 0);
    final effectiveIconColor = widget.iconColor ?? Colors.black54;

    return Material(
      color: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          color: effectiveBg,
          borderRadius: BorderRadius.circular(widget.borderRadius),
          border: effectiveBorder,
          boxShadow: [
            BoxShadow(
              color: widget.shadowColor ?? Colors.black.withValues(alpha: 0.08),
              blurRadius: widget.elevation * 3,
              spreadRadius: widget.elevation * 0.5,
              offset: Offset(0, widget.elevation * 0.8),
            ),
            BoxShadow(
              color: widget.shadowColor ?? Colors.black.withValues(alpha: 0.04),
              blurRadius: widget.elevation,
              spreadRadius: 0,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // ── Header row (always visible, tappable) ──────────────────────
            InkWell(
              onTap: _toggle,
              borderRadius: BorderRadius.circular(widget.borderRadius),
              child: Padding(
                padding: effectivePadding,
                child: Row(
                  children: [
                    Expanded(child: widget.title),
                    AnimatedBuilder(
                      animation: _iconTurn,
                      builder: (context, child) {
                        return Transform.rotate(
                          angle: _iconTurn.value * 3.14159265,
                          child: child,
                        );
                      },
                      child: Icon(
                        // Always use down arrow; rotation handles the flip
                        widget.collapsedIcon,
                        size: widget.iconSize,
                        color: effectiveIconColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // ── Animated body ──────────────────────────────────────────────
            AnimatedBuilder(
              animation: _heightFactor,
              builder: (context, child) {
                return ClipRect(
                  child: Align(
                    alignment: Alignment.topCenter,
                    heightFactor: _heightFactor.value,
                    child: child,
                  ),
                );
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Divider
                  if (widget.showDivider)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0),
                      child: Divider(
                        height: widget.dividerThickness,
                        thickness: widget.dividerThickness,
                        color: effectiveDividerColor,
                      ),
                    ),

                  // Items list
                  Padding(
                    padding: effectiveBodyPadding.add(
                      EdgeInsets.only(
                        top: widget.dividerBottomSpacing,
                        bottom: 14,
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(widget.items.length, (index) {
                        return Padding(
                          padding: EdgeInsets.only(
                            bottom: index < widget.items.length - 1
                                ? widget.itemSpacing
                                : 0,
                          ),
                          child: _BulletRow(
                            child: widget.items[index],
                            showBullet: widget.showBullet,
                            bulletColor: effectiveBulletColor,
                            bulletSize: widget.bulletSize,
                            bulletSpacing: widget.bulletSpacing,
                          ),
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Internal widget that wraps an item with an optional leading bullet dot.
class _BulletRow extends StatelessWidget {
  final Widget child;
  final bool showBullet;
  final Color bulletColor;
  final double bulletSize;
  final double bulletSpacing;

  const _BulletRow({
    required this.child,
    required this.showBullet,
    required this.bulletColor,
    required this.bulletSize,
    required this.bulletSpacing,
  });

  @override
  Widget build(BuildContext context) {
    if (!showBullet) return child;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: bulletSize,
          height: bulletSize,
          decoration: BoxDecoration(color: bulletColor, shape: BoxShape.circle),
        ),
        SizedBox(width: bulletSpacing),
        Expanded(child: child),
      ],
    );
  }
}

// ═══════════════════════════════════════════════════════════════════════════════
// USAGE EXAMPLES — Remove before shipping to production
// ═══════════════════════════════════════════════════════════════════════════════

class ExpandableInfoCardExamples extends StatelessWidget {
  const ExpandableInfoCardExamples({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(title: const Text('ExpandableInfoCard Examples')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // ── Example 1: Exact replica of screenshot (collapsed by default)
            ExpandableInfoCard(
              title: const Text(
                'Information We Collect',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              items: const [
                Text('Personal details (name, email, phone)'),
                Text('Health & fitness data'),
                Text('Payment information'),
                Text('Device & usage data'),
              ],
            ),

            const SizedBox(height: 16),

            // ── Example 2: Starts expanded
            ExpandableInfoCard(
              initiallyExpanded: true,
              title: const Text(
                'Your Rights',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              items: const [
                Text('Access your data anytime'),
                Text('Request data deletion'),
                Text('Opt out of marketing'),
              ],
              bulletColor: Colors.blue,
            ),

            const SizedBox(height: 16),

            // ── Example 3: Dark theme
            ExpandableInfoCard(
              title: const Text(
                'How We Use Data',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
              items: const [
                Text(
                  'Improve app performance',
                  style: TextStyle(color: Colors.white70),
                ),
                Text(
                  'Personalise your experience',
                  style: TextStyle(color: Colors.white70),
                ),
                Text(
                  'Send important notifications',
                  style: TextStyle(color: Colors.white70),
                ),
              ],
              backgroundColor: const Color(0xFF1A1A2E),
              dividerColor: Colors.white24,
              bulletColor: Colors.white70,
              iconColor: Colors.white70,
              shadowColor: Colors.black45,
            ),

            const SizedBox(height: 16),

            // ── Example 4: No bullets, icon rows
            ExpandableInfoCard(
              title: const Text(
                'Security Features',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              items: [
                _iconItem(Icons.lock_outline, 'End-to-end encryption'),
                _iconItem(
                  Icons.verified_user_outlined,
                  'Two-factor authentication',
                ),
                _iconItem(Icons.visibility_off_outlined, 'Anonymous mode'),
              ],
              showBullet: false,
            ),

            const SizedBox(height: 16),

            // ── Example 5: Callback on expansion change
            ExpandableInfoCard(
              title: const Text(
                'Quick Facts',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
              ),
              items: const [
                Text('Founded in 2020'),
                Text('GDPR compliant'),
                Text('ISO 27001 certified'),
              ],
              bulletColor: Colors.green,
              onExpansionChanged: (isExpanded) {
                debugPrint(
                  'Section is now: ${isExpanded ? "expanded" : "collapsed"}',
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _iconItem(IconData icon, String label) {
    return Row(
      children: [
        Icon(icon, size: 16, color: Colors.blueAccent),
        const SizedBox(width: 8),
        Text(label, style: const TextStyle(fontSize: 14)),
      ],
    );
  }
}
