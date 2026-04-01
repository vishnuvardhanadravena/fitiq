import 'package:fitiq/views/live_session/models/chat_message.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'live_video_config.dart';

part 'live_video_state.freezed.dart';

// ─────────────────────────────────────────────
// LiveVideoState — single source of truth
// for the entire live video screen
// ─────────────────────────────────────────────

@freezed
abstract class LiveVideoState with _$LiveVideoState {
  const factory LiveVideoState({
    required LiveVideoConfig config,
    @Default([]) List<ChatMessage> messages,
    @Default(false) bool isMuted,
    @Default(false) bool isCameraOff,
    @Default(false) bool isChatOpen,
  }) = _LiveVideoState;
}