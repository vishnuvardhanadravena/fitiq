import 'package:fitiq/views/live_session/widgte/live_video_theme.dart';
import 'package:flutter/material.dart';

/// A reusable LIVE badge widget with pulsing animation.
/// Use anywhere you need to indicate live status.
class LiveBadge extends StatefulWidget {
  final double fontSize;
  final EdgeInsets padding;
  final bool animate;

  const LiveBadge({
    super.key,
    this.fontSize = 11,
    this.padding = const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
    this.animate = true,
  });

  @override
  State<LiveBadge> createState() => _LiveBadgeState();
}

class _LiveBadgeState extends State<LiveBadge>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnim;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );
    _opacityAnim = Tween<double>(begin: 1.0, end: 0.4).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
    if (widget.animate) {
      _controller.repeat(reverse: true);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _opacityAnim,
      builder: (_, __) => Opacity(
        opacity: widget.animate ? _opacityAnim.value : 1.0,
        child: Container(
          padding: widget.padding,
          decoration: BoxDecoration(
            color: LiveVideoTheme.liveRed,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Text(
            'LIVE',
            style: LiveVideoTheme.liveTagStyle.copyWith(
              fontSize: widget.fontSize,
            ),
          ),
        ),
      ),
    );
  }
}

/// Displays the number of live viewers with a person icon.
/// Reusable across any live content screen.
class ViewerCountBadge extends StatelessWidget {
  final int count;
  final Color color;
  final double iconSize;
  final double fontSize;

  const ViewerCountBadge({
    super.key,
    required this.count,
    this.color = Colors.white,
    this.iconSize = 16,
    this.fontSize = 12,
  });

  String _formatCount(int n) {
    if (n >= 1000) return '${(n / 1000).toStringAsFixed(1)}k';
    return n.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.people_outline, color: color, size: iconSize),
        const SizedBox(width: 4),
        Text(
          '${_formatCount(count)} Watching',
          style: LiveVideoTheme.viewerCountStyle.copyWith(
            color: color,
            fontSize: fontSize,
          ),
        ),
      ],
    );
  }
}