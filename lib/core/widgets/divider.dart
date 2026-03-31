import 'package:fitiq/core/theame/app_colors.dart';
import 'package:fitiq/core/theame/app_text_styles.dart';
import 'package:flutter/material.dart';

class FitiqDividerWithLabel extends StatelessWidget {
  final String label;

  const FitiqDividerWithLabel({super.key, this.label = 'or'});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: Divider(color: AppColors.divider, thickness: 1)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(label, style: AppTextStyles.caption),
        ),
        const Expanded(child: Divider(color: AppColors.divider, thickness: 1)),
      ],
    );
  }
}
