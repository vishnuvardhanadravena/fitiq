import 'package:fitiq/views/profile/models/accont_navigation_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AccountCard extends StatelessWidget {
  final List<AccountItemData> items;
  final double sw, sh;

  const AccountCard({super.key, required this.items, required this.sw, required this.sh});

  @override
  Widget build(BuildContext context) {
    return Container(
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
        children: List.generate(items.length, (i) {
          final item = items[i];
          return Column(
            children: [
              InkWell(
                borderRadius: BorderRadius.vertical(
                  top: i == 0 ? Radius.circular(sw * 0.04) : Radius.zero,
                  bottom: i == items.length - 1
                      ? Radius.circular(sw * 0.04)
                      : Radius.zero,
                ),
                onTap: () => context.push(item.route),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: sw * 0.04,
                    vertical: sh * 0.018,
                  ),
                  child: Row(
                    children: [
                      Icon(item.icon, size: sw * 0.05, color: item.color),
                      SizedBox(width: sw * 0.03),
                      Expanded(
                        child: Text(
                          item.label,
                          style: TextStyle(
                            color: const Color(0xFF1A1A2E),
                            fontSize: sw * 0.035,
                          ),
                        ),
                      ),
                      Icon(
                        Icons.chevron_right,
                        color: Colors.grey.shade400,
                        size: sw * 0.05,
                      ),
                    ],
                  ),
                ),
              ),
              if (i < items.length - 1)
                Divider(
                  height: 1,
                  indent: sw * 0.12,
                  color: Colors.grey.shade100,
                ),
            ],
          );
        }),
      ),
    );
  }
}
