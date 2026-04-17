import 'package:flutter/material.dart';

class NotificationButton extends StatelessWidget {
  final double size;
  const NotificationButton({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Settings tapped'))),
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.18),
          shape: BoxShape.circle,
        ),
        child: Icon(
          Icons.notifications_outlined,
          color: Colors.white,
          size: size * 0.58,
        ),
      ),
    );
  }
}
