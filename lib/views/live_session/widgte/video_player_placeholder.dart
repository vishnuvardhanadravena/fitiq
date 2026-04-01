import 'package:flutter/material.dart';

/// Placeholder/skeleton for the video player area.
/// Replace this with your actual video player (e.g., video_player, better_player, agora, etc.)
///
/// To integrate a real player:
/// 1. Add your video plugin to pubspec.yaml
/// 2. Replace the body of this widget with your player widget
/// 3. Keep the Stack overlay structure so VideoTopBar and VideoOverlayInfo still render
class VideoPlayerPlaceholder extends StatelessWidget {
  final String? thumbnailUrl;
  final Widget? playerWidget; // Pass your real player here
  final Color backgroundColor;

  const VideoPlayerPlaceholder({
    super.key,
    this.thumbnailUrl,
    this.playerWidget,
    this.backgroundColor = Colors.white10,
  });

  @override
  Widget build(BuildContext context) {
    if (playerWidget != null) return playerWidget!;

    // Placeholder gradient when no player or thumbnail is provided
    return Container(
      color: backgroundColor,
      child: thumbnailUrl != null
          ? Image.network(
              thumbnailUrl!,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
              errorBuilder: (_, __, ___) => _buildDefaultBg(),
            )
          : _buildDefaultBg(),
    );
  }

  Widget _buildDefaultBg() {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF1A1A2E), Color(0xFF2D2D44), Color(0xFF1A1A2E)],
        ),
      ),
    );
  }
}
