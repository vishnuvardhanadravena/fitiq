import 'package:freezed_annotation/freezed_annotation.dart';

part 'live_video_config.freezed.dart';

// ─────────────────────────────────────────────
// LiveVideoConfig — immutable, Freezed
// ─────────────────────────────────────────────

@freezed
abstract class LiveVideoConfig with _$LiveVideoConfig {
  const factory LiveVideoConfig({
    required String title,
    @JsonKey(name: 'host_name') required String hostName,
    @JsonKey(name: 'video_url') String? videoUrl,
    @JsonKey(name: 'thumbnail_url') String? thumbnailUrl,
    @Default(0) int viewerCount,
    @Default(Duration.zero) Duration currentPosition,
    @Default(Duration.zero) Duration totalDuration,
    @Default(true) bool isLive,
  }) = _LiveVideoConfig;
}