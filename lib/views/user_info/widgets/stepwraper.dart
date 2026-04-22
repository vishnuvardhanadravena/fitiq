import 'package:fitiq/core/providers/shared_prefs_provider.dart';
import 'package:fitiq/core/theame/app_text_styles.dart';
import 'package:fitiq/core/widgets/custum_app_bar.dart';
import 'package:fitiq/core/widgets/primary_button.dart';
import 'package:fitiq/routes/route_constants.dart';
import 'package:fitiq/views/user_info/porvider/step_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class StepWrapper extends ConsumerStatefulWidget {
  final Widget child;

  const StepWrapper({super.key, required this.child});

  @override
  ConsumerState<StepWrapper> createState() => _StepWrapperState();
}

class _StepWrapperState extends ConsumerState<StepWrapper> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(stepProvider.notifier).reset();
    });
  }

  @override
  Widget build(BuildContext context) {
    final step = ref.watch(stepProvider);
    final controller = ref.read(stepProvider.notifier);
    return Scaffold(
      appBar: CustomAppBar(
        title: "Step $step of 5",
        textAlign: TextAlign.center,
        showBackButton: step == 1 ? false : true,
        titleStyle: AppTextStyles.body.copyWith(fontWeight: FontWeight.w600),
        height: step == 1
            ? MediaQuery.of(context).size.height * 0.2
            : MediaQuery.of(context).size.height * 0.1,
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
                valueColor: const AlwaysStoppedAnimation(Colors.blue),
              ),
            ),
            Expanded(child: widget.child),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      context.go(RouteList.login);
                    },
                    child: Text("Skip for now", style: AppTextStyles.bodyDark),
                  ),
                  const Spacer(),
                  AppButton(
                    label: step == 5 ? "Create My Plan" : "Continue",
                    suffixIcon: Icons.arrow_forward_rounded,
                    onPressed: () async {
                      final router = GoRouter.of(context);
                      if (step == 5) {
                        final prefs = ref.read(sharedPrefsProvider);
                        await prefs.setBool('isStepsCompleted', true);
                        if (!context.mounted) return;
                        router.go(RouteList.home);
                      } else {
                        controller.next();
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
