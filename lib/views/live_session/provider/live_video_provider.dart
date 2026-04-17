import 'package:fitiq/views/live_session/provider/live_video_config.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/chat_message.dart';

part 'live_video_provider.g.dart';

@riverpod
class LiveVideoProgress extends _$LiveVideoProgress {
  @override
  ({Duration position, Duration total}) build(LiveVideoConfig config) =>
      (position: Duration.zero, total: Duration.zero);

  void update(Duration position) =>
      state = (position: position, total: state.total);

  void updateTotal(Duration total) {
    if (total == state.total) return; // no-op if unchanged
    state = (position: state.position, total: total);
  }
}

@riverpod
class LiveVideoMessages extends _$LiveVideoMessages {
  @override
  List<ChatMessage> build(LiveVideoConfig config) => _demoMessages();

  void sendMessage(String text) {
    if (text.trim().isEmpty) return;
    state = [
      ...state,
      ChatMessage(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        senderName: 'You',
        message: text.trim(),
        timestamp: DateTime.now(),
      ),
    ];
  }

  void receiveMessage(ChatMessage msg) => state = [...state, msg];

  void loadMessages(List<ChatMessage> messages) => state = messages;

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

typedef LiveVideoControlsState = ({
  bool isMuted,
  bool isCameraOff,
  bool isChatOpen,
});

@riverpod
class LiveVideoControls extends _$LiveVideoControls {
  @override
  LiveVideoControlsState build(LiveVideoConfig config) =>
      (isMuted: false, isCameraOff: false, isChatOpen: false);

  void toggleMute() => state = (
    isMuted: !state.isMuted,
    isCameraOff: state.isCameraOff,
    isChatOpen: state.isChatOpen,
  );

  void toggleCamera() => state = (
    isMuted: state.isMuted,
    isCameraOff: !state.isCameraOff,
    isChatOpen: state.isChatOpen,
  );

  void toggleChat() => state = (
    isMuted: state.isMuted,
    isCameraOff: state.isCameraOff,
    isChatOpen: !state.isChatOpen,
  );

  void openChat() => state = (
    isMuted: state.isMuted,
    isCameraOff: state.isCameraOff,
    isChatOpen: true,
  );

  void closeChat() => state = (
    isMuted: state.isMuted,
    isCameraOff: state.isCameraOff,
    isChatOpen: false,
  );
}

@riverpod
class LiveVideoConfigNotifier extends _$LiveVideoConfigNotifier {
  @override
  LiveVideoConfig build(LiveVideoConfig config) => config;

  void updateViewerCount(int count) =>
      state = state.copyWith(viewerCount: count);

  void updateTitle(String title) => state = state.copyWith(title: title);
}

/// Chat open flag — AnimationController in LiveVideoScreen
@riverpod
bool liveVideoChatOpen(Ref ref, LiveVideoConfig config) =>
    ref.watch(liveVideoControlsProvider(config)).isChatOpen;

/// Mute flag — mic button in VideoActionBar
@riverpod
bool liveVideoIsMuted(Ref ref, LiveVideoConfig config) =>
    ref.watch(liveVideoControlsProvider(config)).isMuted;

/// Camera flag — camera button in VideoActionBar
@riverpod
bool liveVideoIsCameraOff(Ref ref, LiveVideoConfig config) =>
    ref.watch(liveVideoControlsProvider(config)).isCameraOff;

/// Progress tuple — ProgressBar only
@riverpod
({Duration position, Duration total}) liveVideoProgressState(
  Ref ref,
  LiveVideoConfig config,
) => ref.watch(liveVideoProgressProvider(config));

/// Config snapshot — VideoTopBar / VideoOverlayInfo
@riverpod
LiveVideoConfig liveVideoConfigState(Ref ref, LiveVideoConfig config) =>
    ref.watch(liveVideoConfigProvider(config));

/// Messages list — ChatPanel / LiveMessagesOverlay
@riverpod
List<ChatMessage> liveVideoMessagesList(Ref ref, LiveVideoConfig config) =>
    ref.watch(liveVideoMessagesProvider(config));
