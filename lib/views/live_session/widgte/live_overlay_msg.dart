import 'package:fitiq/views/live_session/provider/live_video_config.dart';
import 'package:fitiq/views/live_session/provider/live_video_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LiveMessagesOverlay extends ConsumerWidget {
  final LiveVideoConfig config;
  final int maxVisibleMessages;

  const LiveMessagesOverlay({
    super.key,
    required this.config,
    this.maxVisibleMessages = 3,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final messages = ref.watch(liveVideoProvider(config)).messages;

    final visibleMessages = messages.length > maxVisibleMessages
        ? messages.sublist(messages.length - maxVisibleMessages)
        : messages;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: visibleMessages.map((msg) {
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 4),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.3),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            '${msg.senderName}: ${msg.message}',
            style: const TextStyle(color: Colors.white, fontSize: 14),
          ),
        );
      }).toList(),
    );
  }
}
