import 'package:fitiq/core/theame/app_text_styles.dart';
import 'package:fitiq/core/widgets/custum_app_bar.dart';
import 'package:fitiq/core/widgets/primary_button.dart';
import 'package:fitiq/views/user_info/porvider/step_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StepWrapper extends ConsumerWidget {
  final Widget child;

  const StepWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final step = ref.watch(stepProvider);
    final controller = ref.read(stepProvider.notifier);

    return Scaffold(
      appBar: CustomAppBar(
        title: "Step $step of 5",
        textAlign: TextAlign.center,
        titleStyle: AppTextStyles.body.copyWith(fontWeight: FontWeight.w600),
        height: MediaQuery.of(context).size.height * 0.1,
        onBackTap: () => controller.previous(),
      ),
      body: SafeArea(
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: LinearProgressIndicator(
                value: step / 5,
                minHeight: 6,
                backgroundColor: Colors.grey.shade300,
                valueColor: AlwaysStoppedAnimation(Colors.blue),
              ),
            ),
            Expanded(child: child),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: controller.next,
                    child: Text("Skip for now", style: AppTextStyles.bodyDark),
                  ),
                  const Spacer(),
                  AppButton(
                    label: step == 5 ? "Create My Plan" : "Continue",
                    suffixIcon: Icons.arrow_forward_rounded,
                    onPressed: controller.next,

                    // ref.read(stepProvider.notifier).next();
                  ),
                  // ElevatedButton(
                  //   onPressed: controller.next,
                  //   child: Text(step == 5 ? "Create My Plan →" : "Continue →"),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
