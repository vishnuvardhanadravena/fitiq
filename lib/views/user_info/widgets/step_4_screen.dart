import 'package:fitiq/core/theame/app_colors.dart';
import 'package:fitiq/core/theame/app_text_styles.dart';
import 'package:fitiq/core/widgets/customsliderselector.dart';
import 'package:fitiq/core/widgets/custum_radio_selector.dart';
import 'package:fitiq/core/widgets/text_felid.dart';
import 'package:fitiq/views/profile/widgets/section_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Step4Screen extends ConsumerStatefulWidget {
  const Step4Screen({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _Step4ScreenState();
}

class _Step4ScreenState extends ConsumerState<Step4Screen> {
  double activity = 0;
  String selectedExperience = "Beginner";
  String selectedprefer = "Gym"; // default
  @override
  Widget build(BuildContext context) {
    final sm = MediaQuery.of(context).size;
    final sw = sm.width;
    final sh = sm.height;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SectionHeader(
              title: "Your Lifestyle",
              titleStyle: AppTextStyles.headingMedium.copyWith(
                fontSize: sw * 0.06,
                fontWeight: FontWeight.w700,
                color: AppColors.primaryColor,
              ),
              subtitle:
                  "Help us understand your routine so we can design the perfect plan.",
            ),
            SizedBox(height: sh * 0.01),
            CustomSingleSelect<String>(
              label: "Your Fitness Experience",
              layout: SelectLayout.segmented, 
              items: ["Beginner", "Intermediate"],
              selectedItem: selectedExperience,
              onChanged: (val) {
                setState(() => selectedExperience = val);
              },

              iconBuilder: (e) {
                switch (e) {
                  case "Beginner":
                    return Icons.spa;
                  case "Intermediate":
                    return Icons.flash_on;
                  default:
                    return Icons.circle;
                }
              },
            ),
            SizedBox(height: sh * 0.01),
            CustomSliderSelector(
              label: "Daily Activity Level",
              type: SliderType.labeled,
              value: activity,
              min: 0,
              max: 2,
              labels: ["Low", "Moderate", "Active"],
              onChanged: (val) {
                setState(() => activity = val);
              },
            ),
            SizedBox(height: sh * 0.02),
            CustomSingleSelect<String>(
              label: "Where do you prefer to work out?  ",
              items: ["Gym", "Home", "Yoga", "Outdoor"],
              selectedItem: selectedprefer,
              onChanged: (val) {
                setState(() => selectedprefer = val);
              },
            ),
          ],
        ),
      ),
    );
  }
}
