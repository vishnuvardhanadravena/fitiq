import 'package:fitiq/core/theame/app_colors.dart';
import 'package:fitiq/core/theame/app_text_styles.dart';
import 'package:flutter/material.dart';

class FitiqPageHeader extends StatelessWidget {
  final String title;
  final String? subtitle;
  final Widget? logo;
  final String? backgroundImagePath;
  final double height;
  final Color? backgroundColor;

  const FitiqPageHeader({
    super.key,
    required this.title,
    this.subtitle,
    this.logo,
    this.backgroundImagePath,
    this.height = 220,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Stack(
        children: [
          if (backgroundImagePath != null)
            Positioned.fill(
              child: Image.asset(
                backgroundImagePath!,
                fit: BoxFit.cover,
                // color: Colors.black.withValues(alpha:0.2),
                colorBlendMode: BlendMode.darken,
              ),
            )
          else
            Positioned.fill(
              child: Container(color: backgroundColor ?? AppColors.background),
            ),
          // Content
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8.0, left: 16, right: 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (logo != null) ...[logo!, const SizedBox(height: 12)],
                  Text(
                    title,
                    style: AppTextStyles.headingLarge,
                    textAlign: TextAlign.center,
                  ),
                  if (subtitle != null) ...[
                    const SizedBox(height: 6),
                    Text(
                      subtitle!,
                      style: AppTextStyles.subheading,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
