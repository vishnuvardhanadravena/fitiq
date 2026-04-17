import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Widget? titleWidget;
  final TextStyle? titleStyle;

  final bool showBackButton;
  final VoidCallback? onBackTap;

  final Color backgroundColor;
  final Gradient? gradient;
  final double elevation;

  final List<Widget>? actions;

  final double height;
  final EdgeInsetsGeometry? padding;
  final TextAlign textAlign;

  // 🔥 Back Button Controls
  final Color backButtonBgColor;
  final Color backButtonIconColor;
  final Color? backButtonBorderColor;
  final IconData backIcon;
  final double? backButtonSize;
  final double? backIconSize;
  final BorderRadius? backButtonRadius;

  // 🔥 Advanced Controls
  final EdgeInsets? backButtonPadding;
  final Alignment backButtonAlignment;
  final bool enableBackRipple;

  const CustomAppBar({
    super.key,
    this.title,
    this.titleWidget,
    this.titleStyle,
    this.showBackButton = true,
    this.onBackTap,
    this.backgroundColor = Colors.white,
    this.gradient,
    this.elevation = 0,
    this.actions,
    this.height = kToolbarHeight,
    this.padding,
    this.textAlign = TextAlign.start,
    

    // Defaults
    this.backButtonBgColor = Colors.white,
    this.backButtonIconColor = const Color(0xFF1A1A2E),
    this.backButtonBorderColor,
    this.backIcon = Icons.chevron_left_rounded,
    this.backButtonSize,
    this.backIconSize,
    this.backButtonRadius,

    this.backButtonPadding,
    this.backButtonAlignment = Alignment.centerLeft,
    this.enableBackRipple = true,
  });

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    final defaultPadding =
        padding ?? EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h);

    return Material(
      color: Colors.transparent,
      elevation: elevation,
      child: Container(
        decoration: BoxDecoration(
          color: gradient == null ? backgroundColor : null,
          gradient: gradient,
        ),
        child: SafeArea(
          bottom: false,
          child: Padding(
            padding: defaultPadding,
            child: Row(
              children: [
                /// 🔙 Back Button
                if (showBackButton)
                  Align(
                    alignment: backButtonAlignment,
                    child: Padding(
                      padding: backButtonPadding ?? EdgeInsets.zero,
                      child: enableBackRipple
                          ? Material(
                              color: Colors.transparent,
                              child: InkWell(
                                borderRadius: backButtonRadius ??
                                    BorderRadius.circular(10.r),
                                onTap: onBackTap ??
                                    () => Navigator.maybePop(context),
                                child: _buildBackButton(),
                              ),
                            )
                          : GestureDetector(
                              onTap: onBackTap ??
                                  () => Navigator.maybePop(context),
                              child: _buildBackButton(),
                            ),
                    ),
                  )
                else
                  SizedBox(width: backButtonSize ?? 30.w),

                SizedBox(width: 10.w),

                /// 🧾 Title
                Expanded(
                  child: titleWidget ??
                      Text(
                        title ?? '',
                        textAlign: textAlign,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: titleStyle ??
                            TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w700,
                              color: const Color(0xFF2E3192),
                            ),
                      ),
                ),

                /// ⚡ Actions
                if (actions != null && actions!.isNotEmpty)
                  Row(mainAxisSize: MainAxisSize.min, children: actions!)
                else
                  SizedBox(width: 40.w),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// 🔧 Back Button UI
  Widget _buildBackButton() {
    return Container(
      width: backButtonSize ?? 30.w,
      height: backButtonSize ?? 30.w,
      decoration: BoxDecoration(
        color: backButtonBgColor,
        borderRadius:
            backButtonRadius ?? BorderRadius.circular(10.r),
        border: backButtonBorderColor != null
            ? Border.all(color: backButtonBorderColor!)
            : Border.all(color: Colors.grey.shade200),
      ),
      child: Icon(
        backIcon,
        size: backIconSize ?? 24.sp,
        color: backButtonIconColor,
      ),
    );
  }
}