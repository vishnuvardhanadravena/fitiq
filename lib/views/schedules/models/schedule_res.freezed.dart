// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'schedule_res.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WeekDay {

 String get label; int get date;@JsonKey(name: 'is_active') bool get isActive;@JsonKey(name: 'has_dot') bool get hasDot;
/// Create a copy of WeekDay
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WeekDayCopyWith<WeekDay> get copyWith => _$WeekDayCopyWithImpl<WeekDay>(this as WeekDay, _$identity);

  /// Serializes this WeekDay to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WeekDay&&(identical(other.label, label) || other.label == label)&&(identical(other.date, date) || other.date == date)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.hasDot, hasDot) || other.hasDot == hasDot));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,label,date,isActive,hasDot);

@override
String toString() {
  return 'WeekDay(label: $label, date: $date, isActive: $isActive, hasDot: $hasDot)';
}


}

/// @nodoc
abstract mixin class $WeekDayCopyWith<$Res>  {
  factory $WeekDayCopyWith(WeekDay value, $Res Function(WeekDay) _then) = _$WeekDayCopyWithImpl;
@useResult
$Res call({
 String label, int date,@JsonKey(name: 'is_active') bool isActive,@JsonKey(name: 'has_dot') bool hasDot
});




}
/// @nodoc
class _$WeekDayCopyWithImpl<$Res>
    implements $WeekDayCopyWith<$Res> {
  _$WeekDayCopyWithImpl(this._self, this._then);

  final WeekDay _self;
  final $Res Function(WeekDay) _then;

/// Create a copy of WeekDay
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? label = null,Object? date = null,Object? isActive = null,Object? hasDot = null,}) {
  return _then(_self.copyWith(
label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as int,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,hasDot: null == hasDot ? _self.hasDot : hasDot // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [WeekDay].
extension WeekDayPatterns on WeekDay {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WeekDay value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WeekDay() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WeekDay value)  $default,){
final _that = this;
switch (_that) {
case _WeekDay():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WeekDay value)?  $default,){
final _that = this;
switch (_that) {
case _WeekDay() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String label,  int date, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'has_dot')  bool hasDot)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WeekDay() when $default != null:
return $default(_that.label,_that.date,_that.isActive,_that.hasDot);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String label,  int date, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'has_dot')  bool hasDot)  $default,) {final _that = this;
switch (_that) {
case _WeekDay():
return $default(_that.label,_that.date,_that.isActive,_that.hasDot);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String label,  int date, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'has_dot')  bool hasDot)?  $default,) {final _that = this;
switch (_that) {
case _WeekDay() when $default != null:
return $default(_that.label,_that.date,_that.isActive,_that.hasDot);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WeekDay implements WeekDay {
  const _WeekDay({required this.label, required this.date, @JsonKey(name: 'is_active') this.isActive = false, @JsonKey(name: 'has_dot') this.hasDot = false});
  factory _WeekDay.fromJson(Map<String, dynamic> json) => _$WeekDayFromJson(json);

@override final  String label;
@override final  int date;
@override@JsonKey(name: 'is_active') final  bool isActive;
@override@JsonKey(name: 'has_dot') final  bool hasDot;

/// Create a copy of WeekDay
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WeekDayCopyWith<_WeekDay> get copyWith => __$WeekDayCopyWithImpl<_WeekDay>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WeekDayToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WeekDay&&(identical(other.label, label) || other.label == label)&&(identical(other.date, date) || other.date == date)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.hasDot, hasDot) || other.hasDot == hasDot));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,label,date,isActive,hasDot);

@override
String toString() {
  return 'WeekDay(label: $label, date: $date, isActive: $isActive, hasDot: $hasDot)';
}


}

