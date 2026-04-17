import 'package:fitiq/core/theame/app_text_styles.dart';
import 'package:flutter/material.dart';

// class CustomSingleSelect<T> extends StatelessWidget {
//   final List<T> items;
//   final T selectedItem;
//   final Function(T) onChanged;

//   /// UI Customization
//   final String Function(T)? labelBuilder;
//   final double borderRadius;
//   final EdgeInsets padding;
//   final EdgeInsets margin;

//   final Color selectedColor;
//   final Color unselectedColor;
//   final Color selectedBorderColor;
//   final Color unselectedBorderColor;

//   final TextStyle? selectedTextStyle;
//   final TextStyle? unselectedTextStyle;

//   const CustomSingleSelect({
//     super.key,
//     required this.items,
//     required this.selectedItem,
//     required this.onChanged,
//     this.labelBuilder,
//     this.borderRadius = 20,
//     this.padding = const EdgeInsets.symmetric(vertical: 14),
//     this.margin = const EdgeInsets.only(right: 10),
//     this.selectedColor = const Color(0x332196F3),
//     this.unselectedColor = const Color(0xFFF0F0F0),
//     this.selectedBorderColor = Colors.blue,
//     this.unselectedBorderColor = const Color(0xFFE0E0E0),
//     this.selectedTextStyle,
//     this.unselectedTextStyle,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: items.map((item) {
//         final isSelected = item == selectedItem;

//         return Expanded(
//           child: GestureDetector(
//             onTap: () => onChanged(item),
//             child: AnimatedContainer(
//               duration: const Duration(milliseconds: 200),
//               margin: margin,
//               padding: padding,
//               decoration: BoxDecoration(
//                 color: isSelected ? selectedColor : unselectedColor,
//                 borderRadius: BorderRadius.circular(borderRadius),
//                 border: Border.all(
//                   color: isSelected
//                       ? selectedBorderColor
//                       : unselectedBorderColor,
//                   width: 1.5,
//                 ),
//               ),
//               child: Center(
//                 child: Text(
//                   labelBuilder?.call(item) ?? item.toString(),
//                   style: isSelected
//                       ? (selectedTextStyle ??
//                             const TextStyle(fontWeight: FontWeight.w600))
//                       : (unselectedTextStyle ??
//                             const TextStyle(fontWeight: FontWeight.w500)),
//                 ),
//               ),
//             ),
//           ),
//         );
//       }).toList(),
//     );
//   }
// }
class CustomSingleSelect<T> extends StatelessWidget {
  final String? label; // ✅ NEW
  final List<T> items;
  final T selectedItem;
  final Function(T) onChanged;

  /// UI Customization
  final String Function(T)? labelBuilder;

  final double borderRadius;
  final EdgeInsets padding;
  final EdgeInsets margin;

  final Color selectedColor;
  final Color unselectedColor;
  final Color selectedBorderColor;
  final Color unselectedBorderColor;

  final TextStyle? selectedTextStyle;
  final TextStyle? unselectedTextStyle;
  final TextStyle? labelStyle; // ✅ NEW

  const CustomSingleSelect({
    super.key,
    this.label,
    required this.items,
    required this.selectedItem,
    required this.onChanged,
    this.labelBuilder,
    this.borderRadius = 20,
    this.padding = const EdgeInsets.symmetric(vertical: 14),
    this.margin = const EdgeInsets.only(right: 10),
    this.selectedColor = const Color(0x332196F3),
    this.unselectedColor = const Color(0xFFF0F0F0),
    this.selectedBorderColor = Colors.blue,
    this.unselectedBorderColor = const Color(0xFFE0E0E0),
    this.selectedTextStyle,
    this.unselectedTextStyle,
    this.labelStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// 🔥 LABEL (same like your TextField)
        if (label != null) ...[
          Text(
            label!,
            style:
                labelStyle ??
                AppTextStyles.label.copyWith(
                  fontFamily: "Lato",
                  fontWeight: FontWeight.w700,
                ),
          ),
          const SizedBox(height: 5),
        ],

        /// 🔘 OPTIONS
        Row(
          children: items.map((item) {
            final isSelected = item == selectedItem;

            return Expanded(
              child: GestureDetector(
                onTap: () => onChanged(item),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  margin: margin,
                  padding: padding,
                  decoration: BoxDecoration(
                    color: isSelected ? selectedColor : unselectedColor,
                    borderRadius: BorderRadius.circular(borderRadius),
                    border: Border.all(
                      color: isSelected
                          ? selectedBorderColor
                          : unselectedBorderColor,
                      width: 1.5,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      labelBuilder?.call(item) ?? item.toString(),
                      style: isSelected
                          ? (selectedTextStyle ??
                                const TextStyle(fontWeight: FontWeight.w600))
                          : (unselectedTextStyle ??
                                const TextStyle(fontWeight: FontWeight.w500)),
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
