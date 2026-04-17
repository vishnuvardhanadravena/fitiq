import 'package:fitiq/core/theame/app_colors.dart';
import 'package:fitiq/core/theame/app_text_styles.dart';
import 'package:flutter/material.dart';

// class FitiqDividerWithLabel extends StatelessWidget {
//   final String label;

//   const FitiqDividerWithLabel({super.key, this.label = 'or'});

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         const Expanded(child: Divider(color: AppColors.divider, thickness: 1)),
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 12),
//           child: Text(label, style: AppTextStyles.caption),
//         ),
//         const Expanded(child: Divider(color: AppColors.divider, thickness: 1)),
//       ],
//     );
//   }
// }

class FitiqDividerWithLabel extends StatelessWidget {
  final String label;

  // ✅ New optional parameters for responsiveness
  final double? horizontalPadding;
  final double? thickness;
  final TextStyle? textStyle;

  const FitiqDividerWithLabel({
    super.key,
    this.label = 'or',
    this.horizontalPadding,
    this.thickness,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    // Optional: detect tablet automatically
    final bool tablet = MediaQuery.of(context).size.width >= 600;

    return Row(
      children: [
        Expanded(
          child: Divider(
            color: AppColors.divider,
            thickness: thickness ?? (tablet ? 2 : 1),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding ?? (tablet ? 20 : 12),
          ),
          child: Text(
            label,
            style:
                textStyle ??
                AppTextStyles.caption.copyWith(fontSize: tablet ? 16 : 14),
          ),
        ),
        Expanded(
          child: Divider(
            color: AppColors.divider,
            thickness: thickness ?? (tablet ? 2 : 1),
          ),
        ),
      ],
    );
  }
}
