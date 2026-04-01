import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'category_provider.g.dart';

@riverpod
class Category extends _$Category {
  @override
  int build() => 0;

  void setIndex(int index) {
    state = index;
  }
}

const categories = [
  "All",
  "Weight Loss",
  "Muscle Gain",
  "Diet",
  "Home Workout",
];
