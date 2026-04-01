// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WeekDay _$WeekDayFromJson(Map<String, dynamic> json) => _WeekDay(
  label: json['label'] as String,
  date: (json['date'] as num).toInt(),
  isActive: json['is_active'] as bool? ?? false,
  hasDot: json['has_dot'] as bool? ?? false,
);

Map<String, dynamic> _$WeekDayToJson(_WeekDay instance) => <String, dynamic>{
  'label': instance.label,
  'date': instance.date,
  'is_active': instance.isActive,
  'has_dot': instance.hasDot,
};

_Session _$SessionFromJson(Map<String, dynamic> json) => _Session(
  id: json['id'] as String,
  title: json['title'] as String,
  hostName: json['host_name'] as String,
  time: json['time'] as String,
  imageUrl: json['image_url'] as String? ?? '',
  status:
      $enumDecodeNullable(_$SessionStatusEnumMap, json['status']) ??
      SessionStatus.upcoming,
  dayLabel: json['day_label'] as String? ?? '',
  dayNumber: (json['day_number'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$SessionToJson(_Session instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'host_name': instance.hostName,
  'time': instance.time,
  'image_url': instance.imageUrl,
  'status': _$SessionStatusEnumMap[instance.status]!,
  'day_label': instance.dayLabel,
  'day_number': instance.dayNumber,
};

const _$SessionStatusEnumMap = {
  SessionStatus.live: 'live',
  SessionStatus.upcoming: 'upcoming',
  SessionStatus.past: 'past',
};

_ScheduleResponse _$ScheduleResponseFromJson(Map<String, dynamic> json) =>
    _ScheduleResponse(
      weekDays: (json['week_days'] as List<dynamic>)
          .map((e) => WeekDay.fromJson(e as Map<String, dynamic>))
          .toList(),
      todaySession: Session.fromJson(
        json['today_session'] as Map<String, dynamic>,
      ),
      upcomingSessions: (json['upcoming_sessions'] as List<dynamic>)
          .map((e) => Session.fromJson(e as Map<String, dynamic>))
          .toList(),
      pastSessions: (json['past_sessions'] as List<dynamic>)
          .map((e) => Session.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ScheduleResponseToJson(_ScheduleResponse instance) =>
    <String, dynamic>{
      'week_days': instance.weekDays,
      'today_session': instance.todaySession,
      'upcoming_sessions': instance.upcomingSessions,
      'past_sessions': instance.pastSessions,
    };
