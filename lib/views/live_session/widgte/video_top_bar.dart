import 'package:fitiq/views/live_session/provider/live_video_config.dart';
import 'package:fitiq/views/live_session/provider/live_video_provider.dart';
import 'package:fitiq/views/live_session/widgte/live_badge.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


/// Top bar overlay on the video.
/// Reads [liveVideoConfigProvider] — only rebuilds when title/viewers change.
class VideoTopBar extends ConsumerWidget {
  final LiveVideoConfig initialConfig;
  final VoidCallback? onBack;

  const VideoTopBar({
    super.key,
    required this.initialConfig,
    this.onBack,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Granular: only config slice (viewerCount, isLive)
    final config = ref.watch(liveVideoConfigProvider(initialConfig));

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Row(
          children: [
            GestureDetector(
              onTap: onBack ?? () => Navigator.of(context).maybePop(),
              child: Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.chevron_left,
                  color: Colors.white,
                  size: 26,
                ),
              ),
            ),
            const SizedBox(width: 10),
            if (config.isLive) ...[
              const LiveBadge(),
              const SizedBox(width: 10),
            ],
            ViewerCountBadge(count: config.viewerCount),
          ],
        ),
      ),
    );
  }
}