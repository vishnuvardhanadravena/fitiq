// import 'package:fitiq/views/live_session/provider/live_video_config.dart';
// import 'package:fitiq/views/live_session/provider/live_video_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:video_player/video_player.dart';

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
//   late VideoPlayerController _controller;
//   bool _initialized = false;
//   bool _hasError = false;
//   Duration? _lastDuration;
//   DateTime? _lastProgressUpdate;

//   @override
//   void initState() {
//     super.initState();
//     _initPlayer();
//   }

//   Future<void> _initPlayer() async {
//     _controller = VideoPlayerController.networkUrl(
//       Uri.parse(widget.videoUrl),
//       // ✅ Reduce buffering overhead — don't mix with other audio
//       videoPlayerOptions: VideoPlayerOptions(
//         mixWithOthers: false,
//         allowBackgroundPlayback: false,
//       ),
//       httpHeaders: const {
//         // ✅ Tell CDN/server to serve cached version aggressively
//         'Cache-Control': 'max-age=3600',
//         'Connection': 'keep-alive',
//         'X-Quality': '720p',
//       },
//     );

//     try {
//       await _controller.initialize();

//       if (!mounted) return;

//       final total = _controller.value.duration;
//       ref
//           .read(liveVideoProgressProvider(widget.config).notifier)
//           .updateTotal(total);

//       // ✅ Set playback speed to normal explicitly
//       await _controller.setPlaybackSpeed(1.0);

//       // ✅ Pre-buffer before showing — reduces initial stutter
//       await _controller.play();
//       await Future.delayed(const Duration(milliseconds: 300));

//       if (!mounted) return;
//       setState(() => _initialized = true);

//       _controller.addListener(_onVideoProgress);
//     } catch (e) {
//       if (!mounted) return;
//       setState(() => _hasError = true);
//     }
//   }

//   void _onVideoProgress() {
//     if (!_controller.value.isInitialized) return;

//     // ✅ Skip update while buffering to avoid jitter
//     if (_controller.value.isBuffering) return;

//     final position = _controller.value.position;
//     final duration = _controller.value.duration;

//     final notifier = ref.read(
//       liveVideoProgressProvider(widget.config).notifier,
//     );

//     if (_lastDuration != duration) {
//       _lastDuration = duration;
//       notifier.updateTotal(duration);
//     }

//     final now = DateTime.now();
//     if (_lastProgressUpdate == null ||
//         now.difference(_lastProgressUpdate!).inMilliseconds >= 1000) {
//       _lastProgressUpdate = now;
//       notifier.update(position);
//     }
//   }

//   @override
//   void dispose() {
//     _controller.removeListener(_onVideoProgress);
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (_hasError) {
//       return const Center(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Icon(Icons.error_outline, color: Colors.white54, size: 48),
//             SizedBox(height: 8),
//             Text(
//               'Failed to load video',
//               style: TextStyle(color: Colors.white54),
//             ),
//           ],
//         ),
//       );
//     }

//     if (!_initialized) {
//       return const Center(
//         child: CircularProgressIndicator(color: Colors.white),
//       );
//     }

//     return ClipRect(
//       child: LayoutBuilder(
//         builder: (context, constraints) {
//           final videoRatio = _controller.value.aspectRatio;
//           final screenRatio = constraints.maxWidth / constraints.maxHeight;

//           double width, height;
//           if (videoRatio > screenRatio) {
//             height = constraints.maxHeight;
//             width = height * videoRatio;
//           } else {
//             width = constraints.maxWidth;
//             height = width / videoRatio;
//           }

//           return Center(
//             child: SizedBox(
//               width: width,
//               height: height,
//               // ✅ Wrap in RepaintBoundary — isolates video repaints
//               // from the rest of the widget tree
//               child: RepaintBoundary(child: VideoPlayer(_controller)),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
import 'dart:async';
import 'package:fitiq/views/live_session/provider/live_video_config.dart';
import 'package:fitiq/views/live_session/provider/live_video_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';

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
  late final Player _player;
  late final VideoController _controller;

  bool _initialized = false;
  bool _hasError = false;

  Duration? _lastDuration;
  DateTime? _lastProgressUpdate;
  StreamSubscription? _positionSub;
  StreamSubscription? _durationSub;
  StreamSubscription? _errorSub;

  @override
  void initState() {
    super.initState();
    _initPlayer();
  }

  Future<void> _initPlayer() async {
    // ✅ GPU hardware accelerated by default
    _player = Player(
      configuration: const PlayerConfiguration(muted: false, ready: null),
    );

    // ✅ Cap output resolution to 720p for mid-range devices like A31
    _controller = VideoController(
      _player,
      configuration: const VideoControllerConfiguration(
        width: 1280,
        height: 720,
        enableHardwareAcceleration: true, // GPU decode
      ),
    );

    try {
      // ✅ Force hardware decode via mediacodec (Android)
      final nativePlayer = _player.platform as NativePlayer;
      await nativePlayer.setProperty('hwdec', 'mediacodec');
      await nativePlayer.setProperty('video-sync', 'display-resample');
      await nativePlayer.setProperty('cache', 'yes');
      await nativePlayer.setProperty('cache-secs', '10');
    } catch (_) {
      // Non-Android platforms won't have NativePlayer — safe to ignore
    }

    // ✅ Listen to position stream — throttled to 1/sec
    _positionSub = _player.stream.position.listen((position) {
      final now = DateTime.now();
      if (_lastProgressUpdate == null ||
          now.difference(_lastProgressUpdate!).inMilliseconds >= 1000) {
        _lastProgressUpdate = now;
        if (mounted) {
          ref
              .read(liveVideoProgressProvider(widget.config).notifier)
              .update(position);
        }
      }
    });

    // ✅ Listen to duration — only updates once when video loads
    _durationSub = _player.stream.duration.listen((duration) {
      if (duration != _lastDuration && duration != Duration.zero) {
        _lastDuration = duration;
        if (mounted) {
          ref
              .read(liveVideoProgressProvider(widget.config).notifier)
              .updateTotal(duration);
        }
      }
    });

    // ✅ Error handling
    _errorSub = _player.stream.error.listen((error) {
      if (error.isNotEmpty && mounted) {
        setState(() => _hasError = true);
      }
    });

    await _player.open(Media(widget.videoUrl));

    if (!mounted) return;
    setState(() => _initialized = true);
  }

  @override
  void dispose() {
    _positionSub?.cancel();
    _durationSub?.cancel();
    _errorSub?.cancel();
    _player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_hasError) {
      return const Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.error_outline, color: Colors.white54, size: 48),
            SizedBox(height: 8),
            Text(
              'Failed to load video',
              style: TextStyle(color: Colors.white54),
            ),
          ],
        ),
      );
    }

    if (!_initialized) {
      return const Center(
        child: CircularProgressIndicator(color: Colors.white),
      );
    }

    // ✅ Video widget renders via GPU texture — no Flutter rebuild involvement
    return RepaintBoundary(
      child: Video(
        controller: _controller,
        // ✅ Disable built-in controls — you have your own UI
        controls: NoVideoControls,
        fit: BoxFit.cover,
      ),
    );
  }
}
