// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fitness_plan_detail_res.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FitnessPlanDetail {

 int get id; String get title; String get subtitle; String get imageUrl; String? get badge; double get price;/// ⭐ rating section
 double get rating; int get reviewCount;/// 🧾 price note
 String get priceNote;/// 📊 stats
 List<PlanStat> get stats;/// ✅ inclusions
 List<String> get inclusions;/// 📦 phases
 List<ProgramPhase> get phases;
/// Create a copy of FitnessPlanDetail
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FitnessPlanDetailCopyWith<FitnessPlanDetail> get copyWith => _$FitnessPlanDetailCopyWithImpl<FitnessPlanDetail>(this as FitnessPlanDetail, _$identity);

  /// Serializes this FitnessPlanDetail to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FitnessPlanDetail&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.subtitle, subtitle) || other.subtitle == subtitle)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.badge, badge) || other.badge == badge)&&(identical(other.price, price) || other.price == price)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.reviewCount, reviewCount) || other.reviewCount == reviewCount)&&(identical(other.priceNote, priceNote) || other.priceNote == priceNote)&&const DeepCollectionEquality().equals(other.stats, stats)&&const DeepCollectionEquality().equals(other.inclusions, inclusions)&&const DeepCollectionEquality().equals(other.phases, phases));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,subtitle,imageUrl,badge,price,rating,reviewCount,priceNote,const DeepCollectionEquality().hash(stats),const DeepCollectionEquality().hash(inclusions),const DeepCollectionEquality().hash(phases));

@override
String toString() {
  return 'FitnessPlanDetail(id: $id, title: $title, subtitle: $subtitle, imageUrl: $imageUrl, badge: $badge, price: $price, rating: $rating, reviewCount: $reviewCount, priceNote: $priceNote, stats: $stats, inclusions: $inclusions, phases: $phases)';
}


}

/// @nodoc
abstract mixin class $FitnessPlanDetailCopyWith<$Res>  {
  factory $FitnessPlanDetailCopyWith(FitnessPlanDetail value, $Res Function(FitnessPlanDetail) _then) = _$FitnessPlanDetailCopyWithImpl;
@useResult
$Res call({
 int id, String title, String subtitle, String imageUrl, String? badge, double price, double rating, int reviewCount, String priceNote, List<PlanStat> stats, List<String> inclusions, List<ProgramPhase> phases
});




}
/// @nodoc
class _$FitnessPlanDetailCopyWithImpl<$Res>
    implements $FitnessPlanDetailCopyWith<$Res> {
  _$FitnessPlanDetailCopyWithImpl(this._self, this._then);

  final FitnessPlanDetail _self;
  final $Res Function(FitnessPlanDetail) _then;

/// Create a copy of FitnessPlanDetail
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? subtitle = null,Object? imageUrl = null,Object? badge = freezed,Object? price = null,Object? rating = null,Object? reviewCount = null,Object? priceNote = null,Object? stats = null,Object? inclusions = null,Object? phases = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,subtitle: null == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,badge: freezed == badge ? _self.badge : badge // ignore: cast_nullable_to_non_nullable
as String?,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,reviewCount: null == reviewCount ? _self.reviewCount : reviewCount // ignore: cast_nullable_to_non_nullable
as int,priceNote: null == priceNote ? _self.priceNote : priceNote // ignore: cast_nullable_to_non_nullable
as String,stats: null == stats ? _self.stats : stats // ignore: cast_nullable_to_non_nullable
as List<PlanStat>,inclusions: null == inclusions ? _self.inclusions : inclusions // ignore: cast_nullable_to_non_nullable
as List<String>,phases: null == phases ? _self.phases : phases // ignore: cast_nullable_to_non_nullable
as List<ProgramPhase>,
  ));
}

}


