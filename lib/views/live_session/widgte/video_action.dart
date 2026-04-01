import 'package:fitiq/views/live_session/provider/live_video_config.dart';
import 'package:fitiq/views/live_session/provider/live_video_provider.dart';
import 'package:fitiq/views/live_session/widgte/live_video_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Fully dynamic bottom action bar for live video.
class VideoActionBar extends ConsumerWidget {
  final LiveVideoConfig config;
  final VoidCallback? onMore;
  final VoidCallback? onLeave;
  final double? height; // dynamic bar height
  final double? fontScale; // dynamic icon/font scaling

  const VideoActionBar({
    super.key,
    required this.config,
    this.onMore,
    this.onLeave,
    this.height,
    this.fontScale,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final bottomPadding = MediaQuery.of(context).padding.bottom;

    final double barHeight = height ?? size.height * 0.08;
    final double scale = fontScale ?? MediaQuery.of(context).textScaleFactor;

    final isMuted = ref.watch(liveVideoIsMutedProvider(config));
    final isCameraOff = ref.watch(liveVideoIsCameraOffProvider(config));
    final isChatOpen = ref.watch(liveVideoChatOpenProvider(config));
    final notifier = ref.read(liveVideoProvider(config).notifier);

    final double iconContainerSize = barHeight * 0.8;
    final double iconSize = iconContainerSize * 0.5 * scale;

    return Container(
      height: barHeight + bottomPadding,
      padding: EdgeInsets.symmetric(
        horizontal: size.width * 0.04,
        vertical: barHeight * 0.1,
      ),
      color: Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _ActionIconButton(
            icon: isMuted ? Icons.mic_off_rounded : Icons.mic_off_outlined,
            isActive: isMuted,
            onTap: notifier.toggleMute,
            containerSize: iconContainerSize,
            iconSize: iconSize,
          ),
          _ActionIconButton(
            icon: isCameraOff
                ? Icons.videocam_off_rounded
                : Icons.videocam_outlined,
            isActive: isCameraOff,
            onTap: notifier.toggleCamera,
            containerSize: iconContainerSize,
            iconSize: iconSize,
          ),
          _ActionIconButton(
            icon: Icons.more_horiz,
            onTap: onMore,
            containerSize: iconContainerSize,
            iconSize: iconSize,
          ),
          _ActionIconButton(
            icon: Icons.chat_bubble_outline_rounded,
            isActive: isChatOpen,
            activeColor: LiveVideoTheme.accentBlue,
            onTap: notifier.toggleChat,
            containerSize: iconContainerSize,
            iconSize: iconSize,
          ),
          _LeaveButton(
            onTap: onLeave,
            containerSize: iconContainerSize,
            iconSize: iconSize,
          ),
        ],
      ),
    );
  }
}

/// ─── Private dynamic icon button ─────────────────────
class _ActionIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onTap;
  final bool isActive;
  final Color activeColor;
  final double containerSize;
  final double iconSize;

  const _ActionIconButton({
    required this.icon,
    this.onTap,
    this.isActive = false,
    this.activeColor = Colors.black87,
    required this.containerSize,
    required this.iconSize,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: containerSize,
        height: containerSize,
        decoration: BoxDecoration(
          color: isActive ? activeColor.withOpacity(0.12) : Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: containerSize * 0.12,
              offset: Offset(0, containerSize * 0.04),
            ),
          ],
        ),
        child: Icon(
          icon,
          color: isActive ? activeColor : Colors.black54,
          size: iconSize,
        ),
      ),
    );
  }
}

/// ─── Leave (red) button ──────────────────────
class _LeaveButton extends StatelessWidget {
  final VoidCallback? onTap;
  final double containerSize;
  final double iconSize;

  const _LeaveButton({
    this.onTap,
    required this.containerSize,
    required this.iconSize,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: containerSize,
        height: containerSize,
        decoration: BoxDecoration(
          color: LiveVideoTheme.primaryPink,
          shape: BoxShape.circle,
        ),
        child: Icon(
          Icons.call_end_rounded,
          color: Colors.white,
          size: iconSize,
        ),
      ),
    );
  }
}
