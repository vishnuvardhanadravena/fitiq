import 'package:fitiq/core/theame/app_text_styles.dart';
import 'package:fitiq/core/widgets/blue_container_wraper.dart';
import 'package:fitiq/views/plans/provider/category_provider.dart';
import 'package:fitiq/views/plans/screens/finaness_plan_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProgramsScreen extends ConsumerWidget {
  const ProgramsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(categoryProvider); // ✅ IMPORTANT

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// HEADER
            BackgroundContainer(
              height: MediaQuery.of(context).size.height * 0.26,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(),
                    Text(
                      "Transform With Structured Programs",
                      style: AppTextStyles.headingLarge.copyWith(
                        color: Colors.white,
                        fontSize: 24.sp,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 12.h),
                    Text(
                      "Choose from expert-designed fitness, yoga, and nutrition plans tailored to your goals.",
                      style: AppTextStyles.subheading.copyWith(
                        color: Colors.white70,
                        fontSize: 12.sp,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 10.h),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Browse by Category",
                    style: AppTextStyles.headingMedium.copyWith(
                      fontWeight: FontWeight.w900,
                    ),
                  ),

                  SizedBox(height: 10.h),

                  /// ✅ CATEGORY LIST
                  SizedBox(
                    height: 50,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        final isSelected = selectedIndex == index;

                        return GestureDetector(
                          onTap: () {
                            ref.read(categoryProvider.notifier).setIndex(index);
                          },
                          child: Container(
                            margin: const EdgeInsets.only(right: 10),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 10,
                            ),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? Colors.blue
                                  : Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              categories[index],
                              style: TextStyle(
                                color: isSelected ? Colors.white : Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  SizedBox(height: 10.h),

                  /// ✅ PLANS LIST
                  const FitnessPlansScreen(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
