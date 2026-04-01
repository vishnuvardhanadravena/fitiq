import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_message.freezed.dart';
part 'chat_message.g.dart';

// ─────────────────────────────────────────────
// ChatMessage — immutable, Freezed
// ─────────────────────────────────────────────

@freezed
abstract class ChatMessage with _$ChatMessage {
  const factory ChatMessage({
    required String id,
    @JsonKey(name: 'sender_name') required String senderName,
    required String message,
    @JsonKey(name: 'avatar_url') String? avatarUrl,
    required DateTime timestamp,
  }) = _ChatMessage;

  factory ChatMessage.fromJson(Map<String, dynamic> json) =>
      _$ChatMessageFromJson(json);
}