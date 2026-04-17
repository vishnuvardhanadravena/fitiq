import 'package:fitiq/views/live_session/provider/live_video_config.dart';
import 'package:fitiq/views/live_session/provider/live_video_provider.dart';
import 'package:fitiq/views/live_session/widgte/live_video_theme.dart';
import 'package:fitiq/views/live_session/widgte/video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class VideoOverlayInfo extends ConsumerWidget {
  final LiveVideoConfig initialConfig;

  const VideoOverlayInfo({super.key, required this.initialConfig});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final config = ref.watch(liveVideoConfigProvider(initialConfig));
    final progress = ref.watch(liveVideoProgressProvider(initialConfig));
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(
        size.width * 0.04,
        size.height * 0.015,
        size.width * 0.04,
        size.height * 0.01,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(config.title, style: LiveVideoTheme.titleStyle),
          const SizedBox(height: 2),
          Text('With ${config.hostName}', style: LiveVideoTheme.subtitleStyle),
          const SizedBox(height: 10),
          VideoProgressBar(
            activeColor: Colors.red,
            inactiveColor: Colors.amber,
            currentPosition: progress.position,
            totalDuration: progress.total,
            isLive: config.isLive,
            onSeek: (ratio) {
              final totalSecs = progress.total.inSeconds;
              final newPos = Duration(seconds: (ratio * totalSecs).round());
              // ✅ Write to progress provider, not the old monolith
              ref
                  .read(liveVideoProgressProvider(initialConfig).notifier)
                  .update(newPos);
            },
          ),
        ],
      ),
    );
  }
}
