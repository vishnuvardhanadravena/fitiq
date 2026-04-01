// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'programs_res.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FitnessPlan {

 int get id; String get title; String get subtitle; int get weeks; List<String> get features; double get price; String? get badge;@JsonKey(name: 'is_featured', fromJson: boolFromJson) bool get isFeatured;@JsonKey(name: 'image_url') String get imageUrl;
/// Create a copy of FitnessPlan
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FitnessPlanCopyWith<FitnessPlan> get copyWith => _$FitnessPlanCopyWithImpl<FitnessPlan>(this as FitnessPlan, _$identity);

  /// Serializes this FitnessPlan to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FitnessPlan&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.subtitle, subtitle) || other.subtitle == subtitle)&&(identical(other.weeks, weeks) || other.weeks == weeks)&&const DeepCollectionEquality().equals(other.features, features)&&(identical(other.price, price) || other.price == price)&&(identical(other.badge, badge) || other.badge == badge)&&(identical(other.isFeatured, isFeatured) || other.isFeatured == isFeatured)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,subtitle,weeks,const DeepCollectionEquality().hash(features),price,badge,isFeatured,imageUrl);

@override
String toString() {
  return 'FitnessPlan(id: $id, title: $title, subtitle: $subtitle, weeks: $weeks, features: $features, price: $price, badge: $badge, isFeatured: $isFeatured, imageUrl: $imageUrl)';
}


}

