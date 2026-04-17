import 'package:fitiq/core/theame/app_colors.dart';
import 'package:fitiq/core/theame/app_text_styles.dart';
import 'package:fitiq/core/widgets/custum_radio_selector.dart';
import 'package:fitiq/core/widgets/text_felid.dart';
import 'package:fitiq/views/profile/widgets/section_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Step1Screen extends ConsumerStatefulWidget {
  const Step1Screen({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _Step1ScreenState();
}

class _Step1ScreenState extends ConsumerState<Step1Screen> {
  String gender = "Male";

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
                title: "Let’s Get Started 👋",
                titleStyle: AppTextStyles.headingMedium.copyWith(
                  fontSize: sw * 0.06,
                  fontWeight: FontWeight.w700,
                  color: AppColors.primaryColor,
                ),
                subtitle:
                    "Tell us a bit about you so we can personalize your fitness journey.",
              ),
              SizedBox(height: sh * 0.01),
            FitiqTextField(label: 'Full Name', hint: "Enter your name"),
            SizedBox(height: sh * 0.01),
            FitiqTextField(label: 'Age', hint: "Enter your Age "),
            SizedBox(height: sh * 0.01),
            CustomSingleSelect<String>(
              label: "Gender",
              items: ["Male", "Female", "Others"],
              selectedItem: gender,
              onChanged: (val) {
                setState(() => gender = val);
              },
            ),
          ],
        ),
      ),
    );
  }
}
