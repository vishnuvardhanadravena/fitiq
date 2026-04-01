import 'dart:convert';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/schedule_res.dart';

part 'schedule_provider.g.dart';

// ─────────────────────────────────────────────
// Repository contract
// ─────────────────────────────────────────────

abstract class ScheduleRepository {
  Future<ScheduleResponse> getSchedule();
}

// ─────────────────────────────────────────────
// Mock — swap for RemoteScheduleRepository
// in production by changing the provider below
// ─────────────────────────────────────────────

class MockScheduleRepository implements ScheduleRepository {
  @override
  Future<ScheduleResponse> getSchedule() async {
    await Future.delayed(const Duration(milliseconds: 900));
    const rawJson = '''
{
  "week_days": [
    { "label": "Mon", "date": 12, "is_active": false, "has_dot": true  },
    { "label": "Tue", "date": 13, "is_active": false, "has_dot": true  },
    { "label": "Wed", "date": 14, "is_active": true,  "has_dot": true  },
    { "label": "Thu", "date": 15, "is_active": false, "has_dot": true  },
    { "label": "Fri", "date": 16, "is_active": false, "has_dot": true  },
    { "label": "Sat", "date": 17, "is_active": false, "has_dot": true  },
    { "label": "Sun", "date": 18, "is_active": false, "has_dot": false }
  ],

  "today_session": {
    "id": "session_001",
    "title": "Morning Fat Burn Yoga",
    "host_name": "With Ananya Sharma",
    "time": "07:00 AM",
    "image_url": "https://images.unsplash.com/photo-1605296867304-46d5465a13f1?auto=format&fit=crop&w=400&q=80",
    "status": "live",
    "day_label": "Wed",
    "day_number": 14
  },

  "upcoming_sessions": [
    {
      "id": "session_002",
      "title": "HIIT Workout",
      "host_name": "With Rahul",
      "time": "10:00 AM",
      "image_url": "https://images.unsplash.com/photo-1605296867304-46d5465a13f1?auto=format&fit=crop&w=400&q=80",
      "status": "upcoming",
      "day_label": "Wed",
      "day_number": 14
    },
    {
      "id": "session_003",
      "title": "Strength Training",
      "host_name": "With Meera",
      "time": "12:00 PM",
      "image_url":"https://images.unsplash.com/photo-1605296867304-46d5465a13f1?auto=format&fit=crop&w=400&q=80",
      "status": "upcoming",
      "day_label": "Thu",
      "day_number": 15
    },
    {
      "id": "session_004",
      "title": "Cardio Blast",
      "host_name": "With Arjun",
      "time": "03:00 PM",
      "image_url": "https://images.unsplash.com/photo-1605296867304-46d5465a13f1?auto=format&fit=crop&w=400&q=80",
      "status": "upcoming",
      "day_label": "Fri",
      "day_number": 16
    },
    {
      "id": "session_008",
      "title": "Zumba Dance",
      "host_name": "With Neha",
      "time": "06:00 PM",
      "image_url": "https://images.unsplash.com/photo-1605296867304-46d5465a13f1?auto=format&fit=crop&w=400&q=80",
      "status": "upcoming",
      "day_label": "Sat",
      "day_number": 17
    }
  ],

  "past_sessions": [
    {
      "id": "session_005",
      "title": "Morning Stretch",
      "host_name": "With Kavya",
      "time": "06:00 AM",
      "image_url": "https://images.unsplash.com/photo-1605296867304-46d5465a13f1?auto=format&fit=crop&w=400&q=80",
      "status": "past",
      "day_label": "Wed",
      "day_number": 14
    },
    {
      "id": "session_006",
      "title": "Core Workout",
      "host_name": "With Rohit",
      "time": "09:00 AM",
      "image_url": "https://images.unsplash.com/photo-1605296867304-46d5465a13f1?auto=format&fit=crop&w=400&q=80",
      "status": "past",
      "day_label": "Thu",
      "day_number": 15
    },
    {
      "id": "session_007",
      "title": "Evening Yoga",
      "host_name": "With Sneha",
      "time": "05:00 PM",
      "image_url":"https://images.unsplash.com/photo-1605296867304-46d5465a13f1?auto=format&fit=crop&w=400&q=80",
      "status": "past",
      "day_label": "Fri",
      "day_number": 16
    },
    {
      "id": "session_009",
      "title": "Meditation",
      "host_name": "With Amit",
      "time": "08:00 PM",
      "image_url": "https://images.unsplash.com/photo-1605296867304-46d5465a13f1?auto=format&fit=crop&w=400&q=80",
      "status": "past",
      "day_label": "Sat",
      "day_number": 17
    }
  ]
}
''';
    final decoded = jsonDecode(rawJson) as Map<String, dynamic>;
    return ScheduleResponse.fromJson(decoded);
  }
}

@riverpod
class SelectedDate extends _$SelectedDate {
  @override
  int? build() => null;

  void select(int date) => state = date;
}

@riverpod
ScheduleRepository scheduleRepository(Ref ref) {
  return MockScheduleRepository();
}

@riverpod
class ScheduleNotifier extends _$ScheduleNotifier {
  @override
  Future<ScheduleResponse> build() async {
    return ref.read(scheduleRepositoryProvider).getSchedule();
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => ref.read(scheduleRepositoryProvider).getSchedule(),
    );
  }
}

@riverpod
Session? todaySession(Ref ref) {
  final selectedDate = ref.watch(selectedDateProvider);

  return ref
      .watch(scheduleProvider)
      .whenOrNull(
        data: (s) {
          final today = s.todaySession.dayNumber;

          if (selectedDate != null && selectedDate != today) {
            return null;
          }

          return s.todaySession;
        },
      );
}

@riverpod
List<Session> upcomingSessions(Ref ref) {
  final selectedDate = ref.watch(selectedDateProvider);

  return ref
      .watch(scheduleProvider)
      .maybeWhen(
        data: (s) {
          final today = s.todaySession.dayNumber;

          if (selectedDate == null || selectedDate == today) {
            return s.upcomingSessions;
          }

          return s.upcomingSessions
              .where((e) => e.dayNumber == selectedDate)
              .toList();
        },
        orElse: () => [],
      );
}

@riverpod
List<Session> pastSessions(Ref ref) {
  return ref
      .watch(scheduleProvider)
      .maybeWhen(data: (s) => s.pastSessions, orElse: () => []);
}

bool isToday(int? selectedDate) {
  if (selectedDate == null) return true;
  return selectedDate == DateTime.now().day;
}
