// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fitness_plan_detail_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FitnessPlanDetail _$FitnessPlanDetailFromJson(Map<String, dynamic> json) =>
    _FitnessPlanDetail(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      subtitle: json['subtitle'] as String,
      imageUrl: json['imageUrl'] as String,
      badge: json['badge'] as String?,
      price: (json['price'] as num).toDouble(),
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      reviewCount: (json['reviewCount'] as num?)?.toInt() ?? 0,
      priceNote: json['priceNote'] as String? ?? '',
      stats:
          (json['stats'] as List<dynamic>?)
              ?.map((e) => PlanStat.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      inclusions:
          (json['inclusions'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      phases:
          (json['phases'] as List<dynamic>?)
              ?.map((e) => ProgramPhase.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$FitnessPlanDetailToJson(_FitnessPlanDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'subtitle': instance.subtitle,
      'imageUrl': instance.imageUrl,
      'badge': instance.badge,
      'price': instance.price,
      'rating': instance.rating,
      'reviewCount': instance.reviewCount,
      'priceNote': instance.priceNote,
      'stats': instance.stats,
      'inclusions': instance.inclusions,
      'phases': instance.phases,
    };

_PlanStat _$PlanStatFromJson(Map<String, dynamic> json) =>
    _PlanStat(icon: json['icon'] as String, label: json['label'] as String);

Map<String, dynamic> _$PlanStatToJson(_PlanStat instance) => <String, dynamic>{
  'icon': instance.icon,
  'label': instance.label,
};

_ProgramPhase _$ProgramPhaseFromJson(Map<String, dynamic> json) =>
    _ProgramPhase(
      weekRange: json['weekRange'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      tagColor: json['tagColor'] as String? ?? '#2196F3',
    );

Map<String, dynamic> _$ProgramPhaseToJson(_ProgramPhase instance) =>
    <String, dynamic>{
      'weekRange': instance.weekRange,
      'title': instance.title,
      'description': instance.description,
      'tagColor': instance.tagColor,
    };
