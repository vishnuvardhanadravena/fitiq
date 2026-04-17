import 'package:fitiq/core/widgets/blue_container_wraper.dart';
import 'package:flutter/material.dart';

class AllNotificationCard extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  const AllNotificationCard({
    super.key,
    required this.value,
    required this.onChanged,
  });
  @override
  Widget build(BuildContext context) {
    return BackgroundContainer(
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'All Notifications',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Enable or disable all app notifications.',
                  style: TextStyle(color: Colors.white70, fontSize: 13),
                ),
              ],
            ),
          ),

          /// SWITCH
          Switch(value: value, activeColor: Colors.pink, onChanged: onChanged),
        ],
      ),
    );
  }
}
