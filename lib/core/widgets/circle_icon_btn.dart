import 'package:flutter/material.dart';

class CircleIconButton extends StatelessWidget {
  final IconData icon;
  final double size;
  final VoidCallback? onTap;

  final Color? iconColor;
  final Color? backgroundColor;
  final double? iconSize;

  const CircleIconButton({
    super.key,
    required this.icon,
    this.size = 40,
    this.onTap,
    this.iconColor,
    this.backgroundColor,
    this.iconSize,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        alignment: Alignment.center, // ✅ fix alignment
        decoration: BoxDecoration(
          color:
              backgroundColor ??
              Colors.white.withValues(alpha: 0.18), // ✅ default
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          size: iconSize ?? size * 0.6, // ✅ better scaling
          color: iconColor ?? Colors.white, // ✅ default
        ),
      ),
    );
  }
}
