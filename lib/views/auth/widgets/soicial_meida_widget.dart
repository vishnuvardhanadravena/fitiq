import 'package:fitiq/core/theame/app_colors.dart';
import 'package:fitiq/core/theame/app_radius.dart';
import 'package:flutter/material.dart';

class FitiqSocialAuthRow extends StatelessWidget {
  final VoidCallback? onInstagram;
  final VoidCallback? onFacebook;
  final VoidCallback? onLinkedIn;
  final VoidCallback? onGoogle;
  final VoidCallback? onApple;
  final bool showGoogle;
  final bool showApple;

  const FitiqSocialAuthRow({
    super.key,
    this.onInstagram,
    this.onFacebook,
    this.onLinkedIn,
    this.onGoogle,
    this.onApple,
    this.showGoogle = false,
    this.showApple = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FitiqSocialButton(
          icon: Icons.camera_alt_outlined,
          onPressed: onInstagram,
          iconColor: const Color(0xFFE1306C),
        ),
        const SizedBox(width: 12),
        FitiqSocialButton(
          icon: Icons.facebook,
          onPressed: onFacebook,
          iconColor: const Color(0xFF1877F2),
        ),
        const SizedBox(width: 12),
        FitiqSocialButton(
          icon: Icons.work_outline,
          onPressed: onLinkedIn,
          iconColor: const Color(0xFF0A66C2),
        ),
        if (showGoogle) ...[
          const SizedBox(width: 12),
          FitiqSocialButton(
            icon: Icons.g_translate,
            onPressed: onGoogle,
            iconColor: const Color(0xFFEA4335),
          ),
        ],
        if (showApple) ...[
          const SizedBox(width: 12),
          FitiqSocialButton(
            icon: Icons.apple,
            onPressed: onApple,
            iconColor: Colors.black,
          ),
        ],
      ],
    );
  }
}

class FitiqSocialButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;
  final String? label;
  final Color? iconColor;
  final double size;

  const FitiqSocialButton({
    super.key,
    required this.icon,
    this.onPressed,
    this.label,
    this.iconColor,
    this.size = 56,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(AppRadius.radiusSocial),
          border: Border.all(color: AppColors.socialBorder, width: 1.5),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.06),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: iconColor ?? AppColors.textPrimary, size: 22),
            if (label != null) ...[
              const SizedBox(height: 2),
              Text(
                label!,
                style: const TextStyle(
                  fontSize: 9,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
