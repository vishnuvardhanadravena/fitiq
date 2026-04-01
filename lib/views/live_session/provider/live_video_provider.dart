import 'package:fitiq/views/live_session/provider/live_video_config.dart';
import 'package:fitiq/views/live_session/provider/live_video_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/chat_message.dart';

part 'live_video_provider.g.dart';

// ─────────────────────────────────────────────
// LiveVideoNotifier
// Single notifier that owns ALL screen state:
//   • config (title, host, viewers, progress)
//   • messages list
//   • isMuted / isCameraOff / isChatOpen
//
// Pass [config] and optional [initialMessages]
// via the provider family argument.
// ─────────────────────────────────────────────

@riverpod
class LiveVideoNotifier extends _$LiveVideoNotifier {
  @override
  LiveVideoState build(LiveVideoConfig config) {
    return LiveVideoState(config: config, messages: _demoMessages());
  }

  // ── Chat ──────────────────────────────────

  /// Add a message sent by the current user.
  void sendMessage(String text) {
    if (text.trim().isEmpty) return;
    final msg = ChatMessage(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      senderName: 'You',
      message: text.trim(),
      timestamp: DateTime.now(),
    );
    state = state.copyWith(messages: [...state.messages, msg]);
  }

  /// Add a message received from a remote user (e.g. from socket/API).
  void receiveMessage(ChatMessage msg) {
    state = state.copyWith(messages: [...state.messages, msg]);
  }

  /// Bulk-load initial messages (e.g. after fetching history).
  void loadMessages(List<ChatMessage> messages) {
    state = state.copyWith(messages: messages);
  }

  // ── Controls ──────────────────────────────

  void toggleMute() => state = state.copyWith(isMuted: !state.isMuted);

  void toggleCamera() =>
      state = state.copyWith(isCameraOff: !state.isCameraOff);

  void toggleChat() => state = state.copyWith(isChatOpen: !state.isChatOpen);

  void closeChat() => state = state.copyWith(isChatOpen: false);

  void openChat() => state = state.copyWith(isChatOpen: true);

  // ── Config updates (e.g. viewer count from socket) ──

  void updateViewerCount(int count) {
    state = state.copyWith(config: state.config.copyWith(viewerCount: count));
  }

  void updateProgress(Duration position) {
    state = state.copyWith(
      config: state.config.copyWith(
        currentPosition: position,
        totalDuration: state.config.totalDuration.inSeconds == 0
            ? const Duration(minutes: 30) // fallback
            : state.config.totalDuration,
      ),
    );
  }

  void updateTotalDuration(Duration duration) {
    state = state.copyWith(
      config: state.config.copyWith(totalDuration: duration),
    );
  }

  List<ChatMessage> _demoMessages() => [
    ChatMessage(
      id: '1',
      senderName: 'Meera',
      message: 'This stretch feels amazing 🔥',
      timestamp: DateTime.now().subtract(const Duration(minutes: 2)),
    ),
    ChatMessage(
      id: '2',
      senderName: 'Rahul',
      message: 'Loving the energy today!',
      timestamp: DateTime.now().subtract(const Duration(minutes: 1)),
    ),
  ];
}

// ─the messages list — ChatPanel rebuilds on new messages only.
@riverpod
List<ChatMessage> liveVideoMessages(Ref ref, LiveVideoConfig config) {
  return ref.watch(liveVideoProvider(config)).messages;
}

/// Only the chat-open flag — VideoActionBar rebuilds on toggle only.
@riverpod
bool liveVideoChatOpen(Ref ref, LiveVideoConfig config) {
  return ref.watch(liveVideoProvider(config)).isChatOpen;
}

/// Only mute state.
@riverpod
bool liveVideoIsMuted(Ref ref, LiveVideoConfig config) {
  return ref.watch(liveVideoProvider(config)).isMuted;
}

/// Only camera-off state.
@riverpod
bool liveVideoIsCameraOff(Ref ref, LiveVideoConfig config) {
  return ref.watch(liveVideoProvider(config)).isCameraOff;
}

/// Only the config (viewer count, progress) — VideoTopBar + VideoOverlayInfo.
@riverpod
LiveVideoConfig liveVideoConfig(Ref ref, LiveVideoConfig config) {
  return ref.watch(liveVideoProvider(config)).config;
}
