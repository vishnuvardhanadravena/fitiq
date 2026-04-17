import 'package:fitiq/core/theame/app_colors.dart';
import 'package:fitiq/core/theame/app_text_styles.dart';
import 'package:fitiq/core/widgets/customsliderselector.dart';
import 'package:fitiq/views/profile/widgets/section_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Step2Screen extends ConsumerStatefulWidget {
  const Step2Screen({super.key});

  @override
  ConsumerState<Step2Screen> createState() => _Step2ScreenState();
}

class UnitRange {
  final double min;
  final double max;

  const UnitRange(this.min, this.max);
}

final heightRanges = {"cm": UnitRange(120, 220), "ft": UnitRange(4, 7)};

final weightRanges = {"kg": UnitRange(40, 120), "lbs": UnitRange(90, 260)};

class _Step2ScreenState extends ConsumerState<Step2Screen> {
  double height = 170;
  String heightUnit = "cm";

  double weight = 50;
  String weightUnit = "kg";

  double heightMin = 120;
  double heightMax = 220;

  double weightMin = 40;
  double weightMax = 120;

  double cmToFt(double cm) => cm / 30.48;
  double ftToCm(double ft) => ft * 30.48;

  double kgToLbs(double kg) => kg * 2.20462;
  double lbsToKg(double lbs) => lbs / 2.20462;

  void changeHeightUnit(String newUnit) {
    setState(() {
      if (heightUnit == "cm" && newUnit == "ft") {
        height = cmToFt(height);
      } else if (heightUnit == "ft" && newUnit == "cm") {
        height = ftToCm(height);
      }

      heightUnit = newUnit;

      final range = heightRanges[newUnit]!;
      heightMin = range.min;
      heightMax = range.max;

      height = height.clamp(heightMin, heightMax);
    });
  }

  void changeWeightUnit(String newUnit) {
    setState(() {
      if (weightUnit == "kg" && newUnit == "lbs") {
        weight = kgToLbs(weight);
      } else if (weightUnit == "lbs" && newUnit == "kg") {
        weight = lbsToKg(weight);
      }

      weightUnit = newUnit;

      final range = weightRanges[newUnit]!;
      weightMin = range.min;
      weightMax = range.max;

      weight = weight.clamp(weightMin, weightMax);
    });
  }

  @override
  Widget build(BuildContext context) {
    final sm = MediaQuery.of(context).size;
    final sw = sm.width;
    final sh = sm.height;
    return Padding(
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SectionHeader(
              title: "Your Body Stat",
              titleStyle: AppTextStyles.headingMedium.copyWith(
                fontSize: sw * 0.06,
                fontWeight: FontWeight.w700,
                color: AppColors.primaryColor,
              ),
              subtitle:
                  "This helps us tailor workouts and nutrition just for you.",
            ),
            SizedBox(height: sh * 0.01),
            CustomSliderSelector(
              label: "Height",
              type: SliderType.value,
              value: height,
              min: heightMin,
              max: heightMax,
              unit: heightUnit,
              unitOptions: const ["cm", "ft"],
              selectedUnit: heightUnit,
              onUnitChange: changeHeightUnit,
              onChanged: (val) {
                setState(() => height = val);
              },
            ),

            const SizedBox(height: 20),

            CustomSliderSelector(
              label: "Weight",
              type: SliderType.value,
              value: weight,
              min: weightMin,
              max: weightMax,
              unit: weightUnit,
              unitOptions: const ["kg", "lbs"],
              selectedUnit: weightUnit,
              onUnitChange: changeWeightUnit,
              onChanged: (val) {
                setState(() => weight = val);
              },
            ),
          ],
        ),
      ),
    );
  }
}
