import 'package:flutter_riverpod/legacy.dart';

final stepProvider = StateNotifierProvider<StepController, int>((ref) {
  return StepController();
});

class StepController extends StateNotifier<int> {
  StepController() : super(1);

  final int totalSteps = 5;

  void next() {
    if (state < totalSteps) state++;
  }

  void previous() {
    if (state > 1) state--;
  }

  void goTo(int step) {
    state = step;
  }
}