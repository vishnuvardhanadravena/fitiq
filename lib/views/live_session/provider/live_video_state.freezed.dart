// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'live_video_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LiveVideoState {

 LiveVideoConfig get config; List<ChatMessage> get messages; bool get isMuted; bool get isCameraOff; bool get isChatOpen;
/// Create a copy of LiveVideoState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LiveVideoStateCopyWith<LiveVideoState> get copyWith => _$LiveVideoStateCopyWithImpl<LiveVideoState>(this as LiveVideoState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LiveVideoState&&(identical(other.config, config) || other.config == config)&&const DeepCollectionEquality().equals(other.messages, messages)&&(identical(other.isMuted, isMuted) || other.isMuted == isMuted)&&(identical(other.isCameraOff, isCameraOff) || other.isCameraOff == isCameraOff)&&(identical(other.isChatOpen, isChatOpen) || other.isChatOpen == isChatOpen));
}


@override
int get hashCode => Object.hash(runtimeType,config,const DeepCollectionEquality().hash(messages),isMuted,isCameraOff,isChatOpen);

@override
String toString() {
  return 'LiveVideoState(config: $config, messages: $messages, isMuted: $isMuted, isCameraOff: $isCameraOff, isChatOpen: $isChatOpen)';
}


}

/// @nodoc
abstract mixin class $LiveVideoStateCopyWith<$Res>  {
  factory $LiveVideoStateCopyWith(LiveVideoState value, $Res Function(LiveVideoState) _then) = _$LiveVideoStateCopyWithImpl;
@useResult
$Res call({
 LiveVideoConfig config, List<ChatMessage> messages, bool isMuted, bool isCameraOff, bool isChatOpen
});


$LiveVideoConfigCopyWith<$Res> get config;

}
/// @nodoc
class _$LiveVideoStateCopyWithImpl<$Res>
    implements $LiveVideoStateCopyWith<$Res> {
  _$LiveVideoStateCopyWithImpl(this._self, this._then);

  final LiveVideoState _self;
  final $Res Function(LiveVideoState) _then;

/// Create a copy of LiveVideoState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? config = null,Object? messages = null,Object? isMuted = null,Object? isCameraOff = null,Object? isChatOpen = null,}) {
  return _then(_self.copyWith(
config: null == config ? _self.config : config // ignore: cast_nullable_to_non_nullable
as LiveVideoConfig,messages: null == messages ? _self.messages : messages // ignore: cast_nullable_to_non_nullable
as List<ChatMessage>,isMuted: null == isMuted ? _self.isMuted : isMuted // ignore: cast_nullable_to_non_nullable
as bool,isCameraOff: null == isCameraOff ? _self.isCameraOff : isCameraOff // ignore: cast_nullable_to_non_nullable
as bool,isChatOpen: null == isChatOpen ? _self.isChatOpen : isChatOpen // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of LiveVideoState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LiveVideoConfigCopyWith<$Res> get config {
  
  return $LiveVideoConfigCopyWith<$Res>(_self.config, (value) {
    return _then(_self.copyWith(config: value));
  });
}
}


/// Adds pattern-matching-related methods to [LiveVideoState].
extension LiveVideoStatePatterns on LiveVideoState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LiveVideoState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LiveVideoState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LiveVideoState value)  $default,){
final _that = this;
switch (_that) {
case _LiveVideoState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LiveVideoState value)?  $default,){
final _that = this;
switch (_that) {
case _LiveVideoState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( LiveVideoConfig config,  List<ChatMessage> messages,  bool isMuted,  bool isCameraOff,  bool isChatOpen)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LiveVideoState() when $default != null:
return $default(_that.config,_that.messages,_that.isMuted,_that.isCameraOff,_that.isChatOpen);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( LiveVideoConfig config,  List<ChatMessage> messages,  bool isMuted,  bool isCameraOff,  bool isChatOpen)  $default,) {final _that = this;
switch (_that) {
case _LiveVideoState():
return $default(_that.config,_that.messages,_that.isMuted,_that.isCameraOff,_that.isChatOpen);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( LiveVideoConfig config,  List<ChatMessage> messages,  bool isMuted,  bool isCameraOff,  bool isChatOpen)?  $default,) {final _that = this;
switch (_that) {
case _LiveVideoState() when $default != null:
return $default(_that.config,_that.messages,_that.isMuted,_that.isCameraOff,_that.isChatOpen);case _:
  return null;

}
}

}

/// @nodoc


class _LiveVideoState implements LiveVideoState {
  const _LiveVideoState({required this.config, final  List<ChatMessage> messages = const [], this.isMuted = false, this.isCameraOff = false, this.isChatOpen = false}): _messages = messages;
  

@override final  LiveVideoConfig config;
 final  List<ChatMessage> _messages;
@override@JsonKey() List<ChatMessage> get messages {
  if (_messages is EqualUnmodifiableListView) return _messages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_messages);
}

@override@JsonKey() final  bool isMuted;
@override@JsonKey() final  bool isCameraOff;
@override@JsonKey() final  bool isChatOpen;

/// Create a copy of LiveVideoState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LiveVideoStateCopyWith<_LiveVideoState> get copyWith => __$LiveVideoStateCopyWithImpl<_LiveVideoState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LiveVideoState&&(identical(other.config, config) || other.config == config)&&const DeepCollectionEquality().equals(other._messages, _messages)&&(identical(other.isMuted, isMuted) || other.isMuted == isMuted)&&(identical(other.isCameraOff, isCameraOff) || other.isCameraOff == isCameraOff)&&(identical(other.isChatOpen, isChatOpen) || other.isChatOpen == isChatOpen));
}


