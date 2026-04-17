import 'package:fitiq/views/live_session/widgte/live_video_theme.dart';
import 'package:flutter/material.dart';

/// Chat input bar — transparent background, text field inside a block with border and radius.
class ChatInputBar extends StatefulWidget {
  final ValueChanged<String> onSend;
  final String hintText;
  final Color sendButtonColor;
  final double? height; // dynamic height
  final double? fontScale; // dynamic font scaling

  const ChatInputBar({
    super.key,
    required this.onSend,
    this.hintText = 'Type your message...',
    this.sendButtonColor = LiveVideoTheme.primaryPink,
    this.height,
    this.fontScale,
  });

  @override
  State<ChatInputBar> createState() => _ChatInputBarState();
}

class _ChatInputBarState extends State<ChatInputBar> {
  final TextEditingController _controller = TextEditingController();
  bool _hasText = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      final has = _controller.text.trim().isNotEmpty;
      if (has != _hasText) setState(() => _hasText = has);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleSend() {
    final text = _controller.text.trim();
    if (text.isEmpty) return;
    widget.onSend(text);
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textScale =
        widget.fontScale ?? MediaQuery.of(context).textScaleFactor;
    final barHeight = widget.height ?? size.height * 0.08;
    final inputHeight = barHeight * 0.65;
    final borderRadius = inputHeight / 2;
    final buttonPaddingH = inputHeight * 0.5;
    final buttonPaddingV = inputHeight * 0.25;

    return Container(
      color: Colors.transparent, // transparent background behind bar
      padding: EdgeInsets.symmetric(
        horizontal: size.width * 0.04,
        vertical: barHeight * 0.15,
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: inputHeight,
              decoration: BoxDecoration(
                color: Colors.white, // solid block for text field
                borderRadius: BorderRadius.circular(borderRadius),
                border: Border.all(
                  color: Colors.grey.shade400, // visible border
                  width: 1.2,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: inputHeight * 0.35),
                child: Center(
                  child: TextField(
                    controller: _controller,
                    textInputAction: TextInputAction.send,
                    onSubmitted: (_) => _handleSend(),
                    style: TextStyle(
                      fontSize: 14 * textScale,
                      color: Colors.black, // text color inside block
                    ),
                    decoration: InputDecoration(
                      hintText: widget.hintText,
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 14 * textScale,
                      ),
                      border: InputBorder.none,
                      isDense: true,
                      contentPadding: EdgeInsets.zero,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: size.width * 0.025),
          GestureDetector(
            onTap: _handleSend,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: EdgeInsets.symmetric(
                horizontal: buttonPaddingH,
                vertical: buttonPaddingV,
              ),
              decoration: BoxDecoration(
                color: _hasText
                    ? widget.sendButtonColor
                    : widget.sendButtonColor.withValues(alpha: 0.5),
                borderRadius: BorderRadius.circular(borderRadius),
              ),
              child: Text(
                'Send',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 14 * textScale,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
