import 'package:fitiq/core/theame/app_colors.dart';
import 'package:fitiq/core/theame/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EnrollmentSuccessScreen extends StatelessWidget {
  const EnrollmentSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          final w = constraints.maxWidth;
          final h = constraints.maxHeight;

          final isTab = w > 600;

          final padding = isTab ? 40.0 : 16.0;
          final iconSize = isTab ? 80.0 : 60.0;
          final titleSize = isTab ? 28.0 : 22.0;
          final subTitleSize = isTab ? 16.0 : 13.0;
          final cardWidth = isTab ? 500.0 : double.infinity;

          return Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF2196F3),
                  Color(0xFF1565C0),
                  Color(0xFF1A237E),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: padding),
                  child: Column(
                    children: [
                      SizedBox(height: h * 0.05),

                      /// ✅ ICON
                      Container(
                        width: iconSize,
                        height: iconSize,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 10,
                              color: Colors.black.withValues(alpha: 0.2),
                            ),
                          ],
                        ),
                        child: Icon(
                          Icons.check,
                          color: const Color(0xFFE91E63),
                          size: iconSize * 0.5,
                        ),
                      ),

                      SizedBox(height: h * 0.03),

                      /// ✅ TITLE
                      Text(
                        'Enrollment Successful!',
                        textAlign: TextAlign.center,
                        style: AppTextStyles.heading.copyWith(
                          color: Colors.white,
                          fontSize: titleSize,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      SizedBox(height: 10),

                      /// ✅ SUBTITLE
                      Text(
                        "You're officially enrolled in the\n90 Days Total Transformation Program.",
                        textAlign: TextAlign.center,
                        style: AppTextStyles.subheading.copyWith(
                          color: Colors.white70,
                          fontSize: subTitleSize,
                        ),
                      ),

                      SizedBox(height: h * 0.04),

                      /// 🔥 CARD (responsive width)
                      Center(
                        child: ConstrainedBox(
                          constraints: BoxConstraints(maxWidth: cardWidth),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 12,
                                  color: Colors.black.withValues(alpha: 0.15),
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(isTab ? 24 : 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  /// TITLE
                                  Text(
                                    '90 Days Total Transformation',
                                    style: AppTextStyles.heading.copyWith(
                                      color: const Color(0xFF1565C0),
                                      fontSize: isTab ? 18 : 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),

                                  const SizedBox(height: 16),
                                  const Divider(),

                                  const SizedBox(height: 12),

                                  /// DETAILS
                                  _DetailRow(
                                    label: 'Transaction ID:',
                                    value: '#FITIQ34892',
                                    isTab: isTab,
                                  ),
                                  _DetailRow(
                                    label: 'Payment Mode:',
                                    value: 'UPI',
                                    isTab: isTab,
                                  ),
                                  _DetailRow(
                                    label: 'Amount Paid:',
                                    value: '₹4,499',
                                    isTab: isTab,
                                  ),
                                  _DetailRow(
                                    label: 'Start Date:',
                                    value: 'Today',
                                    isTab: isTab,
                                  ),

                                  const SizedBox(height: 20),

                                  /// HELP TEXT
                                  Center(
                                    child: Text(
                                      'Need help? Contact support@fitiq.in',
                                      style: AppTextStyles.caption,
                                    ),
                                  ),

                                  const SizedBox(height: 20),

                                  /// BUTTON
                                  SizedBox(
                                    width: double.infinity,
                                    height: 48,
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color(
                                          0xFFE91E63,
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            30,
                                          ),
                                        ),
                                      ),
                                      child: Text(
                                        'Go To My Program',
                                        style: AppTextStyles.buttonTextStyle,
                                      ),
                                    ),
                                  ),

                                  const SizedBox(height: 12),

                                  /// LINK
                                  Center(
                                    child: Text(
                                      'View Invoice',
                                      style: AppTextStyles.link.copyWith(
                                        color: AppColors.accentCyan,
                                      ),
                                    ),
                                  ),

                                  const SizedBox(height: 12),
                                  const Divider(),

                                  const SizedBox(height: 10),

                                  /// FOOTER
                                  Center(
                                    child: Text(
                                      'Your transformation starts today. Stay consistent.',
                                      textAlign: TextAlign.center,
                                      style: AppTextStyles.caption,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: h * 0.05),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _DetailRow extends StatelessWidget {
  final String label;
  final String value;
  final bool isTab;

  const _DetailRow({
    required this.label,
    required this.value,
    required this.isTab,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: AppTextStyles.subheading.copyWith(
              color: Colors.grey,
              fontSize: isTab ? 14 : 12,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: isTab ? 14 : 12,
            ),
          ),
        ],
      ),
    );
  }
}
