import 'package:fitiq/core/theame/app_colors.dart';
import 'package:fitiq/core/theame/app_text_styles.dart';
import 'package:fitiq/core/widgets/custum_radio_selector.dart';
import 'package:fitiq/core/widgets/text_felid.dart';
import 'package:fitiq/views/profile/widgets/section_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Step3Screen extends ConsumerStatefulWidget {
  const Step3Screen({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _Step3ScreenState();
}

class _Step3ScreenState extends ConsumerState<Step3Screen> {
  String selectedGoal = "Lose Weight";

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
              title: "What’s Your Goal? ",
              titleStyle: AppTextStyles.headingMedium.copyWith(
                fontSize: sw * 0.06,
                fontWeight: FontWeight.w700,
                color: AppColors.primaryColor,
              ),
              subtitle:
                  "Choose your primary fitness goal — we’ll personalize everything for y",
            ),
            SizedBox(height: sh * 0.01),
            CustomSingleSelect<String>(
              label: "What's Your Goal?",
              layout: SelectLayout.cards,
              items: [
                "Lose Weight",
                "Gain Muscle",
                "Stay Fit",
                "Improve Flexibility",
              ],
              selectedItem: selectedGoal,
              onChanged: (val) {
                setState(() => selectedGoal = val);
              },

              labelBuilder: (e) => e,
              subtitleBuilder: (e) {
                switch (e) {
                  case "Lose Weight":
                    return "Burn fat & reduce weight";
                  case "Gain Muscle":
                    return "Build strength & muscle";
                  case "Stay Fit":
                    return "Maintain active lifestyle";
                  case "Improve Flexibility":
                    return "Yoga & mobility focus";
                  default:
                    return "";
                }
              },

              iconBuilder: (e) {
                switch (e) {
                  case "Lose Weight":
                    return Icons.local_fire_department;
                  case "Gain Muscle":
                    return Icons.fitness_center;
                  case "Stay Fit":
                    return Icons.favorite_border;
                  case "Improve Flexibility":
                    return Icons.self_improvement;
                  default:
                    return Icons.circle;
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
