import 'package:fitiq/views/live_session/provider/live_video_config.dart';
import 'package:fitiq/views/live_session/provider/live_video_provider.dart';
import 'package:fitiq/views/live_session/screens/chat_scrreen.dart';
import 'package:fitiq/views/live_session/widgte/chat_panal.dart';
import 'package:fitiq/views/live_session/widgte/live_overlay_msg.dart';
import 'package:fitiq/views/live_session/widgte/live_video_theme.dart';
import 'package:fitiq/views/live_session/widgte/video_action.dart';
import 'package:fitiq/views/live_session/widgte/video_overlay_info.dart';
import 'package:fitiq/views/live_session/widgte/video_player_placeholder.dart';
import 'package:fitiq/views/live_session/widgte/video_player_widget.dart';
import 'package:fitiq/views/live_session/widgte/video_top_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LiveVideoScreen extends ConsumerStatefulWidget {
  final LiveVideoConfig config;
  final Widget? playerWidget;
  final VoidCallback? onLeave;
  final VoidCallback? onViewAllChat;

  const LiveVideoScreen({
    super.key,
    required this.config,
    this.playerWidget,
    this.onLeave,
    this.onViewAllChat,
  });

  static Future<void> show(
    BuildContext context, {
    required LiveVideoConfig config,
    Widget? playerWidget,
    VoidCallback? onLeave,
    VoidCallback? onViewAllChat,
  }) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => LiveVideoScreen(
          config: config,
          playerWidget: playerWidget,
          onLeave: onLeave,
          onViewAllChat: onViewAllChat,
        ),
      ),
    );
  }

  @override
  ConsumerState<LiveVideoScreen> createState() => _LiveVideoScreenState();
}

class _LiveVideoScreenState extends ConsumerState<LiveVideoScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _chatAnimController;

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
    );

    _chatAnimController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 320),
    );
  }

  @override
  void dispose() {
    _chatAnimController.dispose();
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    super.dispose();
  }

  void _handleLeave() {
    if (widget.onLeave != null) {
      widget.onLeave!();
    } else {
      Navigator.of(context).maybePop();
    }
  }

  void _handleViewAll() {
    if (widget.onViewAllChat != null) {
      widget.onViewAllChat!();
      return;
    }
    final messages = ref.read(liveVideoProvider(widget.config)).messages;
    FullChatScreen.show(context, config: widget.config, messages: messages);
  }

  @override
  Widget build(BuildContext context) {
    final isChatOpen = ref.watch(liveVideoChatOpenProvider(widget.config));
    ref.listen<bool>(liveVideoChatOpenProvider(widget.config), (_, isOpen) {
      if (isOpen) {
        _chatAnimController.forward();
      } else {
        _chatAnimController.reverse();
      }
    });

    // Screen dimensions
    final size = MediaQuery.of(context).size;
    final safeBottom = MediaQuery.of(context).padding.bottom;
    final safeTop = MediaQuery.of(context).padding.top;
    final textScale = MediaQuery.of(context).textScaleFactor;
    // final chatHeight = size.height * 0.3;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned.fill(
            child: VideoPlayerPlaceholder(
              thumbnailUrl: widget.config.thumbnailUrl,
              playerWidget: NetworkVideoPlayer(
                videoUrl:
                    widget.config.videoUrl ?? "", // pass your video URL here
                config: widget.config,
              ),
            ),
          ),

          // Top bar
          Positioned(
            top: safeTop,
            left: 0,
            right: 0,
            child: VideoTopBar(
              initialConfig: widget.config,
              onBack: _handleLeave,
            ),
          ),
          Positioned(
            bottom: safeBottom,
            left: 0,
            right: 0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
                  child: LiveMessagesOverlay(
                    config: widget.config,
                    maxVisibleMessages: 3,
                  ),
                ),

                /// INFO
                AnimatedSlide(
                  offset: isChatOpen ? const Offset(0, -0.05) : Offset.zero,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeOutCubic,
                  child: VideoOverlayInfo(initialConfig: widget.config),
                ),

                /// CHAT PANEL
                SizeTransition(
                  sizeFactor: _chatAnimController,
                  axisAlignment: -1,
                  child: ChatPanel(
                    config: widget.config,
                    onViewAll: _handleViewAll,
                    maxHeight: size.height * 0.3,
                  ),
                ),

                /// ACTION BAR
                VideoActionBar(
                  config: widget.config,
                  onMore: () => _showMoreOptions(context),
                  onLeave: _handleLeave,
                  height: size.height * 0.09,
                  fontScale: textScale,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showMoreOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 10, bottom: 6),
              width: 36,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            _MoreOption(
              icon: Icons.share_outlined,
              label: 'Share stream',
              onTap: () => Navigator.pop(context),
            ),
            _MoreOption(
              icon: Icons.report_outlined,
              label: 'Report',
              onTap: () => Navigator.pop(context),
            ),
            _MoreOption(
              icon: Icons.info_outline,
              label: 'Stream info',
              onTap: () => Navigator.pop(context),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

class _MoreOption extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback? onTap;

  const _MoreOption({required this.icon, required this.label, this.onTap});

  @override
  Widget build(BuildContext context) {
    final textScale = MediaQuery.of(context).textScaleFactor;
    return ListTile(
      leading: Icon(icon, color: LiveVideoTheme.textDark, size: 24 * textScale),
      title: Text(
        label,
        style: LiveVideoTheme.chatMessageStyle.copyWith(
          fontSize: 16 * textScale,
        ),
      ),
      onTap: onTap,
    );
  }
}
