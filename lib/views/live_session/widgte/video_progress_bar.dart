import 'package:fitiq/views/live_session/widgte/live_video_theme.dart';
import 'package:flutter/material.dart';

/// A reusable video progress bar with timestamp display.
/// Supports both live and VOD modes.
class VideoProgressBar extends StatelessWidget {
  final Duration currentPosition;
  final Duration totalDuration;
  final bool isLive;
  final ValueChanged<double>? onSeek;
  final Color activeColor;
  final Color inactiveColor;

  const VideoProgressBar({
    super.key,
    required this.currentPosition,
    required this.totalDuration,
    this.isLive = false,
    this.onSeek,
    this.activeColor = LiveVideoTheme.progressBlue,
    this.inactiveColor = Colors.white38,
  });

  String _formatDuration(Duration d) {
    final minutes = d.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = d.inSeconds.remainder(60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  double get _progress {
    if (totalDuration.inMilliseconds == 0) return 0.02;
    return (currentPosition.inMilliseconds / totalDuration.inMilliseconds)
        .clamp(0.0, 1.0);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onHorizontalDragUpdate: onSeek == null
              ? null
              : (details) {
                  final box = context.findRenderObject() as RenderBox?;
                  if (box == null) return;
                  final localX = details.localPosition.dx;
                  final ratio = (localX / box.size.width).clamp(0.0, 1.0);
                  onSeek!(ratio);
                },
          child: Container(
            height: 5,
            decoration: BoxDecoration(
              color: inactiveColor,
              borderRadius: BorderRadius.circular(2),
            ),
            child: FractionallySizedBox(
              widthFactor: _progress,
              alignment: Alignment.centerLeft,
              child: Container(
                decoration: BoxDecoration(
                  color: activeColor,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 6),
        Text(
          isLive
              ? 'LIVE'
              : "${_formatDuration(currentPosition)} / ${_formatDuration(totalDuration)}",
          style: LiveVideoTheme.timestampStyle,
        ),
      ],
    );
  }
}
