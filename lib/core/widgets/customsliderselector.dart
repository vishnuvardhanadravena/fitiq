import 'package:flutter/material.dart';

enum SliderType { value, labeled }

class CustomSliderSelector extends StatefulWidget {
  final String label;
  final SliderType type;

  /// VALUE MODE
  final double min;
  final double max;
  final double value;
  final String? unit;
  final List<String>? unitOptions;
  final String? selectedUnit;
  final Function(String)? onUnitChange;

  /// LABELED MODE
  final List<String>? labels;

  /// COMMON
  final Function(double) onChanged;

  final Color activeColor;
  final Color inactiveColor;
  final Color thumbColor;

  const CustomSliderSelector({
    super.key,
    required this.label,
    required this.type,
    required this.value,
    required this.onChanged,

    this.min = 0,
    this.max = 100,
    this.unit,
    this.unitOptions,
    this.selectedUnit,
    this.onUnitChange,
    this.labels,

    this.activeColor = Colors.blue,
    this.inactiveColor = const Color(0xFFE0E0E0),
    this.thumbColor = Colors.pink,
  });

  @override
  State<CustomSliderSelector> createState() => _CustomSliderSelectorState();
}

class _CustomSliderSelectorState extends State<CustomSliderSelector> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
        ),

        // SizedBox(height: MediaQuery.of(context).size.height * 0.001),

        /// VALUE MODE UI
        if (widget.type == SliderType.value)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${widget.value.toInt()} ${widget.selectedUnit ?? widget.unit ?? ''}",
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo,
                ),
              ),

              if (widget.unitOptions != null)
                Row(
                  children: widget.unitOptions!.map((e) {
                    final isSelected = e == widget.selectedUnit;

                    return GestureDetector(
                      onTap: () => widget.onUnitChange?.call(e),
                      child: Container(
                        margin: const EdgeInsets.only(left: 8),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? widget.activeColor
                              : Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          e,
                          style: TextStyle(
                            color: isSelected ? Colors.white : Colors.black87,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
            ],
          ),

        /// LABELED MODE TEXTS
        if (widget.type == SliderType.labeled && widget.labels != null)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: widget.labels!
                  .map(
                    (e) => Text(e, style: const TextStyle(color: Colors.grey)),
                  )
                  .toList(),
            ),
          ),

        SizedBox(
          height: 20,
          child: SliderTheme(
            data: SliderTheme.of(context).copyWith(
              trackHeight: 6,
              thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 10),
            ),
            child: Slider(
              value: widget.value,
              min: widget.min,
              max: widget.max,
              onChanged: widget.onChanged,
            ),
          ),
        ),

        if (widget.type == SliderType.value)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${widget.min.toInt()} ${widget.unit ?? ''}",
                style: const TextStyle(color: Colors.grey),
              ),
              Text(
                "${widget.max.toInt()} ${widget.unit ?? ''}",
                style: const TextStyle(color: Colors.grey),
              ),
            ],
          ),
      ],
    );
  }
}
