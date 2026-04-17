import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_transaction.freezed.dart';
part 'payment_transaction.g.dart';

/// ─────────────────────────────────────────────
/// PaymentStatus — enum with custom JSON values
/// ─────────────────────────────────────────────
enum PaymentStatus {
  @JsonValue('success')
  success,
  @JsonValue('failed')
  failed,
  @JsonValue('pending')
  pending,
}

/// ─────────────────────────────────────────────
/// PaymentTransaction — immutable model
/// ─────────────────────────────────────────────
@freezed
abstract class PaymentTransaction with _$PaymentTransaction {
  const factory PaymentTransaction({
    required String id,
    @JsonKey(name: 'program_name') required String programName,
    required String date,
    required String method,
    required String amount,
    required PaymentStatus status,
    @JsonKey(name: 'image_url') String? imageUrl,
  }) = _PaymentTransaction;

  factory PaymentTransaction.fromJson(Map<String, dynamic> json) =>
      _$PaymentTransactionFromJson(json);
}

/// ─────────────────────────────────────────────
/// PaymentSummary — for header card
/// ─────────────────────────────────────────────
@freezed
abstract class PaymentSummary with _$PaymentSummary {
  const factory PaymentSummary({
    @JsonKey(name: 'total_investment') required String totalInvestment,
    @JsonKey(name: 'enrolled_count') required String enrolledCount,
    @JsonKey(name: 'active_count') required int activeCount,
    @JsonKey(name: 'completed_count') required int completedCount,
    @JsonKey(name: 'last_paid_amount') required String lastPaidAmount,
  }) = _PaymentSummary;

  factory PaymentSummary.fromJson(Map<String, dynamic> json) =>
      _$PaymentSummaryFromJson(json);
}