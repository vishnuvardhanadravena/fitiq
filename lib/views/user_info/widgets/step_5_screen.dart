import 'package:fitiq/core/theame/app_colors.dart';
import 'package:fitiq/core/theame/app_text_styles.dart';
import 'package:fitiq/core/utils/customfileupload.dart';
import 'package:fitiq/core/widgets/custum_radio_selector.dart';
import 'package:fitiq/core/widgets/text_felid.dart';
import 'package:fitiq/views/profile/widgets/section_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Step5Screen extends ConsumerStatefulWidget {
  const Step5Screen({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _Step5ScreenState();
}

class _Step5ScreenState extends ConsumerState<Step5Screen> {
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
              title: "Almost There",
              titleStyle: AppTextStyles.headingMedium.copyWith(
                fontSize: sw * 0.06,
                fontWeight: FontWeight.w700,
                color: AppColors.primaryColor,
              ),
              subtitle: "Add a few more details to make your plan even better.",
            ),
            SizedBox(height: sh * 0.02),
            FitiqTextField(
              label: 'Medical Conditions (Optional)',
              hint: "e.g. Diabetes, Thyroid",
            ),
            SizedBox(height: sh * 0.01),
            FitiqTextField(
              label: 'Injuries or Limitations',
              hint: "e.g. Knee pain, Back pain",
            ),
            SizedBox(height: sh * 0.01),
            FitiqTextField(
              label: "Anything you'd like your trainer to know",
              hint: "Your goals, preferences, etc.",
              isExpandable: true,
              maxLength: 200,
              showCounter: true,
            ),
            CustomFileUpload(
              label: "Upload Medical Reports (Optional)",
              onFileSelected: (file) {
                print(file.path);
              },
            ),
          ],
        ),
      ),
    );
  }
}
