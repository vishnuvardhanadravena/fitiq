import 'package:fitiq/core/theame/app_text_styles.dart';
import 'package:fitiq/routes/route_constants.dart';
import 'package:fitiq/views/profile/widgets/accont_detailes.dart';
import 'package:fitiq/views/profile/widgets/goles_card.dart';
import 'package:fitiq/views/profile/widgets/header_wrapper.dart';
import 'package:fitiq/views/profile/widgets/image_picker.dart';
import 'package:fitiq/views/profile/widgets/notification%20_button.dart';
import 'package:fitiq/views/profile/widgets/section_header.dart';
import 'package:flutter/material.dart';
import 'package:fitiq/views/profile/models/profile_header_data.dart';
import 'package:fitiq/views/profile/models/accont_navigation_model.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  XFile? _profileImage; // holds the picked image

  Future<void> _showEditProfileSheet(
    BuildContext context, {
    required void Function(XFile image) onImagePicked,
  }) async {
    await showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (_) => EditProfileSheet(onImagePicked: onImagePicked),
    );
  }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    final sw = mq.size.width;
    final sh = mq.size.height;

    final headerData = ProfileHeaderData(
      name: 'Priya Sharma',
      subtitle: 'Active Member • 90 Days Program',
      editButtonLabel: 'Edit Profile',
      stats: const [
        ProfileStat(value: '24', label: 'Workouts\nCompleted'),
        ProfileStat(value: '85%', label: 'Diet\nAdherence'),
        ProfileStat(value: '32', label: 'Days\nActive'),
      ],
      gradientColors: [const Color(0xFF5B9BD5), const Color(0xFF1A3A8F)],
    );

    return ProfileHeaderWrapper(
      data: headerData,
      showBackButton: false,
      statsCardBorderRadius: 20,
      statsCardElevation: 6,

      trailingAction: NotificationButton(size: sw * 0.095), 

      // Add this at the top of ProfileScreen state (convert to StatefulWidget)
      // XFile? _profileImage;

      // In your build, update onEditProfile:
      onEditProfile: () => context.push(RouteList.editProfile),
      //  _showEditProfileSheet(
      //   context,
      //   onImagePicked: (XFile image) {
      //     setState(() => _profileImage = image);
      //     debugPrint('Picked image path: ${image.path}');
      //     // ✅ use _profileImage anywhere — upload to server, show preview, etc.
      //   },
      // ),
      onAvatarTap: () => ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Avatar tapped – open image picker')),
      ),
      onStatTap: (index, stat) => ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Stat: \${stat.label}'))),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: sh * 0.045), // space for overlapping stats card

          SectionHeader(title: 'Personal Details', onEdit: () {}, sw: sw),
          SizedBox(height: sh * 0.01),
          _InfoCard(
            sw: sw,
            sh: sh,
            items: const [
              _InfoItem(
                icon: Icons.email_outlined,
                label: 'Email',
                value: 'priya@email.com',
              ),
              _InfoItem(
                icon: Icons.phone_outlined,
                label: 'Phone',
                value: '+91 9876543210',
              ),
              _InfoItem(
                icon: Icons.person_outline,
                label: 'Age',
                value: '28 Years',
              ),
              _InfoItem(
                icon: Icons.height_outlined,
                label: 'Height',
                value: '165 cm',
              ),
              _InfoItem(
                icon: Icons.monitor_weight_outlined,
                label: 'Weight',
                value: '62 kg',
              ),
            ],
          ),

          SizedBox(height: sh * 0.025),
          SectionHeader(title: 'My Goals', onEdit: () {}, sw: sw),
          SizedBox(height: sh * 0.01),
          GoalsCard(sw: sw, sh: sh),

          SizedBox(height: sh * 0.025),
          SectionHeader(title: 'Account', sw: sw),
          SizedBox(height: sh * 0.01),
          AccountCard(items: accountItems, sw: sw, sh: sh),

          SizedBox(height: sh * 0.02),
          _LogoutButton(onTap: () {}, sw: sw, sh: sh),
          SizedBox(height: sh * 0.04),
        ],
      ),
    );
  }
}

class _InfoItem {
  final IconData icon;
  final String label, value;
  const _InfoItem({
    required this.icon,
    required this.label,
    required this.value,
  });
}

class _InfoCard extends StatelessWidget {
  final List<_InfoItem> items;
  final double sw, sh;

  const _InfoCard({required this.items, required this.sw, required this.sh});

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
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: sw * 0.04,
                  vertical: sh * 0.017,
                ),
                child: Row(
                  children: [
                    Icon(
                      item.icon,
                      size: sw * 0.05,
                      color: const Color(0xFF5B9BD5),
                    ),
                    SizedBox(width: sw * 0.03),
                    Text(
                      item.label,
                      style: AppTextStyles.label.copyWith(
                        color: Colors.grey.shade500,
                        fontWeight: FontWeight.bold,
                        fontSize: sw * 0.033,
                      ),
                      // TextStyle(
                      //   color: Colors.grey.shade500,
                      //   fontSize: sw * 0.033,
                      // ),
                    ),
                    const Spacer(),
                    Text(
                      item.value,
                      style: AppTextStyles.label.copyWith(
                        color: const Color(0xFF1A1A2E),
                        fontSize: sw * 0.035,
                        fontWeight: FontWeight.bold,
                        // fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
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

class _LogoutButton extends StatelessWidget {
  final VoidCallback? onTap;
  final double sw, sh;

  const _LogoutButton({this.onTap, required this.sw, required this.sh});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: sh * 0.018),
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.logout_rounded,
              size: sw * 0.05,
              color: Colors.pink.shade400,
            ),
            SizedBox(width: sw * 0.02),
            Text(
              'Logout',
              style: TextStyle(
                color: Colors.pink.shade400,
                fontWeight: FontWeight.w600,
                fontSize: sw * 0.038,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
