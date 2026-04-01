import 'package:fitiq/core/theame/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EnrollmentSuccessScreen extends StatelessWidget {
  const EnrollmentSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    // Dynamic scale factors
    final double vh = screenHeight / 100; // 1% of screen height
    final double vw = screenWidth / 100; // 1% of screen width

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF2196F3), Color(0xFF1565C0), Color(0xFF1A237E)],
            stops: [0.0, 0.5, 1.0],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: vw * 6),
              child: Column(
                children: [
                  SizedBox(height: vh * 5.5),

                  // Success check circle
                  Container(
                    width: vw * 20,
                    height: vw * 20,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.15),
                          blurRadius: vw * 5,
                          offset: Offset(0, vh * 0.8),
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.check,
                      color: const Color(0xFFE91E63),
                      size: vw * 10,
                    ),
                  ),

                  SizedBox(height: vh * 2.8),

                  // Enrollment Successful title
                  Text(
                    'Enrollment Successful!',
                    style: AppTextStyles.heading.copyWith(
                      color: Colors.white,
                      fontSize: vw * 6.5,
                      fontWeight: FontWeight.bold,
                      // letterSpacing: 0.3,
                    ),
                    //  TextStyle(
                    //   color: Colors.white,
                    //   fontSize: vw * 6.5,
                    //   fontWeight: FontWeight.bold,
                    //   letterSpacing: 0.3,
                    // ),
                  ),

                  SizedBox(height: vh * 1.2),

                  // Subtitle
                  Text(
                    "You're officially enrolled in the\n90 Days Total Transformation Program.",
                    textAlign: TextAlign.center,
                    style: AppTextStyles.subheading.copyWith(
                      color: Colors.white70,
                      fontSize: vw * 3.6,
                      height: 1.5,
                    ),
                    //  TextStyle(
                    //   color: Colors.white70,
                    //   fontSize: vw * 3.6,
                    //   height: 1.5,
                    // ),
                  ),

                  SizedBox(height: vh * 4),

                  // White card
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(vw * 4),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.12),
                          blurRadius: vw * 6,
                          offset: Offset(0, vh * 0.8),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(vw * 6),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Card title
                          Text(
                            '90 Days Total Transformation',
                            style: AppTextStyles.heading.copyWith(
                              color: const Color(0xFF1565C0),
                              fontSize: vw * 4,
                              fontWeight: FontWeight.bold,
                              // letterSpacing: 0.3,
                            ),
                            //  TextStyle(
                            //   color: const Color(0xFF1565C0),
                            //   fontSize: vw * 4,
                            //   fontWeight: FontWeight.bold,
                            // ),
                          ),

                          SizedBox(height: vh * 2.2),

                          // Divider line
                          Container(height: 1, color: const Color(0xFFEEEEEE)),

                          SizedBox(height: vh * 1.8),

                          // Transaction details rows
                          _DetailRow(
                            label: 'Transaction ID:',
                            value: '#FITIQ34892',
                            valueBold: true,
                            fontSize: vw * 3.5,
                          ),
                          SizedBox(height: vh * 1.6),
                          _DetailRow(
                            label: 'Payment Mode:',
                            value: 'UPI',
                            valueBold: true,
                            fontSize: vw * 3.5,
                          ),
                          SizedBox(height: vh * 1.6),
                          _DetailRow(
                            label: 'Amount Paid:',
                            value: '₹4,499',
                            valueBold: true,
                            fontSize: vw * 3.5,
                          ),
                          SizedBox(height: vh * 1.6),
                          _DetailRow(
                            label: 'Start Date:',
                            value: 'Today',
                            valueBold: true,
                            fontSize: vw * 3.5,
                          ),

                          SizedBox(height: vh * 2.h),

                          // Help text
                          Center(
                            child: Text(
                              'Need help? Contact support@fitiq.in',
                              style: AppTextStyles.caption,
                              // TextStyle(
                              //   color: const Color(0xFF9E9E9E),
                              //   fontSize: vw * 3.1,
                              // ),
                            ),
                          ),

                          SizedBox(height: vh * 2.2.h),

                          // Go To My Program button
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.7,
                            height: vh * 6.1,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFFE91E63),
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(vw * 8),
                                ),
                                elevation: 4,
                                shadowColor: const Color(
                                  0xFFE91E63,
                                ).withOpacity(0.4),
                              ),
                              child: Text(
                                'Go To My Program',
                                style: AppTextStyles.button.copyWith(
                                  fontSize: vw * 3.6,
                                ),
                                //  TextStyle(
                                //   fontSize: vw * 4,
                                //   fontWeight: FontWeight.w600,
                                //   letterSpacing: 0.3,
                                // ),
                              ),
                            ),
                          ),

                          SizedBox(height: vh * 1.0.h),

                          // View Invoice link
                          Center(
                            child: GestureDetector(
                              onTap: () {},
                              child: Text(
                                'View Invoice',
                                style: TextStyle(
                                  color: const Color(0xFF2196F3),
                                  fontSize: vw * 3.6,
                                  fontWeight: FontWeight.w500,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                            ),
                          ),

                          SizedBox(height: vh * 1.0),

                          // Bottom divider
                          Container(height: 1, color: const Color(0xFFEEEEEE)),

                          SizedBox(height: vh * 1.0),

                          // Tagline
                          Center(
                            child: Text(
                              'Your transformation starts today. Stay consistent.',
                              textAlign: TextAlign.center,
                              style: AppTextStyles.caption.copyWith(
                                color: const Color(0xFF9E9E9E),
                                fontSize: vw * 3.1,
                              ),
                              //  TextStyle(
                              //   color: const Color(0xFFBDBDBD),
                              //   fontSize: vw * 3,
                              //   fontStyle: FontStyle.italic,
                              // ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: vh * 5),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _DetailRow extends StatelessWidget {
  final String label;
  final String value;
  final bool valueBold;
  final double fontSize;

  const _DetailRow({
    required this.label,
    required this.value,
    required this.fontSize,
    this.valueBold = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: AppTextStyles.subheading.copyWith(
            color: const Color(0xFF757575),
            fontSize: fontSize,
          ),
          //  TextStyle(color: const Color(0xFF757575), fontSize: fontSize),
        ),
        Text(
          value,
          style: TextStyle(
            color: const Color(0xFF212121),
            fontSize: fontSize,
            fontWeight: valueBold ? FontWeight.w600 : FontWeight.normal,
          ),
        ),
      ],
    );
  }
}
