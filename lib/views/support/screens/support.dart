import 'package:fitiq/core/theame/app_colors.dart';
import 'package:fitiq/core/theame/app_text_styles.dart';
import 'package:fitiq/core/theame/expanded_info_card.dart';
import 'package:fitiq/core/widgets/circle_icon_btn.dart';
import 'package:fitiq/core/widgets/custum_app_bar.dart';
import 'package:fitiq/views/Subscription/views/subscription.dart';
import 'package:fitiq/views/profile/widgets/section_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SupportScreen extends ConsumerStatefulWidget {
  const SupportScreen({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SupportScreenState();
}

class _SupportScreenState extends ConsumerState<SupportScreen> {
  @override
  Widget build(BuildContext context) {
    final List<String> headers = [
      "Q: How do I reschedule a live session?",
      "Q: How do I update my diet plan?",
      "Q: How do I cancel my subscription?",
    ];
    return Scaffold(
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomAppBar(
                height: MediaQuery.of(context).size.height * 0.12,

                gradient: LinearGradient(
                  colors: [Color(0xFF2E3192), Color(0xFF1BFFFF)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),

                titleWidget: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Help & Support",
                      style: AppTextStyles.headingSmall.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "We’re here to help you every step of your wellness journey.",
                      style: AppTextStyles.caption.copyWith(
                        color: Colors.white.withValues(alpha: 0.8),
                      ),
                    ),
                  ],
                ),

                actions: [
                  CircleIconButton(
                    icon: Icons.security_rounded,
                    iconColor: AppColors.accentCyan,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SectionHeader(title: "How can we help you?"),
                    SizedBox(height: 10.h),
                    Wrap(
                      spacing: 4.w,
                      runSpacing: 4.h,
                      children: List.generate(4, (index) {
                        return SizedBox(
                          width:
                              (MediaQuery.of(context).size.width - 45.w) /
                              1.94, // 2 columns
                          child: IntrinsicHeight(
                            // Makes the container adapt height to content
                            child: PlanIncludes(
                              showShadow: false,
                              padding: EdgeInsets.all(10.w),
                              header: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.credit_card, size: 18.sp),
                                  SizedBox(width: 6.w),
                                  Expanded(
                                    child: Text(
                                      "Plan Iadfsedbzsncludes $index",
                                      softWrap: true,
                                      style: AppTextStyles.headingSmall
                                          .copyWith(fontSize: 12.sp),
                                    ),
                                  ),
                                ],
                              ),
                              child: Text(
                                "Issues with subscriptions or invoices. This text will wrap automatically if it is too long.",
                                style: AppTextStyles.text.copyWith(
                                  fontSize: 10.sp,
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                    SizedBox(height: 10.h),
                    SectionHeader(title: "Frequently Asked Questions"),
                    SizedBox(height: 10.h),
                    ...List.generate(
                      headers.length,
                      (head) => Padding(
                        padding: EdgeInsets.only(bottom: 2.h, top: 2.h),
                        child: ExpandableInfoCard(
                          showBullet: false,
                          showDivider: true,
                          contentPadding: EdgeInsets.all(18.w),
                          title: Text(
                            headers[head],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          items: [
                            Text(
                              'You can reschedule from the Schedule screen up to 2 hours before session start.',
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    PlanIncludes(
                      title: "Still need help?",
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "support@fitiq.in",
                            style: AppTextStyles.caption,
                            textAlign: TextAlign.left,
                          ),
                          Text(
                            "Issues with subscriptions or invoices",
                            style: AppTextStyles.caption,
                          ),
                          Text(
                            "Mon–Sat | 9:00 AM – 7:00 PM",
                            style: AppTextStyles.caption,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