/// @nodoc
abstract mixin class _$WeekDayCopyWith<$Res> implements $WeekDayCopyWith<$Res> {
  factory _$WeekDayCopyWith(_WeekDay value, $Res Function(_WeekDay) _then) = __$WeekDayCopyWithImpl;
@override @useResult
$Res call({
 String label, int date,@JsonKey(name: 'is_active') bool isActive,@JsonKey(name: 'has_dot') bool hasDot
});




}
/// @nodoc
class __$WeekDayCopyWithImpl<$Res>
    implements _$WeekDayCopyWith<$Res> {
  __$WeekDayCopyWithImpl(this._self, this._then);

  final _WeekDay _self;
  final $Res Function(_WeekDay) _then;

/// Create a copy of WeekDay
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? label = null,Object? date = null,Object? isActive = null,Object? hasDot = null,}) {
  return _then(_WeekDay(
label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as int,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,hasDot: null == hasDot ? _self.hasDot : hasDot // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$Session {

 String get id; String get title;@JsonKey(name: 'host_name') String get hostName; String get time;@JsonKey(name: 'image_url') String get imageUrl; SessionStatus get status;@JsonKey(name: 'day_label') String get dayLabel;@JsonKey(name: 'day_number') int get dayNumber;
/// Create a copy of Session
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SessionCopyWith<Session> get copyWith => _$SessionCopyWithImpl<Session>(this as Session, _$identity);

  /// Serializes this Session to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Session&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.hostName, hostName) || other.hostName == hostName)&&(identical(other.time, time) || other.time == time)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.status, status) || other.status == status)&&(identical(other.dayLabel, dayLabel) || other.dayLabel == dayLabel)&&(identical(other.dayNumber, dayNumber) || other.dayNumber == dayNumber));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,hostName,time,imageUrl,status,dayLabel,dayNumber);

@override
String toString() {
  return 'Session(id: $id, title: $title, hostName: $hostName, time: $time, imageUrl: $imageUrl, status: $status, dayLabel: $dayLabel, dayNumber: $dayNumber)';
}


}

/// @nodoc
abstract mixin class $SessionCopyWith<$Res>  {
  factory $SessionCopyWith(Session value, $Res Function(Session) _then) = _$SessionCopyWithImpl;
@useResult
$Res call({
 String id, String title,@JsonKey(name: 'host_name') String hostName, String time,@JsonKey(name: 'image_url') String imageUrl, SessionStatus status,@JsonKey(name: 'day_label') String dayLabel,@JsonKey(name: 'day_number') int dayNumber
});




}
/// @nodoc
class _$SessionCopyWithImpl<$Res>
    implements $SessionCopyWith<$Res> {
  _$SessionCopyWithImpl(this._self, this._then);

  final Session _self;
  final $Res Function(Session) _then;

/// Create a copy of Session
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? hostName = null,Object? time = null,Object? imageUrl = null,Object? status = null,Object? dayLabel = null,Object? dayNumber = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,hostName: null == hostName ? _self.hostName : hostName // ignore: cast_nullable_to_non_nullable
as String,time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as SessionStatus,dayLabel: null == dayLabel ? _self.dayLabel : dayLabel // ignore: cast_nullable_to_non_nullable
as String,dayNumber: null == dayNumber ? _self.dayNumber : dayNumber // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [Session].
extension SessionPatterns on Session {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Session value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Session() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Session value)  $default,){
final _that = this;
switch (_that) {
case _Session():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Session value)?  $default,){
final _that = this;
switch (_that) {
case _Session() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title, @JsonKey(name: 'host_name')  String hostName,  String time, @JsonKey(name: 'image_url')  String imageUrl,  SessionStatus status, @JsonKey(name: 'day_label')  String dayLabel, @JsonKey(name: 'day_number')  int dayNumber)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Session() when $default != null:
return $default(_that.id,_that.title,_that.hostName,_that.time,_that.imageUrl,_that.status,_that.dayLabel,_that.dayNumber);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title, @JsonKey(name: 'host_name')  String hostName,  String time, @JsonKey(name: 'image_url')  String imageUrl,  SessionStatus status, @JsonKey(name: 'day_label')  String dayLabel, @JsonKey(name: 'day_number')  int dayNumber)  $default,) {final _that = this;
switch (_that) {
case _Session():
return $default(_that.id,_that.title,_that.hostName,_that.time,_that.imageUrl,_that.status,_that.dayLabel,_that.dayNumber);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title, @JsonKey(name: 'host_name')  String hostName,  String time, @JsonKey(name: 'image_url')  String imageUrl,  SessionStatus status, @JsonKey(name: 'day_label')  String dayLabel, @JsonKey(name: 'day_number')  int dayNumber)?  $default,) {final _that = this;
switch (_that) {
case _Session() when $default != null:
return $default(_that.id,_that.title,_that.hostName,_that.time,_that.imageUrl,_that.status,_that.dayLabel,_that.dayNumber);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Session extends Session {
  const _Session({required this.id, required this.title, @JsonKey(name: 'host_name') required this.hostName, required this.time, @JsonKey(name: 'image_url') this.imageUrl = '', this.status = SessionStatus.upcoming, @JsonKey(name: 'day_label') this.dayLabel = '', @JsonKey(name: 'day_number') this.dayNumber = 0}): super._();
  factory _Session.fromJson(Map<String, dynamic> json) => _$SessionFromJson(json);

@override final  String id;
@override final  String title;
@override@JsonKey(name: 'host_name') final  String hostName;
@override final  String time;
@override@JsonKey(name: 'image_url') final  String imageUrl;
@override@JsonKey() final  SessionStatus status;
@override@JsonKey(name: 'day_label') final  String dayLabel;
@override@JsonKey(name: 'day_number') final  int dayNumber;

/// Create a copy of Session
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SessionCopyWith<_Session> get copyWith => __$SessionCopyWithImpl<_Session>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SessionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Session&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.hostName, hostName) || other.hostName == hostName)&&(identical(other.time, time) || other.time == time)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.status, status) || other.status == status)&&(identical(other.dayLabel, dayLabel) || other.dayLabel == dayLabel)&&(identical(other.dayNumber, dayNumber) || other.dayNumber == dayNumber));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,hostName,time,imageUrl,status,dayLabel,dayNumber);

