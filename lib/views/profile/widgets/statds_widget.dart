import 'package:fitiq/core/theame/app_text_styles.dart';
import 'package:fitiq/views/profile/models/profile_header_data.dart';
import 'package:flutter/material.dart';

class StatsCard extends StatelessWidget {
  final List<ProfileStat> stats;
  final Color color;
  final double elevation, borderRadius;
  final void Function(int, ProfileStat)? onStatTap;

  const StatsCard({super.key, 
    required this.stats,
    required this.color,
    required this.elevation,
    required this.borderRadius,
    this.onStatTap,
    required bool whiteText,
  });

  @override
  Widget build(BuildContext context) {
    final sh = MediaQuery.of(context).size.height;
    final sw = MediaQuery.of(context).size.width;

    return Material(
      color: color,
      elevation: elevation,
      borderRadius: BorderRadius.circular(borderRadius),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: sh * 0.02,
          horizontal: sw * 0.02,
        ),
        child: Row(
          children: List.generate(stats.length * 2 - 1, (i) {
            if (i.isOdd) {
              return Container(
                width: 1,
                height: sh * 0.045,
                color: Colors.grey.shade200,
              );
            }
            final index = i ~/ 2;
            final stat = stats[index];
            return Expanded(
              child: GestureDetector(
                onTap: () => onStatTap?.call(index, stat),
                behavior: HitTestBehavior.opaque,
                child: _StatCell(stat: stat, sw: sw, sh: sh),
              ),
            );
          }),
        ),
      ),
    );
  }
}

class _StatCell extends StatelessWidget {
  final ProfileStat stat;
  final double sw, sh;

  const _StatCell({required this.stat, required this.sw, required this.sh});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          stat.value,
          style: AppTextStyles.numbersstyle.copyWith(
            fontSize: sw * 0.04,
            fontWeight: FontWeight.w700,
            color: const Color(0xFF1A1A2E),
          ),
        ),
        SizedBox(height: sh * 0.004),
        Text(
          stat.label,
          textAlign: TextAlign.center,
          style: AppTextStyles.label.copyWith(
            fontSize: sw * 0.025,
            color: Colors.grey.shade500,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
