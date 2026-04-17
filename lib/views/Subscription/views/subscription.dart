import 'package:fitiq/core/theame/app_colors.dart';
import 'package:fitiq/core/theame/app_text_styles.dart';
import 'package:fitiq/core/widgets/blue_container_wraper.dart';
import 'package:fitiq/core/widgets/custum_app_bar.dart';
import 'package:fitiq/views/Notifications/widgtes/switch.dart';
import 'package:fitiq/views/profile/widgets/section_header.dart';
import 'package:fitiq/views/schedules/widgets/icon_circle_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubscriptionScreen extends ConsumerStatefulWidget {
  const SubscriptionScreen({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SubscriptionScreenState();
}

class _SubscriptionScreenState extends ConsumerState<SubscriptionScreen> {
  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    final sw = mq.size.width;
    final sh = mq.size.height;
    return Scaffold(
      appBar: CustomAppBar(title: "Subscription"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              BackgroundContainer(
                // height: MediaQuery.of(context).size.height * 0.2,
                width: double.infinity,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Active Plan  ",
                      style: AppTextStyles.text.copyWith(
                        fontSize: 14.sp,
                        color: AppColors.white,
                      ),
                    ),
                    // Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "90 Days Total Transformation",
                          style: AppTextStyles.headingMedium.copyWith(
                            fontSize: MediaQuery.of(context).size.width * 0.044,
                            color: AppColors.white,
                          ),
                        ),

                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: AppColors.accentOrange,
                          ),

                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text("Active"),
                          ),
                        ),
                      ],
                    ),
                    Divider(),
                    // Spacer(),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Renews on:',
                            style: AppTextStyles.body.copyWith(
                              color: AppColors.white.withValues(alpha: 0.7),
                            ),
                          ),
                          TextSpan(
                            text: ' Oct 12, 2025',
                            style: AppTextStyles.body.copyWith(
                              color: AppColors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Spacer(),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: '₹4,999  ',
                            style: AppTextStyles.numbersstyle.copyWith(
                              color: AppColors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: '/ 3 months',
                            style: AppTextStyles.body.copyWith(
                              color: AppColors.white.withValues(alpha: 0.7),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Spacer(),
                  ],
                ),
              ),
              SizedBox(height: 12.h),
              PlanIncludes(title: "Plan Includes", child: FeatureList()),
              SizedBox(height: 10.h),
              PlanIncludes(title: "Billing Details", child: BillingInfoCard()),
            ],
          ),
        ),
      ),
    );
  }
}

class PlanIncludes extends ConsumerStatefulWidget {
  final String? title;
  final String? subtitle;
  final Widget? header;
  final Widget child;
  final VoidCallback? onEdit;
  final EdgeInsetsGeometry? padding;
  final double elevation;
  final ShapeBorder? shape;
  final bool showShadow;

  const PlanIncludes({
    super.key,
    this.title,
    this.subtitle,
    this.header,
    required this.child,
    this.onEdit,
    this.padding,
    this.elevation = 5,
    this.shape,
    this.showShadow = true,
  });

  @override
  ConsumerState<PlanIncludes> createState() => _PlanIncludesState();
}

class _PlanIncludesState extends ConsumerState<PlanIncludes> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: widget.shape is RoundedRectangleBorder
            ? (widget.shape as RoundedRectangleBorder).borderRadius
            : BorderRadius.circular(16.r),
        boxShadow: widget.showShadow
            ? [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.08),
                  blurRadius:
                      widget.elevation * 2, // dynamic blur based on elevation
                  spreadRadius: 1.r,
                  offset: Offset(0, 4.h),
                ),
              ]
            : [],
      ),
      padding: widget.padding ?? EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (widget.header != null)
            widget.header!
          else if (widget.title != null)
            SectionHeader(
              title: widget.title!,
              subtitle: widget.subtitle,
              onEdit: widget.onEdit,
            ),
          if (widget.title != null || widget.header != null)
            SizedBox(height: 12.h),
          widget.child,
        ],
      ),
    );
  }
}

class FeatureList extends StatelessWidget {
  const FeatureList({super.key});
  @override
  Widget build(BuildContext context) {
    final features = [
      '1-on-1 Trainer Access',
      'Personalized Diet Plan',
      'Weekly Check-ins',
      'Unlimited Recorded Workouts',
      'Priority Support',
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: features.map((text) {
        return Padding(
          padding: const EdgeInsets.all(2.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconCircleButton(icon: Icons.check),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  text,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}

class BillingInfoCard extends StatefulWidget {
  const BillingInfoCard({super.key});
  @override
  State<BillingInfoCard> createState() => _BillingInfoCardState();
}

class _BillingInfoCardState extends State<BillingInfoCard> {
  bool isAutoRenew = true;
  Widget _row(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(color: Colors.grey, fontSize: 15)),
          Text(
            value,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _row('Payment Method:', 'Auto-Renew'),
        _row('Last Payment:', 'Jul 12, 2025'),
        _row('Next Billing Date:', 'Oct 12, 2025'),
        AppToggleTile(
          title: 'Auto-Renew:',
          value: isAutoRenew,
          onChanged: (v) => setState(() => isAutoRenew = v),
          showDivider: false,
          padding: EdgeInsetsGeometry.all(0),
        ),
      ],
    );
  }
}

class HeartClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(size.width / 2, size.height);
    path.quadraticBezierTo(
      0,
      size.height * 0.6,
      size.width * 0.25,
      size.height * 0.3,
    );
    path.quadraticBezierTo(
      size.width * 0.25,
      0,
      size.width / 2,
      size.height * 0.25,
    );
    path.quadraticBezierTo(
      size.width * 0.75,
      0,
      size.width * 0.75,
      size.height * 0.3,
    );
    path.quadraticBezierTo(
      size.width,
      size.height * 0.6,
      size.width / 2,
      size.height,
    );
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
