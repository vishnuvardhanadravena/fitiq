import 'package:flutter/material.dart';
import 'schedule_colors.dart';

class SessionThumb extends StatelessWidget {
  final double size;
  final double borderRadius;
  final String? imageUrl;

  const SessionThumb({
    super.key,
    this.size = 70,
    this.borderRadius = 10,
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        image: imageUrl != null && imageUrl!.isNotEmpty
            ? DecorationImage(image: NetworkImage(imageUrl!), fit: BoxFit.cover)
            : null,
        gradient: imageUrl == null || imageUrl!.isEmpty
            ? const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [ScheduleColors.thumbTop, ScheduleColors.thumbBottom],
              )
            : null,
      ),
      child: (imageUrl == null || imageUrl!.isEmpty)
          ? Icon(
              Icons.fitness_center_rounded,
              color: Colors.white.withValues(alpha: 0.85),
              size: size * 0.38,
            )
          : null,
    );
  }
}
