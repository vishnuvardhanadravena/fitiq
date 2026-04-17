import 'package:fitiq/routes/route_constants.dart';
import 'package:flutter/material.dart';

class AccountItemData {
  final IconData icon;
  final String label;
  final Color color;
  final String route; // ✅ GoRouter path

  const AccountItemData({
    required this.icon,
    required this.label,
    required this.color,
    required this.route,
  });
}

final List<AccountItemData> accountItems = [
  AccountItemData(
    icon: Icons.credit_card_outlined,
    label: 'Payment History',
    color: Color(0xFF5B9BD5),
    route: RouteList.paymenthistory,
  ),
  AccountItemData(
    icon: Icons.card_membership_outlined,
    label: 'Subscription Details',
    color: Color(0xFF5B9BD5),
    route: RouteList.subscription,
  ),
  AccountItemData(
    icon: Icons.notifications_outlined,
    label: 'Notification Settings',
    color: Color(0xFF5B9BD5),
    route: RouteList.notificationSettigs,
  ),
  AccountItemData(
    icon: Icons.lock_outline,
    label: 'Privacy Policy',
    color: Color(0xFF5B9BD5),
    route: RouteList.privacy,
  ),
  AccountItemData(
    icon: Icons.help_outline,
    label: 'Help & Support',
    color: Color(0xFF5B9BD5),
    route: RouteList.help,
  ),
];
