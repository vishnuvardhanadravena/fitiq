import 'package:fitiq/core/theame/app_colors.dart';
import 'package:fitiq/core/theame/app_text_styles.dart';
import 'package:fitiq/core/theame/app_toast.dart';
import 'package:fitiq/core/widgets/blue_container_wraper.dart';
import 'package:fitiq/core/widgets/custom_drop_down.dart';
import 'package:fitiq/core/widgets/custum_app_bar.dart';
import 'package:fitiq/core/widgets/custum_radio_selector.dart';
import 'package:fitiq/core/widgets/text_felid.dart';
import 'package:fitiq/views/Subscription/views/subscription.dart';
import 'package:fitiq/views/auth/helpers.dart';
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
  final _formKey = GlobalKey<FormState>();
  final _nameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _phoneCtrl = TextEditingController();
  final _ageCtrl = TextEditingController();
  final _heightCtrl = TextEditingController();
  final _weightCtrl = TextEditingController();
  final _targetWeightCtrl = TextEditingController();
  bool _submitted = false;
  bool _loading = false;
  String gender = "Male";
  String activityLevel = "Beginner";
  String gol = "Lose Weight";
  String diettype = "Vegetarian";
  Future<void> _handleSave() async {
    setState(() {
      _submitted = true;
    });
    final hasError =
        validateName(_nameCtrl.text) != null ||
        validateEmail(_emailCtrl.text) != null ||
        validatePhone(_phoneCtrl.text) != null;
    if (hasError) return;
    setState(() => _loading = true);
    await Future.delayed(const Duration(seconds: 2));
    if (!mounted) return;
    AppToast.success("Profile updated Sucesfull");
    setState(() => _loading = false);
  }

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
                      backButtonBgColor: Colors.transparent,
                      backButtonBorderColor: Colors.transparent,
                      backButtonIconColor: Colors.white,
                      backIconSize: 24,
                      backButtonSize: 40,
                      backButtonPadding: EdgeInsets.only(left: 8),
                      title: "Edit Profile",
                      titleStyle: AppTextStyles.headingMedium.copyWith(
                        fontSize: sw * 0.043,
                        fontWeight: FontWeight.w700,
                        color: AppColors.white,
                      ),

                      /// Actions
                      // actions: [
                      //   Padding(
                      //     padding: EdgeInsets.only(right: 12),
                      //     child: Text(
                      //       "Save",
                      //       style: TextStyle(color: Colors.white, fontSize: 14),
                      //     ),
                      //   ),
                      // ],
                    ),
                    SizedBox(height: sh * 0.02),
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
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: PlanIncludes(
                        title: "Personal Details",
                        child: Column(
                          children: <Widget>[
                            FitiqTextField(
                              label: 'Email',
                              controller: _emailCtrl,
                              hint: "Enter your Email",
                              forceErrorText: _submitted
                                  ? validateEmail(_emailCtrl.text)
                                  : null,
                              onChanged: (_) {
                                if (_submitted) {
                                  setState(() => _submitted = false);
                                }
                              },
                            ),
                            FitiqTextField(
                              label: 'Full Name',
                              controller: _nameCtrl,
                              hint: "Enter your full name",
                              forceErrorText: _submitted
                                  ? validateName(_nameCtrl.text)
                                  : null,
                              onChanged: (_) {
                                if (_submitted) {
                                  setState(() => _submitted = false);
                                }
                              },
                            ),
                            FitiqTextField(
                              label: 'Phone',
                              controller: _phoneCtrl,
                              hint: "Enter your Phonenumber",
                              forceErrorText: _submitted
                                  ? validatePhone(_phoneCtrl.text)
                                  : null,
                              onChanged: (_) {
                                if (_submitted) {
                                  setState(() => _submitted = false);
                                }
                              },
                            ),
                            FitiqTextField(
                              label: 'Age',
                              controller: _ageCtrl,
                              hint: "Enter your Age",
                              forceErrorText: _submitted
                                  ? validateNumber(_ageCtrl.text, 'age')
                                  : null,
                              onChanged: (_) {
                                if (_submitted) {
                                  setState(() => _submitted = false);
                                }
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
                            FitiqTextField(
                              label: 'Height',
                              hint: "Ex: 165",
                              controller: _heightCtrl,
                              keyboardType: TextInputType.number,
                              textInputAction: TextInputAction.next,
                              forceErrorText: _submitted
                                  ? validateNumber(_heightCtrl.text, 'height')
                                  : null,
                              onChanged: (_) {
                                if (_submitted) {
                                  setState(() => _submitted = false);
                                }
                              },
                            ),
                            FitiqTextField(
                              label: 'Weight',
                              hint: "Ex: 62",
                              controller: _weightCtrl,
                              keyboardType: TextInputType.number,
                              textInputAction: TextInputAction.next,
                              forceErrorText: _submitted
                                  ? validateNumber(_weightCtrl.text, 'weight')
                                  : null,
                              onChanged: (_) {
                                if (_submitted) {
                                  setState(() => _submitted = false);
                                }
                              },
                            ),
                            CustomSingleSelect<String>(
                              label: "Gender",
                              items: ["Male", "Female", "Others"],
                              selectedItem: gender,
                              onChanged: (val) {
                                setState(() {
                                  gender = val;
                                  _submitted = false;
                                });
                              },
                            ),
                            CustomDropdown<String>(
                              label: "Activity Level",
                              labelStyle: AppTextStyles.label,
                              value: activityLevel,
                              items: ["Beginner", "Intermediate", "Advanced"],
                              onChanged: (val) {
                                setState(() {
                                  activityLevel = val!;
                                  _submitted = false;
                                });
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
                                setState(() {
                                  gol = val;
                                  _submitted = false;
                                });
                              },
                            ),
                            FitiqTextField(
                              label: 'Target Weight',
                              hint: "Ex: 60",
                              controller: _targetWeightCtrl,
                              keyboardType: TextInputType.number,
                              textInputAction: TextInputAction.next,
                              forceErrorText: _submitted
                                  ? validateNumber(
                                      _targetWeightCtrl.text,
                                      'target weight',
                                    )
                                  : null,
                              onChanged: (_) {
                                if (_submitted) {
                                  setState(() => _submitted = false);
                                }
                              },
                            ),
                            CustomDropdown<String>(
                              label: "Diet Type",
                              labelStyle: AppTextStyles.label,
                              value: diettype,
                              items: ["Vegetarian", "Non-Vegetarian", "Other"],
                              onChanged: (val) {
                                setState(() {
                                  diettype = val!;
                                  _submitted = false;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Savechnages(
                  sw: sw,
                  sh: sh,
                  isLoading: _loading,
                  onTap: _handleSave,
                ),
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
  final bool isLoading;

  const Savechnages({
    super.key,
    this.onTap,
    required this.sw,
    required this.sh,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isLoading ? null : onTap, // ❗ disable while loading
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: sh * 0.018),
        decoration: BoxDecoration(
          color: isLoading
              ? Colors
                    .grey // 🔥 change color when loading
              : Colors.pink.shade400,
          borderRadius: BorderRadius.circular(sw * 0.04),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(alpha: 0.08),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Center(
          child: isLoading
              ? SizedBox(
                  height: sw * 0.05,
                  width: sw * 0.05,
                  child: const CircularProgressIndicator(
                    strokeWidth: 2,
                    color: Colors.white,
                  ),
                )
              : Text(
                  'Save Changes',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: sw * 0.038,
                  ),
                ),
        ),
      ),
    );
  }
}
