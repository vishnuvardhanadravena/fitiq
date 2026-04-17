import 'package:fitiq/views/live_session/widgte/live_video_theme.dart';
import 'package:flutter/material.dart';
import '../models/chat_message.dart';

/// A single chat message row.
/// Reusable in full chat view and overlay mini-chat.
class ChatMessageTile extends StatelessWidget {
  final ChatMessage message;
  final double avatarRadius;
  final bool showTimestamp;

  const ChatMessageTile({
    super.key,
    required this.message,
    this.avatarRadius = 16,
    this.showTimestamp = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Avatar
          CircleAvatar(
            radius: avatarRadius,
            backgroundColor: LiveVideoTheme.primaryPink.withValues(alpha: 0.2),
            backgroundImage: message.avatarUrl != null
                ? NetworkImage(message.avatarUrl!)
                : null,
            child: message.avatarUrl == null
                ? Text(
                    message.senderName.isNotEmpty
                        ? message.senderName[0].toUpperCase()
                        : '?',
                    style: TextStyle(
                      fontSize: avatarRadius * 0.75,
                      fontWeight: FontWeight.bold,
                      color: LiveVideoTheme.primaryPink,
                    ),
                  )
                : null,
          ),
          const SizedBox(width: 10),
          // Message content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '${message.senderName}: ',
                        style: LiveVideoTheme.chatNameStyle,
                      ),
                      TextSpan(
                        text: message.message,
                        style: LiveVideoTheme.chatMessageStyle,
                      ),
                    ],
                  ),
                ),
                if (showTimestamp) ...[
                  const SizedBox(height: 2),
                  Text(
                    _formatTime(message.timestamp),
                    style: const TextStyle(
                      color: LiveVideoTheme.textGrey,
                      fontSize: 10,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _formatTime(DateTime dt) {
    final h = dt.hour.toString().padLeft(2, '0');
    final m = dt.minute.toString().padLeft(2, '0');
    return '$h:$m';
  }
}