/// @nodoc
abstract mixin class $FitnessPlanCopyWith<$Res>  {
  factory $FitnessPlanCopyWith(FitnessPlan value, $Res Function(FitnessPlan) _then) = _$FitnessPlanCopyWithImpl;
@useResult
$Res call({
 int id, String title, String subtitle, int weeks, List<String> features, double price, String? badge,@JsonKey(name: 'is_featured', fromJson: boolFromJson) bool isFeatured,@JsonKey(name: 'image_url') String imageUrl
});




}
/// @nodoc
class _$FitnessPlanCopyWithImpl<$Res>
    implements $FitnessPlanCopyWith<$Res> {
  _$FitnessPlanCopyWithImpl(this._self, this._then);

  final FitnessPlan _self;
  final $Res Function(FitnessPlan) _then;

/// Create a copy of FitnessPlan
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? subtitle = null,Object? weeks = null,Object? features = null,Object? price = null,Object? badge = freezed,Object? isFeatured = null,Object? imageUrl = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,subtitle: null == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as String,weeks: null == weeks ? _self.weeks : weeks // ignore: cast_nullable_to_non_nullable
as int,features: null == features ? _self.features : features // ignore: cast_nullable_to_non_nullable
as List<String>,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,badge: freezed == badge ? _self.badge : badge // ignore: cast_nullable_to_non_nullable
as String?,isFeatured: null == isFeatured ? _self.isFeatured : isFeatured // ignore: cast_nullable_to_non_nullable
as bool,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [FitnessPlan].
extension FitnessPlanPatterns on FitnessPlan {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FitnessPlan value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FitnessPlan() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FitnessPlan value)  $default,){
final _that = this;
switch (_that) {
case _FitnessPlan():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FitnessPlan value)?  $default,){
final _that = this;
switch (_that) {
case _FitnessPlan() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String title,  String subtitle,  int weeks,  List<String> features,  double price,  String? badge, @JsonKey(name: 'is_featured', fromJson: boolFromJson)  bool isFeatured, @JsonKey(name: 'image_url')  String imageUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FitnessPlan() when $default != null:
return $default(_that.id,_that.title,_that.subtitle,_that.weeks,_that.features,_that.price,_that.badge,_that.isFeatured,_that.imageUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String title,  String subtitle,  int weeks,  List<String> features,  double price,  String? badge, @JsonKey(name: 'is_featured', fromJson: boolFromJson)  bool isFeatured, @JsonKey(name: 'image_url')  String imageUrl)  $default,) {final _that = this;
switch (_that) {
case _FitnessPlan():
return $default(_that.id,_that.title,_that.subtitle,_that.weeks,_that.features,_that.price,_that.badge,_that.isFeatured,_that.imageUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String title,  String subtitle,  int weeks,  List<String> features,  double price,  String? badge, @JsonKey(name: 'is_featured', fromJson: boolFromJson)  bool isFeatured, @JsonKey(name: 'image_url')  String imageUrl)?  $default,) {final _that = this;
switch (_that) {
case _FitnessPlan() when $default != null:
return $default(_that.id,_that.title,_that.subtitle,_that.weeks,_that.features,_that.price,_that.badge,_that.isFeatured,_that.imageUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FitnessPlan extends FitnessPlan {
  const _FitnessPlan({required this.id, required this.title, required this.subtitle, required this.weeks, required final  List<String> features, required this.price, this.badge, @JsonKey(name: 'is_featured', fromJson: boolFromJson) this.isFeatured = false, @JsonKey(name: 'image_url') required this.imageUrl}): _features = features,super._();
  factory _FitnessPlan.fromJson(Map<String, dynamic> json) => _$FitnessPlanFromJson(json);

@override final  int id;
@override final  String title;
@override final  String subtitle;
@override final  int weeks;
 final  List<String> _features;
@override List<String> get features {
  if (_features is EqualUnmodifiableListView) return _features;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_features);
}

@override final  double price;
@override final  String? badge;
@override@JsonKey(name: 'is_featured', fromJson: boolFromJson) final  bool isFeatured;
@override@JsonKey(name: 'image_url') final  String imageUrl;

/// Create a copy of FitnessPlan
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FitnessPlanCopyWith<_FitnessPlan> get copyWith => __$FitnessPlanCopyWithImpl<_FitnessPlan>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FitnessPlanToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FitnessPlan&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.subtitle, subtitle) || other.subtitle == subtitle)&&(identical(other.weeks, weeks) || other.weeks == weeks)&&const DeepCollectionEquality().equals(other._features, _features)&&(identical(other.price, price) || other.price == price)&&(identical(other.badge, badge) || other.badge == badge)&&(identical(other.isFeatured, isFeatured) || other.isFeatured == isFeatured)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,subtitle,weeks,const DeepCollectionEquality().hash(_features),price,badge,isFeatured,imageUrl);

@override
String toString() {
  return 'FitnessPlan(id: $id, title: $title, subtitle: $subtitle, weeks: $weeks, features: $features, price: $price, badge: $badge, isFeatured: $isFeatured, imageUrl: $imageUrl)';
}


}

/// @nodoc
abstract mixin class _$FitnessPlanCopyWith<$Res> implements $FitnessPlanCopyWith<$Res> {
  factory _$FitnessPlanCopyWith(_FitnessPlan value, $Res Function(_FitnessPlan) _then) = __$FitnessPlanCopyWithImpl;
@override @useResult
$Res call({
 int id, String title, String subtitle, int weeks, List<String> features, double price, String? badge,@JsonKey(name: 'is_featured', fromJson: boolFromJson) bool isFeatured,@JsonKey(name: 'image_url') String imageUrl
});




}
/// @nodoc
class __$FitnessPlanCopyWithImpl<$Res>
    implements _$FitnessPlanCopyWith<$Res> {
  __$FitnessPlanCopyWithImpl(this._self, this._then);

  final _FitnessPlan _self;
  final $Res Function(_FitnessPlan) _then;

/// Create a copy of FitnessPlan
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? subtitle = null,Object? weeks = null,Object? features = null,Object? price = null,Object? badge = freezed,Object? isFeatured = null,Object? imageUrl = null,}) {
  return _then(_FitnessPlan(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,subtitle: null == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as String,weeks: null == weeks ? _self.weeks : weeks // ignore: cast_nullable_to_non_nullable
as int,features: null == features ? _self._features : features // ignore: cast_nullable_to_non_nullable
as List<String>,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,badge: freezed == badge ? _self.badge : badge // ignore: cast_nullable_to_non_nullable
as String?,isFeatured: null == isFeatured ? _self.isFeatured : isFeatured // ignore: cast_nullable_to_non_nullable
as bool,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