/// Adds pattern-matching-related methods to [FitnessPlanDetail].
extension FitnessPlanDetailPatterns on FitnessPlanDetail {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FitnessPlanDetail value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FitnessPlanDetail() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FitnessPlanDetail value)  $default,){
final _that = this;
switch (_that) {
case _FitnessPlanDetail():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FitnessPlanDetail value)?  $default,){
final _that = this;
switch (_that) {
case _FitnessPlanDetail() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String title,  String subtitle,  String imageUrl,  String? badge,  double price,  double rating,  int reviewCount,  String priceNote,  List<PlanStat> stats,  List<String> inclusions,  List<ProgramPhase> phases)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FitnessPlanDetail() when $default != null:
return $default(_that.id,_that.title,_that.subtitle,_that.imageUrl,_that.badge,_that.price,_that.rating,_that.reviewCount,_that.priceNote,_that.stats,_that.inclusions,_that.phases);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String title,  String subtitle,  String imageUrl,  String? badge,  double price,  double rating,  int reviewCount,  String priceNote,  List<PlanStat> stats,  List<String> inclusions,  List<ProgramPhase> phases)  $default,) {final _that = this;
switch (_that) {
case _FitnessPlanDetail():
return $default(_that.id,_that.title,_that.subtitle,_that.imageUrl,_that.badge,_that.price,_that.rating,_that.reviewCount,_that.priceNote,_that.stats,_that.inclusions,_that.phases);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String title,  String subtitle,  String imageUrl,  String? badge,  double price,  double rating,  int reviewCount,  String priceNote,  List<PlanStat> stats,  List<String> inclusions,  List<ProgramPhase> phases)?  $default,) {final _that = this;
switch (_that) {
case _FitnessPlanDetail() when $default != null:
return $default(_that.id,_that.title,_that.subtitle,_that.imageUrl,_that.badge,_that.price,_that.rating,_that.reviewCount,_that.priceNote,_that.stats,_that.inclusions,_that.phases);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FitnessPlanDetail extends FitnessPlanDetail {
  const _FitnessPlanDetail({required this.id, required this.title, required this.subtitle, required this.imageUrl, this.badge, required this.price, this.rating = 0.0, this.reviewCount = 0, this.priceNote = '', final  List<PlanStat> stats = const [], final  List<String> inclusions = const [], final  List<ProgramPhase> phases = const []}): _stats = stats,_inclusions = inclusions,_phases = phases,super._();
  factory _FitnessPlanDetail.fromJson(Map<String, dynamic> json) => _$FitnessPlanDetailFromJson(json);

@override final  int id;
@override final  String title;
@override final  String subtitle;
@override final  String imageUrl;
@override final  String? badge;
@override final  double price;
/// ⭐ rating section
@override@JsonKey() final  double rating;
@override@JsonKey() final  int reviewCount;
/// 🧾 price note
@override@JsonKey() final  String priceNote;
/// 📊 stats
 final  List<PlanStat> _stats;
/// 📊 stats
@override@JsonKey() List<PlanStat> get stats {
  if (_stats is EqualUnmodifiableListView) return _stats;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_stats);
}

/// ✅ inclusions
 final  List<String> _inclusions;
/// ✅ inclusions
@override@JsonKey() List<String> get inclusions {
  if (_inclusions is EqualUnmodifiableListView) return _inclusions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_inclusions);
}

/// 📦 phases
 final  List<ProgramPhase> _phases;
/// 📦 phases
@override@JsonKey() List<ProgramPhase> get phases {
  if (_phases is EqualUnmodifiableListView) return _phases;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_phases);
}


/// Create a copy of FitnessPlanDetail
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FitnessPlanDetailCopyWith<_FitnessPlanDetail> get copyWith => __$FitnessPlanDetailCopyWithImpl<_FitnessPlanDetail>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FitnessPlanDetailToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FitnessPlanDetail&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.subtitle, subtitle) || other.subtitle == subtitle)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.badge, badge) || other.badge == badge)&&(identical(other.price, price) || other.price == price)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.reviewCount, reviewCount) || other.reviewCount == reviewCount)&&(identical(other.priceNote, priceNote) || other.priceNote == priceNote)&&const DeepCollectionEquality().equals(other._stats, _stats)&&const DeepCollectionEquality().equals(other._inclusions, _inclusions)&&const DeepCollectionEquality().equals(other._phases, _phases));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,subtitle,imageUrl,badge,price,rating,reviewCount,priceNote,const DeepCollectionEquality().hash(_stats),const DeepCollectionEquality().hash(_inclusions),const DeepCollectionEquality().hash(_phases));

@override
String toString() {
  return 'FitnessPlanDetail(id: $id, title: $title, subtitle: $subtitle, imageUrl: $imageUrl, badge: $badge, price: $price, rating: $rating, reviewCount: $reviewCount, priceNote: $priceNote, stats: $stats, inclusions: $inclusions, phases: $phases)';
}


}

