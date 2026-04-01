import 'package:fitiq/views/live_session/provider/live_video_config.dart';
import 'package:fitiq/views/live_session/provider/live_video_provider.dart';
import 'package:fitiq/views/live_session/widgte/chat_input_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Chat panel shown inside the video overlay.
/// Reads [liveVideoMessagesProvider] — rebuilds only when messages change.
class ChatPanel extends ConsumerStatefulWidget {
  final LiveVideoConfig config;
  final VoidCallback? onViewAll;
  final double maxHeight;

  const ChatPanel({
    super.key,
    required this.config,
    this.onViewAll,
    this.maxHeight = 280,
  });

  @override
  ConsumerState<ChatPanel> createState() => _ChatPanelState();
}

class _ChatPanelState extends ConsumerState<ChatPanel> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Only this widget rebuilds when messages list changes
    // final messages = ref.watch(liveVideoMessagesProvider(widget.config));

    // Auto-scroll on new message
    ref.listen(liveVideoMessagesProvider(widget.config), (_, __) {
      _scrollToBottom();
    });

    return Container(
      decoration: const BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Drag handle
          // Container(
          //   margin: const EdgeInsets.only(top: 10, bottom: 4),
          //   width: 36,
          //   height: 4,
          //   decoration: BoxDecoration(
          //     color: Colors.grey[300],
          //     borderRadius: BorderRadius.circular(2),
          //   ),
          // ),
          // _buildHeader(),
          // Messages
          // ConstrainedBox(
          //   constraints: BoxConstraints(maxHeight: widget.maxHeight),
          //   child: messages.isEmpty
          //       ? const Padding(
          //           padding: EdgeInsets.all(24),
          //           child: Text(
          //             'No messages yet. Be the first to say hi! 👋',
          //             style:
          //                 TextStyle(color: LiveVideoTheme.textGrey, fontSize: 13),
          //             textAlign: TextAlign.center,
          //           ),
          //         )
          //       : ListView.builder(
          //           controller: _scrollController,
          //           shrinkWrap: true,
          //           padding: const EdgeInsets.symmetric(vertical: 8),
          //           itemCount: messages.length,
          //           itemBuilder: (_, i) =>
          //               ChatMessageTile(message: messages[i]),
          //         ),
          // ),
          ChatInputBar(
            onSend: (text) => ref
                .read(liveVideoProvider(widget.config).notifier)
                .sendMessage(text),
          ),
          SizedBox(height: MediaQuery.of(context).padding.bottom),
        ],
      ),
    );
  }

  // Widget _buildHeader() {
  //   return Padding(
  //     padding: const EdgeInsets.fromLTRB(16, 4, 12, 8),
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       children: [
  //         Text('Chat', style: LiveVideoTheme.sectionHeaderStyle),
  //         if (widget.onViewAll != null)
  //           GestureDetector(
  //             onTap: widget.onViewAll,
  //             child: const Row(
  //               children: [
  //                 Text('View All', style: LiveVideoTheme.viewAllStyle),
  //                 SizedBox(width: 2),
  //                 Icon(
  //                   Icons.chevron_right,
  //                   color: LiveVideoTheme.accentBlue,
  //                   size: 18,
  //                 ),
  //               ],
  //             ),
  //           ),
  //       ],
  //     ),
  //   );
  // }

}
