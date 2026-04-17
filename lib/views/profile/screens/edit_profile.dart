import 'package:fitiq/core/theame/app_colors.dart';
import 'package:fitiq/core/theame/app_text_styles.dart';
import 'package:fitiq/core/widgets/blue_container_wraper.dart';
import 'package:fitiq/core/widgets/custom_drop_down.dart';
import 'package:fitiq/core/widgets/custum_app_bar.dart';
import 'package:fitiq/core/widgets/custum_radio_selector.dart';
import 'package:fitiq/core/widgets/text_felid.dart';
import 'package:fitiq/views/Subscription/views/subscription.dart';
import 'package:fitiq/views/profile/models/profile_header_data.dart';
import 'package:fitiq/views/profile/widgets/header_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EditProfileScreen extends ConsumerStatefulWidget {
  const EditProfileScreen({super.key});

  @override
  ConsumerState<EditProfileScreen> createState() => _EditProfileScreenState();
}

final headerData = ProfileHeaderData(
  name: 'Priya Sharma',
  subtitle: 'Active Member • 90 Days Program',
  editButtonLabel: 'Edit Profile',
  stats: const [
    ProfileStat(value: '24', label: 'Workouts\nCompleted'),
    ProfileStat(value: '85%', label: 'Diet\nAdherence'),
    ProfileStat(value: '32', label: 'Days\nActive'),
  ],
  gradientColors: [Color(0xFF5B9BD5), Color(0xFF1A3A8F)],
);

class _EditProfileScreenState extends ConsumerState<EditProfileScreen> {
  String gender = "Male";
  String activityLevel = "Beginner";
  String gol = "Lose Weight";
  String diettype = "Vegetarian";
  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    final sw = mq.size.width;
    final sh = mq.size.height;

    return Scaffold(
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          child: Column(
            children: [
              BackgroundContainer(
                height: sh * 0.3,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
                child: Column(
                  children: [
                    CustomAppBar(
                      backgroundColor: Colors.transparent,
                      padding: EdgeInsets.zero,
                      textAlign: TextAlign.center,

                      /// Back Button
                      backButtonBgColor: Colors.transparent,
                      backButtonBorderColor: Colors.transparent,
                      backButtonIconColor: Colors.white,
                      backIconSize: 24,
                      backButtonSize: 40,
                      backButtonPadding: EdgeInsets.only(left: 8),

                      /// Title
                      title: "Edit Profile",
                      titleStyle: AppTextStyles.headingMedium.copyWith(
                        fontSize: sw * 0.043,
                        fontWeight: FontWeight.w700,
                        color: AppColors.white,
                      ),

                      /// Actions
                      actions: [
                        Padding(
                          padding: EdgeInsets.only(right: 12),
                          child: Text(
                            "Save",
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: sh * 0.02),

                    /// 👤 Avatar
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: DefaultAvatar(
                            data: headerData,
                            radius: 48,
                            borderSide: const BorderSide(width: 1),
                          ),
                        ),

                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: IconButton.filled(
                            onPressed: () {},
                            icon: const Icon(Icons.camera_alt_rounded),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "Change Profile Photo",
                      style: AppTextStyles.caption.copyWith(
                        color: AppColors.divider,
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: PlanIncludes(
                  title: "Personal Details",
                  child: Column(
                    children: <Widget>[
                      FitiqTextField(
                        label: 'Full Name',
                        hint: "Enter your name ",
                      ),
                      FitiqTextField(label: 'Email', hint: "Enter your Email "),
                      FitiqTextField(
                        label: 'Phone',
                        hint: "Enter your Phonenumber ",
                      ),
                      FitiqTextField(label: 'Age', hint: "Enter your Age "),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: PlanIncludes(
                  title: "Fitness Details",
                  child: Column(
                    children: <Widget>[
                      FitiqTextField(label: 'Height', hint: "Ex:30 cm "),
                      FitiqTextField(label: 'Weight', hint: "EX:62 kg"),
                      CustomSingleSelect<String>(
                        label: "Gender",
                        items: ["Male", "Female", "Others"],
                        selectedItem: gender,
                        onChanged: (val) {
                          setState(() => gender = val);
                        },
                      ),
                      CustomDropdown<String>(
                        label: "Activity Level",
                        labelStyle: AppTextStyles.label,
                        value: activityLevel,
                        items: ["Beginner", "Intermediate", "Advanced"],
                        onChanged: (val) {
                          setState(() => activityLevel = val!);
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: PlanIncludes(
                  title: "Fitness Details",
                  child: Column(
                    children: <Widget>[
                      CustomSingleSelect<String>(
                        label: "Goal",
                        items: ["Lose Weight", "Gain Muscle", "Maintain"],
                        selectedItem: gol,
                        onChanged: (val) {
                          setState(() => gol = val);
                        },
                      ),

                      FitiqTextField(label: 'Weight', hint: "EX:62 kg"),

                      CustomDropdown<String>(
                        label: "Diet Type",
                        labelStyle: AppTextStyles.label,
                        value: diettype,
                        items: ["Vegetarian", "Non-Vegetarian", "other"],
                        onChanged: (val) {
                          setState(() => diettype = val!);
                        },
                      ),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Savechnages(sw: sw, sh: sh),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Savechnages extends StatelessWidget {
  final VoidCallback? onTap;
  final double sw, sh;

  const Savechnages({
    super.key,
    this.onTap,
    required this.sw,
    required this.sh,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: sh * 0.018),
        decoration: BoxDecoration(
          color: Colors.pink.shade400,
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
            // Icon(
            //   Icons.logout_rounded,
            //   size: sw * 0.05,
            //   color: Colors.pink.shade400,
            // ),
            SizedBox(width: sw * 0.02),
            Text(
              'Save Changes ',
              style: TextStyle(
                color: Colors.white,
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