@override
String toString() {
  return 'Session(id: $id, title: $title, hostName: $hostName, time: $time, imageUrl: $imageUrl, status: $status, dayLabel: $dayLabel, dayNumber: $dayNumber)';
}


}

/// @nodoc
abstract mixin class _$SessionCopyWith<$Res> implements $SessionCopyWith<$Res> {
  factory _$SessionCopyWith(_Session value, $Res Function(_Session) _then) = __$SessionCopyWithImpl;
@override @useResult
$Res call({
 String id, String title,@JsonKey(name: 'host_name') String hostName, String time,@JsonKey(name: 'image_url') String imageUrl, SessionStatus status,@JsonKey(name: 'day_label') String dayLabel,@JsonKey(name: 'day_number') int dayNumber
});




}
/// @nodoc
class __$SessionCopyWithImpl<$Res>
    implements _$SessionCopyWith<$Res> {
  __$SessionCopyWithImpl(this._self, this._then);

  final _Session _self;
  final $Res Function(_Session) _then;

/// Create a copy of Session
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? hostName = null,Object? time = null,Object? imageUrl = null,Object? status = null,Object? dayLabel = null,Object? dayNumber = null,}) {
  return _then(_Session(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,hostName: null == hostName ? _self.hostName : hostName // ignore: cast_nullable_to_non_nullable
as String,time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as SessionStatus,dayLabel: null == dayLabel ? _self.dayLabel : dayLabel // ignore: cast_nullable_to_non_nullable
as String,dayNumber: null == dayNumber ? _self.dayNumber : dayNumber // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$ScheduleResponse {

@JsonKey(name: 'week_days') List<WeekDay> get weekDays;@JsonKey(name: 'today_session') Session get todaySession;@JsonKey(name: 'upcoming_sessions') List<Session> get upcomingSessions;@JsonKey(name: 'past_sessions') List<Session> get pastSessions;
/// Create a copy of ScheduleResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ScheduleResponseCopyWith<ScheduleResponse> get copyWith => _$ScheduleResponseCopyWithImpl<ScheduleResponse>(this as ScheduleResponse, _$identity);

  /// Serializes this ScheduleResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScheduleResponse&&const DeepCollectionEquality().equals(other.weekDays, weekDays)&&(identical(other.todaySession, todaySession) || other.todaySession == todaySession)&&const DeepCollectionEquality().equals(other.upcomingSessions, upcomingSessions)&&const DeepCollectionEquality().equals(other.pastSessions, pastSessions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(weekDays),todaySession,const DeepCollectionEquality().hash(upcomingSessions),const DeepCollectionEquality().hash(pastSessions));

@override
String toString() {
  return 'ScheduleResponse(weekDays: $weekDays, todaySession: $todaySession, upcomingSessions: $upcomingSessions, pastSessions: $pastSessions)';
}


}

/// @nodoc
abstract mixin class $ScheduleResponseCopyWith<$Res>  {
  factory $ScheduleResponseCopyWith(ScheduleResponse value, $Res Function(ScheduleResponse) _then) = _$ScheduleResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'week_days') List<WeekDay> weekDays,@JsonKey(name: 'today_session') Session todaySession,@JsonKey(name: 'upcoming_sessions') List<Session> upcomingSessions,@JsonKey(name: 'past_sessions') List<Session> pastSessions
});


