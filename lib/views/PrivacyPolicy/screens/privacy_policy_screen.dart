import 'package:fitiq/core/theame/app_colors.dart';
import 'package:fitiq/core/theame/app_text_styles.dart';
import 'package:fitiq/core/theame/expanded_info_card.dart';
import 'package:fitiq/core/widgets/circle_icon_btn.dart';
import 'package:fitiq/core/widgets/custum_app_bar.dart';
import 'package:fitiq/views/Subscription/views/subscription.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrivacyPolicyScreen extends ConsumerStatefulWidget {
  const PrivacyPolicyScreen({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends ConsumerState<PrivacyPolicyScreen> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
      final List<String> headers = [
        "Information We Collect",
        "How We Use Your Data",
        "Data Protection & Security",
        "Sharing of Information",
        "Sharing of Information",
        "User Rights",
      ];

    return Scaffold(
      appBar: CustomAppBar(
        title: "Privacy & Policy",
        actions: [
          CircleIconButton(
            icon: Icons.security_rounded,
            iconColor: AppColors.accentCyan,
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              children: [
                PlanIncludes(
                  title: "Your Privacy Matters",
                  child: Text(
                    style: AppTextStyles.text.copyWith(fontSize: 12.sp),
                    "At Fit IQ, we are committed to protecting your personal information and ensuring complete transparency in how your data is used.",
                  ),
                ),

                SizedBox(height: 16.h),
                ...List.generate(
                  headers.length,
                  (head) => Padding(
                    padding: EdgeInsets.only(bottom: 2.h, top: 2.h),
                    child: ExpandableInfoCard(
                      contentPadding: EdgeInsets.all(18.w),
                      title: Text(
                        headers[head],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      items: [
                        Text('Personal details (name, email, phone)'),
                        Text('Health & fitness data'),
                        Text('Payment information'),
                        Text('Device & usage data'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
