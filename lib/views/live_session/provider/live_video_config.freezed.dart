// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'live_video_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LiveVideoConfig {

 String get title;@JsonKey(name: 'host_name') String get hostName;@JsonKey(name: 'video_url') String? get videoUrl;@JsonKey(name: 'thumbnail_url') String? get thumbnailUrl; int get viewerCount; Duration get currentPosition; Duration get totalDuration; bool get isLive;
/// Create a copy of LiveVideoConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LiveVideoConfigCopyWith<LiveVideoConfig> get copyWith => _$LiveVideoConfigCopyWithImpl<LiveVideoConfig>(this as LiveVideoConfig, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LiveVideoConfig&&(identical(other.title, title) || other.title == title)&&(identical(other.hostName, hostName) || other.hostName == hostName)&&(identical(other.videoUrl, videoUrl) || other.videoUrl == videoUrl)&&(identical(other.thumbnailUrl, thumbnailUrl) || other.thumbnailUrl == thumbnailUrl)&&(identical(other.viewerCount, viewerCount) || other.viewerCount == viewerCount)&&(identical(other.currentPosition, currentPosition) || other.currentPosition == currentPosition)&&(identical(other.totalDuration, totalDuration) || other.totalDuration == totalDuration)&&(identical(other.isLive, isLive) || other.isLive == isLive));
}


@override
int get hashCode => Object.hash(runtimeType,title,hostName,videoUrl,thumbnailUrl,viewerCount,currentPosition,totalDuration,isLive);

@override
String toString() {
  return 'LiveVideoConfig(title: $title, hostName: $hostName, videoUrl: $videoUrl, thumbnailUrl: $thumbnailUrl, viewerCount: $viewerCount, currentPosition: $currentPosition, totalDuration: $totalDuration, isLive: $isLive)';
}


}

/// @nodoc
abstract mixin class $LiveVideoConfigCopyWith<$Res>  {
  factory $LiveVideoConfigCopyWith(LiveVideoConfig value, $Res Function(LiveVideoConfig) _then) = _$LiveVideoConfigCopyWithImpl;
@useResult
$Res call({
 String title,@JsonKey(name: 'host_name') String hostName,@JsonKey(name: 'video_url') String? videoUrl,@JsonKey(name: 'thumbnail_url') String? thumbnailUrl, int viewerCount, Duration currentPosition, Duration totalDuration, bool isLive
});




}
/// @nodoc
class _$LiveVideoConfigCopyWithImpl<$Res>
    implements $LiveVideoConfigCopyWith<$Res> {
  _$LiveVideoConfigCopyWithImpl(this._self, this._then);

  final LiveVideoConfig _self;
  final $Res Function(LiveVideoConfig) _then;

/// Create a copy of LiveVideoConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? hostName = null,Object? videoUrl = freezed,Object? thumbnailUrl = freezed,Object? viewerCount = null,Object? currentPosition = null,Object? totalDuration = null,Object? isLive = null,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,hostName: null == hostName ? _self.hostName : hostName // ignore: cast_nullable_to_non_nullable
as String,videoUrl: freezed == videoUrl ? _self.videoUrl : videoUrl // ignore: cast_nullable_to_non_nullable
as String?,thumbnailUrl: freezed == thumbnailUrl ? _self.thumbnailUrl : thumbnailUrl // ignore: cast_nullable_to_non_nullable
as String?,viewerCount: null == viewerCount ? _self.viewerCount : viewerCount // ignore: cast_nullable_to_non_nullable
as int,currentPosition: null == currentPosition ? _self.currentPosition : currentPosition // ignore: cast_nullable_to_non_nullable
as Duration,totalDuration: null == totalDuration ? _self.totalDuration : totalDuration // ignore: cast_nullable_to_non_nullable
as Duration,isLive: null == isLive ? _self.isLive : isLive // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [LiveVideoConfig].
extension LiveVideoConfigPatterns on LiveVideoConfig {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LiveVideoConfig value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LiveVideoConfig() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LiveVideoConfig value)  $default,){
final _that = this;
switch (_that) {
case _LiveVideoConfig():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LiveVideoConfig value)?  $default,){
final _that = this;
switch (_that) {
case _LiveVideoConfig() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String title, @JsonKey(name: 'host_name')  String hostName, @JsonKey(name: 'video_url')  String? videoUrl, @JsonKey(name: 'thumbnail_url')  String? thumbnailUrl,  int viewerCount,  Duration currentPosition,  Duration totalDuration,  bool isLive)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LiveVideoConfig() when $default != null:
return $default(_that.title,_that.hostName,_that.videoUrl,_that.thumbnailUrl,_that.viewerCount,_that.currentPosition,_that.totalDuration,_that.isLive);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String title, @JsonKey(name: 'host_name')  String hostName, @JsonKey(name: 'video_url')  String? videoUrl, @JsonKey(name: 'thumbnail_url')  String? thumbnailUrl,  int viewerCount,  Duration currentPosition,  Duration totalDuration,  bool isLive)  $default,) {final _that = this;
switch (_that) {
case _LiveVideoConfig():
return $default(_that.title,_that.hostName,_that.videoUrl,_that.thumbnailUrl,_that.viewerCount,_that.currentPosition,_that.totalDuration,_that.isLive);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String title, @JsonKey(name: 'host_name')  String hostName, @JsonKey(name: 'video_url')  String? videoUrl, @JsonKey(name: 'thumbnail_url')  String? thumbnailUrl,  int viewerCount,  Duration currentPosition,  Duration totalDuration,  bool isLive)?  $default,) {final _that = this;
switch (_that) {
case _LiveVideoConfig() when $default != null:
return $default(_that.title,_that.hostName,_that.videoUrl,_that.thumbnailUrl,_that.viewerCount,_that.currentPosition,_that.totalDuration,_that.isLive);case _:
  return null;

}
}

}

