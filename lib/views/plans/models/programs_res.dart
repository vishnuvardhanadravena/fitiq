import 'package:freezed_annotation/freezed_annotation.dart';

part 'programs_res.freezed.dart';
part 'programs_res.g.dart';

@freezed
abstract class FitnessPlan with _$FitnessPlan {
  const FitnessPlan._();

  const factory FitnessPlan({
    required int id,
    required String title,
    required String subtitle,
    required int weeks,
    required List<String> features,
    required double price,
    String? badge,

    @JsonKey(
      name: 'is_featured',
      fromJson: boolFromJson, // ✅ FIXED
    )
    @Default(false)
    bool isFeatured,

    @JsonKey(name: 'image_url') required String imageUrl,
  }) = _FitnessPlan;

  factory FitnessPlan.fromJson(Map<String, dynamic> json) =>
      _$FitnessPlanFromJson(json);

  String get formattedPrice => '₹${price.toStringAsFixed(0)}';
}

bool boolFromJson(dynamic value) {
  print('RAW is_featured value: $value (${value.runtimeType})');

  if (value is bool) return value;
  if (value is int) return value == 1;
  if (value is String) return value.toLowerCase() == 'true';

  return false;
}
