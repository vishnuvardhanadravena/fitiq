import 'package:fitiq/core/theame/app_text_styles.dart';
import 'package:flutter/material.dart';

class EditProfileButton extends StatelessWidget {
  final String label;
  final double horizontalPad, verticalPad, fontSize, iconSize;
  final VoidCallback? onTap;

  const EditProfileButton({super.key, 
    required this.label,
    required this.horizontalPad,
    required this.verticalPad,
    required this.fontSize,
    required this.iconSize,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPad,
          vertical: verticalPad,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.12),
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.edit_outlined,
              size: iconSize,
              color: Colors.blueAccent.shade700,
            ),
            SizedBox(width: iconSize * 0.375),
            Text(
              label,
              style: AppTextStyles.buttonTextStyle.copyWith(
                color: Colors.blueAccent.shade700,
                fontWeight: FontWeight.w600,
                fontSize: fontSize,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
