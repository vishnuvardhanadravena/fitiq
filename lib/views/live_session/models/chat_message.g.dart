// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChatMessage _$ChatMessageFromJson(Map<String, dynamic> json) => _ChatMessage(
  id: json['id'] as String,
  senderName: json['sender_name'] as String,
  message: json['message'] as String,
  avatarUrl: json['avatar_url'] as String?,
  timestamp: DateTime.parse(json['timestamp'] as String),
);

Map<String, dynamic> _$ChatMessageToJson(_ChatMessage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'sender_name': instance.senderName,
      'message': instance.message,
      'avatar_url': instance.avatarUrl,
      'timestamp': instance.timestamp.toIso8601String(),
    };
