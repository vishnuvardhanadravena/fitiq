// firness_plan_provider.dart

import 'dart:convert';
import 'package:fitiq/views/plans/models/fitness_plan_detail_res.dart';
import 'package:fitiq/views/plans/models/programs_res.dart';
import 'package:fitiq/views/plans/provider/category_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:collection/collection.dart';

part 'firness_plan_provider.g.dart';

abstract class FitnessPlanRepository {
  Future<List<FitnessPlan>> fetchPlans({String? category});
  Future<FitnessPlanDetail> getPlanById(String id); // 👈 new
}

class MockFitnessPlanRepository implements FitnessPlanRepository {
  @override
  Future<List<FitnessPlan>> fetchPlans({String? category}) async {
    await Future.delayed(const Duration(milliseconds: 800));
    const rawJson = '''
[
  {
    "id": 1,
    "title": "90 Days Total Transformation",
    "subtitle": "Trainer + diet",
    "weeks": 13,
    "features": ["Video Sessions", "Diet Chart", "Weekly Check-in"],
    "price": 4999,
    "badge": "Most Popular",
    "is_featured": true,
    "image_url": "https://images.unsplash.com/photo-1571019613454-1cb2f99b2d8b?w=800"
  },
  {
    "id": 2,
    "title": "60 Days Diet Plan",
    "subtitle": "Nutrition plan",
    "weeks": 8,
    "features": ["Video Sessions", "Diet Chart"],
    "price": 2499,
    "badge": "New",
    "is_featured": false,
    "image_url": "https://images.unsplash.com/photo-1490645935967-10de6ba17061?w=800"
  },
  {
    "id": 3,
    "title": "Home Workout Plan",
    "subtitle": "Train at home",
    "weeks": 8,
    "features": ["Video Sessions"],
    "price": 1999,
    "badge": "New",
    "is_featured": false,
    "image_url": "https://images.unsplash.com/photo-1552674605-db6ffd4facb5?w=800"
  },

  {
    "id": 4,
    "title": "Weight Loss Bootcamp",
    "subtitle": "Fat burn program",
    "weeks": 6,
    "features": ["Diet Chart", "Workout Plan"],
    "price": 2999,
    "badge": "Bestseller",
    "is_featured": false,
    "image_url": "https://images.unsplash.com/photo-1549060279-7e168fcee0c2?w=800"
  },
  {
    "id": 5,
    "title": "Advanced Muscle Gain Plan",
    "subtitle": "Build strength",
    "weeks": 10,
    "features": ["Gym Workout", "Diet Plan"],
    "price": 3999,
    "badge": "New",
    "is_featured": false,
    "image_url": "https://images.unsplash.com/photo-1517836357463-d25dfeac3438?w=800"
  },
  {
    "id": 6,
    "title": "Quick Weight Loss Plan",
    "subtitle": "Lose fat fast",
    "weeks": 4,
    "features": ["Diet Chart", "Cardio Plan"],
    "price": 1999,
    "badge": "New",
    "is_featured": false,
    "image_url": "https://images.unsplash.com/photo-1594737625785-c9c1c0b1f0d3?w=800"
  },
  {
    "id": 7,
    "title": "Muscle Transformation Program",
    "subtitle": "Full body training",
    "weeks": 12,
    "features": ["Workout Plan", "Protein Guide"],
    "price": 4999,
    "badge": "Popular",
    "is_featured": false,
    "image_url": "https://images.unsplash.com/photo-1534438327276-14e5300c3a48?w=800"
  },
  {
    "id": 8,
    "title": "Home Fat Loss Plan",
    "subtitle": "No gym required",
    "weeks": 6,
    "features": ["Home Workout", "Diet Plan"],
    "price": 1799,
    "badge": "New",
    "is_featured": false,
    "image_url": "https://images.unsplash.com/photo-1552674605-db6ffd4facb5?w=800"
  },
  {
    "id": 9,
    "title": "Professional Diet Plan",
    "subtitle": "Nutrition expert",
    "weeks": 8,
    "features": ["Diet Chart", "Consultation"],
    "price": 2999,
    "badge": "Bestseller",
    "is_featured": false,
    "image_url": "https://images.unsplash.com/photo-1490645935967-10de6ba17061?w=800"
  },
  {
    "id": 10,
    "title": "Strength & Muscle Gain",
    "subtitle": "Gym training",
    "weeks": 12,
    "features": ["Workout Plan", "Diet Plan"],
    "price": 4599,
    "badge": "Popular",
    "is_featured": false,
    "image_url": "https://images.unsplash.com/photo-1517836357463-d25dfeac3438?w=800"
  }
]
''';
    final List decoded = jsonDecode(rawJson);
    final plans = decoded.map((e) => FitnessPlan.fromJson(e)).toList();
    if (category == null || category == "All") return plans;
    return plans.where((plan) {
      final title = plan.title.toLowerCase();

      if (category == "Weight Loss") {
        return title.contains("loss");
      } else if (category == "Diet") {
        return title.contains("diet");
      } else if (category == "Home Workout") {
        return title.contains("home");
      } else if (category == "Muscle Gain") {
        return title.contains("transformation");
      }
      return true;
    }).toList();
  }

