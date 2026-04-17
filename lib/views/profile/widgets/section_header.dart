import 'package:fitiq/core/theame/app_colors.dart';
import 'package:fitiq/core/theame/app_text_styles.dart';
import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  // ── Core ───────────────────────────────
  final String title;
  final String? subtitle;

  // ── Layout ─────────────────────────────
  final EdgeInsetsGeometry? padding;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;

  // ── Actions ────────────────────────────
  final VoidCallback? onEdit;
  final Widget? trailing;

  // ── Styling ────────────────────────────
  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;
  final Color? iconColor;

  // ── Icons ──────────────────────────────
  final IconData? editIcon;
  final double? iconSize;

  // ── Responsive ─────────────────────────
  final double? sw;

  const SectionHeader({
    super.key,
    required this.title,
    this.subtitle,
    this.padding,
    this.mainAxisAlignment = MainAxisAlignment.spaceBetween,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.onEdit,
    this.trailing,
    this.titleStyle,
    this.subtitleStyle,
    this.iconColor,
    this.editIcon,
    this.iconSize,
    this.sw,
  });

  @override
  Widget build(BuildContext context) {
    final width = sw ?? MediaQuery.of(context).size.width;

    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: Row(
        mainAxisAlignment: mainAxisAlignment,
        crossAxisAlignment: crossAxisAlignment,
        children: [
          // ── Title + Subtitle ─────────────
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style:
                      titleStyle ??
                      AppTextStyles.headingMedium.copyWith(
                        fontSize: width * 0.043,
                        fontWeight: FontWeight.w700,
                        color: AppColors.primaryColor,
                      ),
                ),

                if (subtitle != null) ...[
                  SizedBox(height: width * 0.01),
                  Text(
                    subtitle!,
                    style:
                        subtitleStyle ??
                        TextStyle(
                          fontSize: width * 0.032,
                          color: Colors.grey.shade600,
                        ),
                  ),
                ],
              ],
            ),
          ),

          // ── Custom trailing widget ───────
          if (trailing != null)
            trailing!
          // ── Default edit icon ────────────
          else if (onEdit != null)
            GestureDetector(
              onTap: onEdit,
              child: Icon(
                editIcon ?? Icons.edit_outlined,
                size: iconSize ?? width * 0.05,
                color: iconColor ?? const Color(0xFF5B9BD5),
              ),
            ),
        ],
      ),
    );
  }
}
