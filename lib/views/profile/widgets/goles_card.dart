import 'package:flutter/material.dart';

class GoalsCard extends StatelessWidget {
  final double sw, sh;
  const GoalsCard({super.key, required this.sw, required this.sh});

  @override
  Widget build(BuildContext context) {
    final tags = ['Vegetarian', 'Weight Loss', 'Yoga'];
    return Container(
      padding: EdgeInsets.all(sw * 0.04),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(sw * 0.04),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.08),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          goalRow('Goal:', 'Lose 8 kg', sw),
          SizedBox(height: sh * 0.01),
          goalRow('Target Date:', '3 Months', sw),
          SizedBox(height: sh * 0.01),
          goalRow('Activity Level:', 'Moderate', sw),
          SizedBox(height: sh * 0.01),
          goalRow('Diet Type:', 'Vegetarian', sw),
          SizedBox(height: sh * 0.015),
          Wrap(
            spacing: sw * 0.02,
            children: tags
                .map(
                  (t) => Chip(
                    label: Text(
                      t,
                      style: TextStyle(
                        fontSize: sw * 0.03,
                        color: const Color(0xFF5B9BD5),
                      ),
                    ),
                    backgroundColor: const Color(
                      0xFF5B9BD5,
                    ).withValues(alpha: 0.1),
                    side: BorderSide.none,
                    padding: EdgeInsets.zero,
                    visualDensity: VisualDensity.compact,
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}

Widget goalRow(String label, String value, double sw) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        label,
        style: TextStyle(color: Colors.grey.shade500, fontSize: sw * 0.033),
      ),
      Text(
        value,
        style: TextStyle(
          color: const Color(0xFF1A1A2E),
          fontSize: sw * 0.035,
          fontWeight: FontWeight.w500,
        ),
      ),
    ],
  );
}
