// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'programs_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FitnessPlan _$FitnessPlanFromJson(Map<String, dynamic> json) => _FitnessPlan(
  id: (json['id'] as num).toInt(),
  title: json['title'] as String,
  subtitle: json['subtitle'] as String,
  weeks: (json['weeks'] as num).toInt(),
  features: (json['features'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  price: (json['price'] as num).toDouble(),
  badge: json['badge'] as String?,
  isFeatured: json['is_featured'] == null
      ? false
      : boolFromJson(json['is_featured']),
  imageUrl: json['image_url'] as String,
);

Map<String, dynamic> _$FitnessPlanToJson(_FitnessPlan instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'subtitle': instance.subtitle,
      'weeks': instance.weeks,
      'features': instance.features,
      'price': instance.price,
      'badge': instance.badge,
      'is_featured': instance.isFeatured,
      'image_url': instance.imageUrl,
    };
