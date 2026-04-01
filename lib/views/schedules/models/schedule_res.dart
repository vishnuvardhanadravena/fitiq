import 'package:freezed_annotation/freezed_annotation.dart';

part 'schedule_res.freezed.dart';
part 'schedule_res.g.dart';

// ─────────────────────────────────────────────
// WeekDay
// ─────────────────────────────────────────────

@freezed
abstract class WeekDay with _$WeekDay {
  const factory WeekDay({
    required String label,
    required int date,
    @JsonKey(name: 'is_active') @Default(false) bool isActive,
    @JsonKey(name: 'has_dot') @Default(false) bool hasDot,
  }) = _WeekDay;

  factory WeekDay.fromJson(Map<String, dynamic> json) =>
      _$WeekDayFromJson(json);
}

// ─────────────────────────────────────────────
// SessionStatus
// ─────────────────────────────────────────────

enum SessionStatus { live, upcoming, past }

// ─────────────────────────────────────────────
// Session
// ─────────────────────────────────────────────

@freezed
abstract class Session with _$Session {
  const Session._();

  const factory Session({
    required String id,
    required String title,
    @JsonKey(name: 'host_name') required String hostName,
    required String time,
    @JsonKey(name: 'image_url') @Default('') String imageUrl,
    @Default(SessionStatus.upcoming) SessionStatus status,
    @JsonKey(name: 'day_label') @Default('') String dayLabel,
    @JsonKey(name: 'day_number') @Default(0) int dayNumber,
  }) = _Session;

  factory Session.fromJson(Map<String, dynamic> json) =>
      _$SessionFromJson(json);

  bool get isLive => status == SessionStatus.live;
  bool get isPast => status == SessionStatus.past;
}

// ─────────────────────────────────────────────
// ScheduleResponse
// ─────────────────────────────────────────────

@freezed
abstract class ScheduleResponse with _$ScheduleResponse {
  const factory ScheduleResponse({
    @JsonKey(name: 'week_days') required List<WeekDay> weekDays,
    @JsonKey(name: 'today_session') required Session todaySession,
    @JsonKey(name: 'upcoming_sessions')
    required List<Session> upcomingSessions,
    @JsonKey(name: 'past_sessions') required List<Session> pastSessions,
  }) = _ScheduleResponse;

  factory ScheduleResponse.fromJson(Map<String, dynamic> json) =>
      _$ScheduleResponseFromJson(json);
}