/// @nodoc
abstract mixin class _$FitnessPlanDetailCopyWith<$Res> implements $FitnessPlanDetailCopyWith<$Res> {
  factory _$FitnessPlanDetailCopyWith(_FitnessPlanDetail value, $Res Function(_FitnessPlanDetail) _then) = __$FitnessPlanDetailCopyWithImpl;
@override @useResult
$Res call({
 int id, String title, String subtitle, String imageUrl, String? badge, double price, double rating, int reviewCount, String priceNote, List<PlanStat> stats, List<String> inclusions, List<ProgramPhase> phases
});




}
/// @nodoc
class __$FitnessPlanDetailCopyWithImpl<$Res>
    implements _$FitnessPlanDetailCopyWith<$Res> {
  __$FitnessPlanDetailCopyWithImpl(this._self, this._then);

  final _FitnessPlanDetail _self;
  final $Res Function(_FitnessPlanDetail) _then;

/// Create a copy of FitnessPlanDetail
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? subtitle = null,Object? imageUrl = null,Object? badge = freezed,Object? price = null,Object? rating = null,Object? reviewCount = null,Object? priceNote = null,Object? stats = null,Object? inclusions = null,Object? phases = null,}) {
  return _then(_FitnessPlanDetail(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,subtitle: null == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,badge: freezed == badge ? _self.badge : badge // ignore: cast_nullable_to_non_nullable
as String?,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,reviewCount: null == reviewCount ? _self.reviewCount : reviewCount // ignore: cast_nullable_to_non_nullable
as int,priceNote: null == priceNote ? _self.priceNote : priceNote // ignore: cast_nullable_to_non_nullable
as String,stats: null == stats ? _self._stats : stats // ignore: cast_nullable_to_non_nullable
as List<PlanStat>,inclusions: null == inclusions ? _self._inclusions : inclusions // ignore: cast_nullable_to_non_nullable
as List<String>,phases: null == phases ? _self._phases : phases // ignore: cast_nullable_to_non_nullable
as List<ProgramPhase>,
  ));
}


}


/// @nodoc
mixin _$PlanStat {

 String get icon;// 🔥 store icon as string from API
 String get label;
/// Create a copy of PlanStat
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlanStatCopyWith<PlanStat> get copyWith => _$PlanStatCopyWithImpl<PlanStat>(this as PlanStat, _$identity);

  /// Serializes this PlanStat to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlanStat&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.label, label) || other.label == label));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,icon,label);

@override
String toString() {
  return 'PlanStat(icon: $icon, label: $label)';
}


}

/// @nodoc
abstract mixin class $PlanStatCopyWith<$Res>  {
  factory $PlanStatCopyWith(PlanStat value, $Res Function(PlanStat) _then) = _$PlanStatCopyWithImpl;
@useResult
$Res call({
 String icon, String label
});




}
/// @nodoc
class _$PlanStatCopyWithImpl<$Res>
    implements $PlanStatCopyWith<$Res> {
  _$PlanStatCopyWithImpl(this._self, this._then);

  final PlanStat _self;
  final $Res Function(PlanStat) _then;

/// Create a copy of PlanStat
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? icon = null,Object? label = null,}) {
  return _then(_self.copyWith(
icon: null == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [PlanStat].
extension PlanStatPatterns on PlanStat {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PlanStat value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PlanStat() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PlanStat value)  $default,){
final _that = this;
switch (_that) {
case _PlanStat():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PlanStat value)?  $default,){
final _that = this;
switch (_that) {
case _PlanStat() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String icon,  String label)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PlanStat() when $default != null:
return $default(_that.icon,_that.label);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String icon,  String label)  $default,) {final _that = this;
switch (_that) {
case _PlanStat():
return $default(_that.icon,_that.label);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String icon,  String label)?  $default,) {final _that = this;
switch (_that) {
case _PlanStat() when $default != null:
return $default(_that.icon,_that.label);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PlanStat implements PlanStat {
  const _PlanStat({required this.icon, required this.label});
  factory _PlanStat.fromJson(Map<String, dynamic> json) => _$PlanStatFromJson(json);

@override final  String icon;
// 🔥 store icon as string from API
@override final  String label;

/// Create a copy of PlanStat
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlanStatCopyWith<_PlanStat> get copyWith => __$PlanStatCopyWithImpl<_PlanStat>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PlanStatToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlanStat&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.label, label) || other.label == label));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,icon,label);

@override
String toString() {
  return 'PlanStat(icon: $icon, label: $label)';
}


}

