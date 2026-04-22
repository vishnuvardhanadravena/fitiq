import 'package:flutter/material.dart';

enum SelectLayout { chips, cards, segmented }

class CustomSingleSelect<T> extends StatelessWidget {
  final String? label;
  final List<T> items;
  final T selectedItem;
  final Function(T) onChanged;

  /// 🔥 NEW
  final SelectLayout layout;

  /// UI Customization
  final String Function(T)? labelBuilder;
  final String Function(T)? subtitleBuilder;
  final IconData Function(T)? iconBuilder;

  final double borderRadius;
  final EdgeInsets padding;
  final EdgeInsets margin;

  final Color selectedColor;
  final Color unselectedColor;
  final Color selectedBorderColor;
  final Color unselectedBorderColor;

  final TextStyle? selectedTextStyle;
  final TextStyle? unselectedTextStyle;
  final TextStyle? labelStyle;

  const CustomSingleSelect({
    super.key,
    this.label,
    required this.items,
    required this.selectedItem,
    required this.onChanged,
    this.layout = SelectLayout.chips, // ✅ default = old UI
    this.labelBuilder,
    this.subtitleBuilder,
    this.iconBuilder,
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
        if (label != null) ...[
          Text(
            label!,
            style: labelStyle ?? const TextStyle(fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 8),
        ],

      layout == SelectLayout.chips
    ? _buildChips()
    : layout == SelectLayout.cards
        ? _buildCards()
        : _buildSegmented(),
      ],
    );
  }

  Widget _buildChips() {
    return Row(
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
                child: Text(labelBuilder?.call(item) ?? item.toString()),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
Widget _buildSegmented() {
  return Row(
    children: items.map((item) {
      final isSelected = item == selectedItem;

      return Expanded(
        child: GestureDetector(
          onTap: () => onChanged(item),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            margin: margin,
            padding: const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 16,
            ),
            decoration: BoxDecoration(
              color: isSelected
                  ? selectedColor.withOpacity(0.3)
                  : Colors.grey.shade100,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: isSelected
                    ? selectedBorderColor
                    : Colors.transparent,
                width: 2,
              ),
              boxShadow: [
                if (!isSelected)
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                  ),
              ],
            ),
            child: Row(
              children: [
                /// ICON LEFT
                if (iconBuilder != null)
                  Icon(
                    iconBuilder!(item),
                    size: 20,
                    color: Colors.black87,
                  ),

                const SizedBox(width: 10),

                /// TEXT
                Expanded(
                  child: Text(
                    labelBuilder?.call(item) ?? item.toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),

                /// RIGHT CHECK
                Container(
                  width: 22,
                  height: 22,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: isSelected
                          ? selectedBorderColor
                          : Colors.grey,
                      width: 2,
                    ),
                    color: isSelected
                        ? selectedBorderColor
                        : Colors.transparent,
                  ),
                  child: isSelected
                      ? const Icon(
                          Icons.check,
                          size: 14,
                          color: Colors.white,
                        )
                      : null,
                ),
              ],
            ),
          ),
        ),
      );
    }).toList(),
  );
}
  Widget _buildCards() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: items.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 1.1,
      ),
      itemBuilder: (_, index) {
        final item = items[index];
        final isSelected = item == selectedItem;

        return GestureDetector(
          onTap: () => onChanged(item),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: isSelected
                  ? selectedColor.withOpacity(0.4)
                  : Colors.grey.shade100,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: isSelected ? selectedBorderColor : Colors.transparent,
                width: 2,
              ),
              boxShadow: [
                if (!isSelected)
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                  ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (iconBuilder != null)
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue.withOpacity(0.1),
                    ),
                    child: Icon(iconBuilder!(item), color: Colors.blue),
                  ),

                const SizedBox(height: 10),

                /// TITLE
                Text(
                  labelBuilder?.call(item) ?? item.toString(),
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),

                /// SUBTITLE
                if (subtitleBuilder != null) ...[
                  const SizedBox(height: 4),
                  Text(
                    subtitleBuilder!(item),
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ],
            ),
          ),
        );
      },
    );
  }
}