@override
int get hashCode => Object.hash(runtimeType,config,const DeepCollectionEquality().hash(_messages),isMuted,isCameraOff,isChatOpen);

@override
String toString() {
  return 'LiveVideoState(config: $config, messages: $messages, isMuted: $isMuted, isCameraOff: $isCameraOff, isChatOpen: $isChatOpen)';
}


}

/// @nodoc
abstract mixin class _$LiveVideoStateCopyWith<$Res> implements $LiveVideoStateCopyWith<$Res> {
  factory _$LiveVideoStateCopyWith(_LiveVideoState value, $Res Function(_LiveVideoState) _then) = __$LiveVideoStateCopyWithImpl;
@override @useResult
$Res call({
 LiveVideoConfig config, List<ChatMessage> messages, bool isMuted, bool isCameraOff, bool isChatOpen
});


@override $LiveVideoConfigCopyWith<$Res> get config;

}
/// @nodoc
class __$LiveVideoStateCopyWithImpl<$Res>
    implements _$LiveVideoStateCopyWith<$Res> {
  __$LiveVideoStateCopyWithImpl(this._self, this._then);

  final _LiveVideoState _self;
  final $Res Function(_LiveVideoState) _then;

/// Create a copy of LiveVideoState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? config = null,Object? messages = null,Object? isMuted = null,Object? isCameraOff = null,Object? isChatOpen = null,}) {
  return _then(_LiveVideoState(
config: null == config ? _self.config : config // ignore: cast_nullable_to_non_nullable
as LiveVideoConfig,messages: null == messages ? _self._messages : messages // ignore: cast_nullable_to_non_nullable
as List<ChatMessage>,isMuted: null == isMuted ? _self.isMuted : isMuted // ignore: cast_nullable_to_non_nullable
as bool,isCameraOff: null == isCameraOff ? _self.isCameraOff : isCameraOff // ignore: cast_nullable_to_non_nullable
as bool,isChatOpen: null == isChatOpen ? _self.isChatOpen : isChatOpen // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of LiveVideoState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LiveVideoConfigCopyWith<$Res> get config {
  
  return $LiveVideoConfigCopyWith<$Res>(_self.config, (value) {
    return _then(_self.copyWith(config: value));
  });
}
}

// dart format on
