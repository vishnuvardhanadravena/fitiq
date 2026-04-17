import 'package:fitiq/views/live_session/provider/live_video_config.dart';
import 'package:fitiq/views/live_session/provider/live_video_provider.dart';
import 'package:fitiq/views/live_session/widgte/chat_input_bar.dart';
import 'package:fitiq/views/live_session/widgte/chat_msg_tile.dart';
import 'package:fitiq/views/live_session/widgte/live_video_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/chat_message.dart';

class FullChatScreen extends ConsumerStatefulWidget {
  final LiveVideoConfig config;
  final List<ChatMessage> messages;
  final String title;

  const FullChatScreen({
    super.key,
    required this.config,
    this.messages = const [],
    this.title = 'Live Chat',
  });

  static Future<void> show(
    BuildContext context, {
    required LiveVideoConfig config,
    List<ChatMessage> messages = const [],
    String title = 'Live Chat',
  }) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) =>
            FullChatScreen(config: config, messages: messages, title: title),
      ),
    );
  }

  @override
  ConsumerState<FullChatScreen> createState() => _FullChatScreenState();
}

class _FullChatScreenState extends ConsumerState<FullChatScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollToBottom();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // ✅ Use new granular messages provider
    final messages = ref.watch(liveVideoMessagesProvider(widget.config));

    // ✅ Auto-scroll on new message
    ref.listen(liveVideoMessagesProvider(widget.config), (_, __) {
      _scrollToBottom();
    });

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: LiveVideoTheme.textDark,
            size: 20,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(widget.title, style: LiveVideoTheme.sectionHeaderStyle),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(color: LiveVideoTheme.inputBorder, height: 1),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: messages.isEmpty
                ? const Center(
                    child: Text(
                      'No messages yet. Be the first! 👋',
                      style: TextStyle(color: LiveVideoTheme.textGrey),
                    ),
                  )
                : ListView.builder(
                    controller: _scrollController,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    itemCount: messages.length,
                    itemBuilder: (_, i) => ChatMessageTile(
                      message: messages[i],
                      showTimestamp: true,
                    ),
                  ),
          ),
          ChatInputBar(
            onSend: (text) => ref
                // ✅ Use new messages notifier directly
                .read(liveVideoMessagesProvider(widget.config).notifier)
                .sendMessage(text),
          ),
        ],
      ),
    );
  }
}
