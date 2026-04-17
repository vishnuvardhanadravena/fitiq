import 'package:fitiq/core/theame/app_colors.dart';
import 'package:fitiq/core/theame/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FitiqAuthFooter extends StatelessWidget {
  final VoidCallback? onRegister;
  final VoidCallback? onForgotPassword;
  final String promptText;
  final String registerText;
  final String forgotPasswordText;
  final Color? registerTextColor;
  final Color? forgotPasswordTextColor;
  final TextStyle? promptTextStyle;
  final TextStyle? registerTextStyle;
  final TextStyle? forgotPasswordTextStyle;
  final double? spacing;
  final double? verticalSpacing;

  const FitiqAuthFooter({
    super.key,
    this.onRegister,
    this.onForgotPassword,
    this.promptText = "Don't have an account?",
    this.registerText = 'Register Now',
    this.forgotPasswordText = '',
    this.registerTextColor,
    this.forgotPasswordTextColor,
    this.promptTextStyle,
    this.registerTextStyle,
    this.forgotPasswordTextStyle,
    this.spacing,
    this.verticalSpacing,
  });

  @override
  Widget build(BuildContext context) {
    final bool tablet = MediaQuery.of(context).size.width >= 600;

    return Column(
      children: [
        Wrap(
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Text(
              promptText,
              style:
                  promptTextStyle ??
                  AppTextStyles.caption.copyWith(
                    fontFamily: "Lato",
                    fontSize: tablet ? 9.sp : 14.sp,
                  ),
            ),
            SizedBox(width: spacing ?? (tablet ? 6.w : 4.w)),
            GestureDetector(
              onTap: onRegister,
              child: Text(
                registerText,
                style:
                    registerTextStyle ??
                    AppTextStyles.link.copyWith(
                      fontSize: tablet ? 12.sp : 14.sp,
                      fontFamily: "Lato",
                      color: registerTextColor ?? AppColors.primary,
                    ),
              ),
            ),
          ],
        ),
        if (forgotPasswordText.isNotEmpty) ...[
          SizedBox(height: verticalSpacing ?? (tablet ? 10.h : 10.h)),
          GestureDetector(
            onTap: onForgotPassword,
            child: Text(
              forgotPasswordText,
              style:
                  forgotPasswordTextStyle ??
                  AppTextStyles.link.copyWith(
                    fontSize: tablet ? 10.sp : 14.sp,
                    fontFamily: "Lato",
                    color: forgotPasswordTextColor ?? AppColors.primary,
                  ),
            ),
          ),
        ],
      ],
    );
  }
}