  @override
  Future<FitnessPlanDetail> getPlanById(String id) async {
    await Future.delayed(const Duration(milliseconds: 800));

    /// 🔥 YOU CAN USE ID TO RETURN DIFFERENT DATA
    if (id == "1") {
      return FitnessPlanDetail(
        id: 1,
        title: "90 Days Total Transformation",
        subtitle: "Trainer + Diet Plan + Weekly Check-ins",
        imageUrl:
            "https://images.unsplash.com/photo-1571019613454-1cb2f99b2d8b?w=800",
        badge: "Most Popular",
        price: 4999,
        rating: 4.9,
        reviewCount: 240,
        priceNote: "One-time payment or EMI options available",

        stats: const [
          PlanStat(icon: "calendar", label: "12 Weeks"),
          PlanStat(icon: "live", label: "36 Live Sessions"),
          PlanStat(icon: "trend", label: "Beginner to Advanced"),
          PlanStat(icon: "user", label: "1-on-1 Guidance"),
        ],

        inclusions: const [
          "Personalized diet chart",
          "Weekly progress tracking",
          "Access to recorded sessions",
          "Live trainer support",
          "Community group access",
        ],

        phases: const [
          ProgramPhase(
            weekRange: "Week 1-4",
            title: "Foundation Phase",
            description:
                "Build strength, improve mobility, and establish healthy habits.",
            tagColor: "#42A5F5",
          ),
          ProgramPhase(
            weekRange: "Week 5-8",
            title: "Fat Burn Phase",
            description: "Accelerated fat loss & endurance.",
            tagColor: "#26A69A",
          ),
          ProgramPhase(
            weekRange: "Week 9-12",
            title: "Strength & Sculpt",
            description: "Muscle toning & definition.",
            tagColor: "#7E57C2",
          ),
        ],
      );
    }

    /// 🔥 DEFAULT (for other IDs)
    return FitnessPlanDetail(
      id: int.parse(id),
      title: "Sample Plan",
      subtitle: "Basic transformation plan",
      imageUrl:
          "https://images.unsplash.com/photo-1552674605-db6ffd4facb5?w=800",
      price: 1999,
      rating: 4.5,
      reviewCount: 100,
      priceNote: "Limited time offer",
    );
  }
}

@riverpod
FitnessPlanRepository fitnessPlanRepository(Ref ref) {
  return MockFitnessPlanRepository();
}

@riverpod
class FitnessPlanNotifier extends _$FitnessPlanNotifier {
  @override
  Future<List<FitnessPlan>> build() async {
    final selectedIndex = ref.watch(categoryProvider);
    final selectedCategory = categories[selectedIndex];

    return ref
        .read(fitnessPlanRepositoryProvider)
        .fetchPlans(category: selectedCategory);
  }

  Future<void> refresh() async {
    final selectedIndex = ref.read(categoryProvider);
    final selectedCategory = categories[selectedIndex];

    state = const AsyncLoading();

    state = await AsyncValue.guard(
      () => ref
          .read(fitnessPlanRepositoryProvider)
          .fetchPlans(category: selectedCategory),
    );
  }
}

@riverpod
FitnessPlan? featuredPlan(Ref ref) {
  final plans = ref.watch(fitnessPlanProvider);
  return plans.when(
    data: (list) => list.firstWhereOrNull((p) => p.isFeatured),
    loading: () => null,
    error: (_, __) => null,
  );
}

@riverpod
List<FitnessPlan> regularPlans(Ref ref) {
  final plans = ref.watch(fitnessPlanProvider);

  return plans.maybeWhen(
    data: (list) => list.where((p) => !p.isFeatured).toList(),
    orElse: () => [],
  );
}

@riverpod
Future<FitnessPlanDetail> fitnessPlanById(Ref ref, String id) async {
  final repo = ref.read(fitnessPlanRepositoryProvider);
  return repo.getPlanById(id);
}