/// @nodoc


class _LiveVideoConfig implements LiveVideoConfig {
  const _LiveVideoConfig({required this.title, @JsonKey(name: 'host_name') required this.hostName, @JsonKey(name: 'video_url') this.videoUrl, @JsonKey(name: 'thumbnail_url') this.thumbnailUrl, this.viewerCount = 0, this.currentPosition = Duration.zero, this.totalDuration = Duration.zero, this.isLive = true});
  

@override final  String title;
@override@JsonKey(name: 'host_name') final  String hostName;
@override@JsonKey(name: 'video_url') final  String? videoUrl;
@override@JsonKey(name: 'thumbnail_url') final  String? thumbnailUrl;
@override@JsonKey() final  int viewerCount;
@override@JsonKey() final  Duration currentPosition;
@override@JsonKey() final  Duration totalDuration;
@override@JsonKey() final  bool isLive;

/// Create a copy of LiveVideoConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LiveVideoConfigCopyWith<_LiveVideoConfig> get copyWith => __$LiveVideoConfigCopyWithImpl<_LiveVideoConfig>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LiveVideoConfig&&(identical(other.title, title) || other.title == title)&&(identical(other.hostName, hostName) || other.hostName == hostName)&&(identical(other.videoUrl, videoUrl) || other.videoUrl == videoUrl)&&(identical(other.thumbnailUrl, thumbnailUrl) || other.thumbnailUrl == thumbnailUrl)&&(identical(other.viewerCount, viewerCount) || other.viewerCount == viewerCount)&&(identical(other.currentPosition, currentPosition) || other.currentPosition == currentPosition)&&(identical(other.totalDuration, totalDuration) || other.totalDuration == totalDuration)&&(identical(other.isLive, isLive) || other.isLive == isLive));
}


@override
int get hashCode => Object.hash(runtimeType,title,hostName,videoUrl,thumbnailUrl,viewerCount,currentPosition,totalDuration,isLive);

@override
String toString() {
  return 'LiveVideoConfig(title: $title, hostName: $hostName, videoUrl: $videoUrl, thumbnailUrl: $thumbnailUrl, viewerCount: $viewerCount, currentPosition: $currentPosition, totalDuration: $totalDuration, isLive: $isLive)';
}


}

/// @nodoc
abstract mixin class _$LiveVideoConfigCopyWith<$Res> implements $LiveVideoConfigCopyWith<$Res> {
  factory _$LiveVideoConfigCopyWith(_LiveVideoConfig value, $Res Function(_LiveVideoConfig) _then) = __$LiveVideoConfigCopyWithImpl;
@override @useResult
$Res call({
 String title,@JsonKey(name: 'host_name') String hostName,@JsonKey(name: 'video_url') String? videoUrl,@JsonKey(name: 'thumbnail_url') String? thumbnailUrl, int viewerCount, Duration currentPosition, Duration totalDuration, bool isLive
});




}
/// @nodoc
class __$LiveVideoConfigCopyWithImpl<$Res>
    implements _$LiveVideoConfigCopyWith<$Res> {
  __$LiveVideoConfigCopyWithImpl(this._self, this._then);

  final _LiveVideoConfig _self;
  final $Res Function(_LiveVideoConfig) _then;

/// Create a copy of LiveVideoConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? hostName = null,Object? videoUrl = freezed,Object? thumbnailUrl = freezed,Object? viewerCount = null,Object? currentPosition = null,Object? totalDuration = null,Object? isLive = null,}) {
  return _then(_LiveVideoConfig(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,hostName: null == hostName ? _self.hostName : hostName // ignore: cast_nullable_to_non_nullable
as String,videoUrl: freezed == videoUrl ? _self.videoUrl : videoUrl // ignore: cast_nullable_to_non_nullable
as String?,thumbnailUrl: freezed == thumbnailUrl ? _self.thumbnailUrl : thumbnailUrl // ignore: cast_nullable_to_non_nullable
as String?,viewerCount: null == viewerCount ? _self.viewerCount : viewerCount // ignore: cast_nullable_to_non_nullable
as int,currentPosition: null == currentPosition ? _self.currentPosition : currentPosition // ignore: cast_nullable_to_non_nullable
as Duration,totalDuration: null == totalDuration ? _self.totalDuration : totalDuration // ignore: cast_nullable_to_non_nullable
as Duration,isLive: null == isLive ? _self.isLive : isLive // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