$SessionCopyWith<$Res> get todaySession;

}
/// @nodoc
class _$ScheduleResponseCopyWithImpl<$Res>
    implements $ScheduleResponseCopyWith<$Res> {
  _$ScheduleResponseCopyWithImpl(this._self, this._then);

  final ScheduleResponse _self;
  final $Res Function(ScheduleResponse) _then;

/// Create a copy of ScheduleResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? weekDays = null,Object? todaySession = null,Object? upcomingSessions = null,Object? pastSessions = null,}) {
  return _then(_self.copyWith(
weekDays: null == weekDays ? _self.weekDays : weekDays // ignore: cast_nullable_to_non_nullable
as List<WeekDay>,todaySession: null == todaySession ? _self.todaySession : todaySession // ignore: cast_nullable_to_non_nullable
as Session,upcomingSessions: null == upcomingSessions ? _self.upcomingSessions : upcomingSessions // ignore: cast_nullable_to_non_nullable
as List<Session>,pastSessions: null == pastSessions ? _self.pastSessions : pastSessions // ignore: cast_nullable_to_non_nullable
as List<Session>,
  ));
}
/// Create a copy of ScheduleResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SessionCopyWith<$Res> get todaySession {
  
  return $SessionCopyWith<$Res>(_self.todaySession, (value) {
    return _then(_self.copyWith(todaySession: value));
  });
}
}


/// Adds pattern-matching-related methods to [ScheduleResponse].
extension ScheduleResponsePatterns on ScheduleResponse {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ScheduleResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ScheduleResponse() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ScheduleResponse value)  $default,){
final _that = this;
switch (_that) {
case _ScheduleResponse():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ScheduleResponse value)?  $default,){
final _that = this;
switch (_that) {
case _ScheduleResponse() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'week_days')  List<WeekDay> weekDays, @JsonKey(name: 'today_session')  Session todaySession, @JsonKey(name: 'upcoming_sessions')  List<Session> upcomingSessions, @JsonKey(name: 'past_sessions')  List<Session> pastSessions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ScheduleResponse() when $default != null:
return $default(_that.weekDays,_that.todaySession,_that.upcomingSessions,_that.pastSessions);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'week_days')  List<WeekDay> weekDays, @JsonKey(name: 'today_session')  Session todaySession, @JsonKey(name: 'upcoming_sessions')  List<Session> upcomingSessions, @JsonKey(name: 'past_sessions')  List<Session> pastSessions)  $default,) {final _that = this;
switch (_that) {
case _ScheduleResponse():
return $default(_that.weekDays,_that.todaySession,_that.upcomingSessions,_that.pastSessions);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'week_days')  List<WeekDay> weekDays, @JsonKey(name: 'today_session')  Session todaySession, @JsonKey(name: 'upcoming_sessions')  List<Session> upcomingSessions, @JsonKey(name: 'past_sessions')  List<Session> pastSessions)?  $default,) {final _that = this;
switch (_that) {
case _ScheduleResponse() when $default != null:
return $default(_that.weekDays,_that.todaySession,_that.upcomingSessions,_that.pastSessions);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ScheduleResponse implements ScheduleResponse {
  const _ScheduleResponse({@JsonKey(name: 'week_days') required final  List<WeekDay> weekDays, @JsonKey(name: 'today_session') required this.todaySession, @JsonKey(name: 'upcoming_sessions') required final  List<Session> upcomingSessions, @JsonKey(name: 'past_sessions') required final  List<Session> pastSessions}): _weekDays = weekDays,_upcomingSessions = upcomingSessions,_pastSessions = pastSessions;
  factory _ScheduleResponse.fromJson(Map<String, dynamic> json) => _$ScheduleResponseFromJson(json);

 final  List<WeekDay> _weekDays;
@override@JsonKey(name: 'week_days') List<WeekDay> get weekDays {
  if (_weekDays is EqualUnmodifiableListView) return _weekDays;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_weekDays);
}

@override@JsonKey(name: 'today_session') final  Session todaySession;
 final  List<Session> _upcomingSessions;
@override@JsonKey(name: 'upcoming_sessions') List<Session> get upcomingSessions {
  if (_upcomingSessions is EqualUnmodifiableListView) return _upcomingSessions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_upcomingSessions);
}

 final  List<Session> _pastSessions;
@override@JsonKey(name: 'past_sessions') List<Session> get pastSessions {
  if (_pastSessions is EqualUnmodifiableListView) return _pastSessions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_pastSessions);
}


