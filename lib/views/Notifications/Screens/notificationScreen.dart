import 'package:fitiq/core/theame/app_colors.dart';
import 'package:fitiq/core/widgets/circle_icon_btn.dart';
import 'package:fitiq/core/widgets/custum_app_bar.dart';
import 'package:fitiq/views/Notifications/widgtes/all_notification_swith.dart';
import 'package:fitiq/views/Notifications/widgtes/setting_section.dart';
import 'package:fitiq/views/Notifications/widgtes/switch.dart';
import 'package:flutter/material.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  bool all = true;
  bool workout = true;
  bool diet = true;
  bool live = true;
  bool progress = true;
  bool trainer = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: "Notifications",

        actions: [
          CircleIconButton(
            icon: Icons.notifications,

            iconColor: AppColors.accentCyan,
          ),
        ],
      ),
      //  AppBar(title: const Text('Notifications')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            /// TOP CARD
            AllNotificationCard(
              value: all,
              onChanged: (v) => setState(() => all = v),
            ),

            /// SECTION
            SettingsSectionCard(
              title: 'Activity Notifications',
              children: [
                AppToggleTile(
                  title: 'Workout Reminders',
                  subtitle: 'Get alerts before your sessions',
                  value: workout,
                  onChanged: (v) => setState(() => workout = v),
                ),
                AppToggleTile(
                  title: 'Diet Plan Reminders',
                  subtitle: 'Meal and water reminders',
                  value: diet,
                  onChanged: (v) => setState(() => diet = v),
                ),
                AppToggleTile(
                  title: 'Live Session Alerts',
                  subtitle: 'When live classes start',
                  value: live,
                  onChanged: (v) => setState(() => live = v),
                ),
                AppToggleTile(
                  title: 'Progress Updates',
                  subtitle: 'Weekly reports',
                  value: progress,
                  onChanged: (v) => setState(() => progress = v),
                ),
                AppToggleTile(
                  title: 'Trainer Messages',
                  subtitle: 'Messages from coach',
                  value: trainer,
                  onChanged: (v) => setState(() => trainer = v),
                  showDivider: false,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
