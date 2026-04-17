import 'package:fitiq/views/user_info/porvider/step_provider.dart';
import 'package:fitiq/views/user_info/widgets/step_3_screen.dart';
import 'package:fitiq/views/user_info/widgets/step_4_screen.dart';
import 'package:fitiq/views/user_info/widgets/step_5_screen.dart';
import 'package:fitiq/views/user_info/widgets/step_one_screen.dart';
import 'package:fitiq/views/user_info/widgets/step_two_screen.dart';
import 'package:fitiq/views/user_info/widgets/stepwraper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StepFlowScreen extends ConsumerWidget {
  const StepFlowScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final step = ref.watch(stepProvider);

    Widget currentScreen;

    switch (step) {
      case 1:
        currentScreen = const Step1Screen();
        break;
      case 2:
        currentScreen = const Step2Screen();
        break;
      case 3:
        currentScreen = const Step3Screen();
        break;
      case 4:
        currentScreen = const Step4Screen();
        break;
      case 5:
        currentScreen = const Step5Screen();
        break;
      default:
        currentScreen = const Step1Screen();
    }

    return StepWrapper(child: currentScreen);
  }
}