/// @nodoc
abstract mixin class _$PlanStatCopyWith<$Res> implements $PlanStatCopyWith<$Res> {
  factory _$PlanStatCopyWith(_PlanStat value, $Res Function(_PlanStat) _then) = __$PlanStatCopyWithImpl;
@override @useResult
$Res call({
 String icon, String label
});




}
/// @nodoc
class __$PlanStatCopyWithImpl<$Res>
    implements _$PlanStatCopyWith<$Res> {
  __$PlanStatCopyWithImpl(this._self, this._then);

  final _PlanStat _self;
  final $Res Function(_PlanStat) _then;

/// Create a copy of PlanStat
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? icon = null,Object? label = null,}) {
  return _then(_PlanStat(
icon: null == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$ProgramPhase {

 String get weekRange; String get title; String get description; String get tagColor;
/// Create a copy of ProgramPhase
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProgramPhaseCopyWith<ProgramPhase> get copyWith => _$ProgramPhaseCopyWithImpl<ProgramPhase>(this as ProgramPhase, _$identity);

  /// Serializes this ProgramPhase to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProgramPhase&&(identical(other.weekRange, weekRange) || other.weekRange == weekRange)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.tagColor, tagColor) || other.tagColor == tagColor));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,weekRange,title,description,tagColor);

@override
String toString() {
  return 'ProgramPhase(weekRange: $weekRange, title: $title, description: $description, tagColor: $tagColor)';
}


}

/// @nodoc
abstract mixin class $ProgramPhaseCopyWith<$Res>  {
  factory $ProgramPhaseCopyWith(ProgramPhase value, $Res Function(ProgramPhase) _then) = _$ProgramPhaseCopyWithImpl;
@useResult
$Res call({
 String weekRange, String title, String description, String tagColor
});




}
/// @nodoc
class _$ProgramPhaseCopyWithImpl<$Res>
    implements $ProgramPhaseCopyWith<$Res> {
  _$ProgramPhaseCopyWithImpl(this._self, this._then);

  final ProgramPhase _self;
  final $Res Function(ProgramPhase) _then;

/// Create a copy of ProgramPhase
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? weekRange = null,Object? title = null,Object? description = null,Object? tagColor = null,}) {
  return _then(_self.copyWith(
weekRange: null == weekRange ? _self.weekRange : weekRange // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,tagColor: null == tagColor ? _self.tagColor : tagColor // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ProgramPhase].
extension ProgramPhasePatterns on ProgramPhase {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProgramPhase value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProgramPhase() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProgramPhase value)  $default,){
final _that = this;
switch (_that) {
case _ProgramPhase():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProgramPhase value)?  $default,){
final _that = this;
switch (_that) {
case _ProgramPhase() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String weekRange,  String title,  String description,  String tagColor)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProgramPhase() when $default != null:
return $default(_that.weekRange,_that.title,_that.description,_that.tagColor);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String weekRange,  String title,  String description,  String tagColor)  $default,) {final _that = this;
switch (_that) {
case _ProgramPhase():
return $default(_that.weekRange,_that.title,_that.description,_that.tagColor);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String weekRange,  String title,  String description,  String tagColor)?  $default,) {final _that = this;
switch (_that) {
case _ProgramPhase() when $default != null:
return $default(_that.weekRange,_that.title,_that.description,_that.tagColor);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProgramPhase implements ProgramPhase {
  const _ProgramPhase({required this.weekRange, required this.title, required this.description, this.tagColor = '#2196F3'});
  factory _ProgramPhase.fromJson(Map<String, dynamic> json) => _$ProgramPhaseFromJson(json);

@override final  String weekRange;
@override final  String title;
@override final  String description;
@override@JsonKey() final  String tagColor;

/// Create a copy of ProgramPhase
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProgramPhaseCopyWith<_ProgramPhase> get copyWith => __$ProgramPhaseCopyWithImpl<_ProgramPhase>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProgramPhaseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProgramPhase&&(identical(other.weekRange, weekRange) || other.weekRange == weekRange)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.tagColor, tagColor) || other.tagColor == tagColor));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,weekRange,title,description,tagColor);

@override
String toString() {
  return 'ProgramPhase(weekRange: $weekRange, title: $title, description: $description, tagColor: $tagColor)';
}


}

/// @nodoc
abstract mixin class _$ProgramPhaseCopyWith<$Res> implements $ProgramPhaseCopyWith<$Res> {
  factory _$ProgramPhaseCopyWith(_ProgramPhase value, $Res Function(_ProgramPhase) _then) = __$ProgramPhaseCopyWithImpl;
@override @useResult
$Res call({
 String weekRange, String title, String description, String tagColor
});




}
/// @nodoc
class __$ProgramPhaseCopyWithImpl<$Res>
    implements _$ProgramPhaseCopyWith<$Res> {
  __$ProgramPhaseCopyWithImpl(this._self, this._then);

  final _ProgramPhase _self;
  final $Res Function(_ProgramPhase) _then;

/// Create a copy of ProgramPhase
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? weekRange = null,Object? title = null,Object? description = null,Object? tagColor = null,}) {
  return _then(_ProgramPhase(
weekRange: null == weekRange ? _self.weekRange : weekRange // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,tagColor: null == tagColor ? _self.tagColor : tagColor // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
