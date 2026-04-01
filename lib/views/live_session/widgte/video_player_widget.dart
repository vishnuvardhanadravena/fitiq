import 'package:fitiq/views/live_session/provider/live_video_config.dart';
import 'package:fitiq/views/live_session/provider/live_video_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:video_player/video_player.dart';

class NetworkVideoPlayer extends ConsumerStatefulWidget {
  final String videoUrl;
  final LiveVideoConfig config;

  const NetworkVideoPlayer({
    super.key,
    required this.videoUrl,
    required this.config,
  });

  @override
  ConsumerState<NetworkVideoPlayer> createState() => _NetworkVideoPlayerState();
}

class _NetworkVideoPlayerState extends ConsumerState<NetworkVideoPlayer> {
  late VideoPlayerController _controller;
  bool _initialized = false;

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.network(widget.videoUrl)
      ..initialize().then((_) {
        final total = _controller.value.duration;
        print("Total duration: $total");

        ref
            .read(liveVideoProvider(widget.config).notifier)
            .updateTotalDuration(total);

        setState(() => _initialized = true);
        _controller.play();
      });

    _controller.addListener(() {
      if (!_controller.value.isInitialized) return;

      final position = _controller.value.position;
      final duration = _controller.value.duration;

      final notifier = ref.read(liveVideoProvider(widget.config).notifier);

      notifier.updateProgress(position);

      // you don't have this yet → add it (below)
      notifier.updateTotalDuration(duration);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
  return _initialized
    ? Center(
        child: AspectRatio(
          aspectRatio: _controller.value.aspectRatio,
          child: VideoPlayer(_controller),
        ),
      )
    : const Center(child: CircularProgressIndicator()); 
  }

  // @override
  // Widget build(BuildContext context) {
  //   return _initialized
  //       ? AspectRatio(
  //           aspectRatio: _controller.value.aspectRatio,
  //           child: VideoPlayer(_controller),
  //         )
  //       : const Center(child: CircularProgressIndicator());
  // }
}
// import 'package:better_player_plus/better_player_plus.dart';
// import 'package:fitiq/views/live_session/provider/live_video_config.dart';
// import 'package:fitiq/views/live_session/provider/live_video_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// class NetworkVideoPlayer extends ConsumerStatefulWidget {
//   final String videoUrl;
//   final LiveVideoConfig config;

//   const NetworkVideoPlayer({
//     super.key,
//     required this.videoUrl,
//     required this.config,
//   });

//   @override
//   ConsumerState<NetworkVideoPlayer> createState() => _NetworkVideoPlayerState();
// }

// class _NetworkVideoPlayerState extends ConsumerState<NetworkVideoPlayer> {
//   late BetterPlayerController _betterPlayerController;
//   bool _initialized = false;

//   @override
//   void initState() {
//     super.initState();

//     BetterPlayerDataSource dataSource = BetterPlayerDataSource(
//       BetterPlayerDataSourceType.network,
//       widget.videoUrl,
//       bufferingConfiguration: BetterPlayerBufferingConfiguration(
//         minBufferMs: 2000,
//         maxBufferMs: 10000,
//         bufferForPlaybackMs: 1000,
//         bufferForPlaybackAfterRebufferMs: 2000,
//       ),
//     );

//     _betterPlayerController = BetterPlayerController(
//       BetterPlayerConfiguration(
//         autoPlay: true,
//         aspectRatio: 16 / 9,
//         fit: BoxFit.contain,
//         fullScreenByDefault: false,
//         controlsConfiguration: BetterPlayerControlsConfiguration(
//           enableProgressText: true,
//           enableProgressBar: true,
//           enableFullscreen: true,
//         ),
//         eventListener: _handlePlayerEvent,
//       ),
//       betterPlayerDataSource: dataSource,
//     );

//     _initialized = true;
//   }

//   void _handlePlayerEvent(BetterPlayerEvent event) {
//     if (event.betterPlayerEventType == BetterPlayerEventType.progress) {
//       final position = event.parameters?['progress'] as Duration?;
//       final total = event.parameters?['duration'] as Duration?;
//       if (position != null && total != null) {
//         ref
//             .read(liveVideoProvider(widget.config).notifier)
//             .updateProgress(position);
//         ref
//             .read(liveVideoProvider(widget.config).notifier)
//             .updateTotalDuration(total);
//       }
//     }
//   }

//   @override
//   void dispose() {
//     _betterPlayerController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return _initialized
//         ? AspectRatio(
//             aspectRatio: 16 / 9,
//             child: BetterPlayer(controller: _betterPlayerController),
//           )
//         : const Center(child: CircularProgressIndicator());
//   }
// }
