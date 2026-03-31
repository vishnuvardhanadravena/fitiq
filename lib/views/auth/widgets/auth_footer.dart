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
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Wrap(
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Text(
              promptText,
              style: promptTextStyle ??
                  AppTextStyles.caption.copyWith(fontFamily: "Lato"),
            ),
            SizedBox(width: 4.w),
            GestureDetector(
              onTap: onRegister,
              child: Text(
                registerText,
                style: registerTextStyle ??
                    AppTextStyles.link.copyWith(
                      fontSize: 14.sp,
                      fontFamily: "Lato",
                      color: registerTextColor ?? AppColors.primary,
                    ),
              ),
            ),
          ],
        ),
        if (forgotPasswordText.isNotEmpty) ...[
          SizedBox(height: 10.h),
          GestureDetector(
            onTap: onForgotPassword,
            child: Text(
              forgotPasswordText,
              style: forgotPasswordTextStyle ??
                  AppTextStyles.link.copyWith(
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