/// Create a copy of ScheduleResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ScheduleResponseCopyWith<_ScheduleResponse> get copyWith => __$ScheduleResponseCopyWithImpl<_ScheduleResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ScheduleResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ScheduleResponse&&const DeepCollectionEquality().equals(other._weekDays, _weekDays)&&(identical(other.todaySession, todaySession) || other.todaySession == todaySession)&&const DeepCollectionEquality().equals(other._upcomingSessions, _upcomingSessions)&&const DeepCollectionEquality().equals(other._pastSessions, _pastSessions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_weekDays),todaySession,const DeepCollectionEquality().hash(_upcomingSessions),const DeepCollectionEquality().hash(_pastSessions));

@override
String toString() {
  return 'ScheduleResponse(weekDays: $weekDays, todaySession: $todaySession, upcomingSessions: $upcomingSessions, pastSessions: $pastSessions)';
}


}

/// @nodoc
abstract mixin class _$ScheduleResponseCopyWith<$Res> implements $ScheduleResponseCopyWith<$Res> {
  factory _$ScheduleResponseCopyWith(_ScheduleResponse value, $Res Function(_ScheduleResponse) _then) = __$ScheduleResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'week_days') List<WeekDay> weekDays,@JsonKey(name: 'today_session') Session todaySession,@JsonKey(name: 'upcoming_sessions') List<Session> upcomingSessions,@JsonKey(name: 'past_sessions') List<Session> pastSessions
});


@override $SessionCopyWith<$Res> get todaySession;

}
/// @nodoc
class __$ScheduleResponseCopyWithImpl<$Res>
    implements _$ScheduleResponseCopyWith<$Res> {
  __$ScheduleResponseCopyWithImpl(this._self, this._then);

  final _ScheduleResponse _self;
  final $Res Function(_ScheduleResponse) _then;

/// Create a copy of ScheduleResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? weekDays = null,Object? todaySession = null,Object? upcomingSessions = null,Object? pastSessions = null,}) {
  return _then(_ScheduleResponse(
weekDays: null == weekDays ? _self._weekDays : weekDays // ignore: cast_nullable_to_non_nullable
as List<WeekDay>,todaySession: null == todaySession ? _self.todaySession : todaySession // ignore: cast_nullable_to_non_nullable
as Session,upcomingSessions: null == upcomingSessions ? _self._upcomingSessions : upcomingSessions // ignore: cast_nullable_to_non_nullable
as List<Session>,pastSessions: null == pastSessions ? _self._pastSessions : pastSessions // ignore: cast_nullable_to_non_nullable
as List<Session>,
  ));
}

/// Create a copy of ScheduleResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SessionCopyWith<$Res> get todaySession {
  
  return $SessionCopyWith<$Res>(_self.todaySession, (value) {
    return _then(_self.copyWith(todaySession: value));
  });
}
}

// dart format on
