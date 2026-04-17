// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PaymentTransaction _$PaymentTransactionFromJson(Map<String, dynamic> json) =>
    _PaymentTransaction(
      id: json['id'] as String,
      programName: json['program_name'] as String,
      date: json['date'] as String,
      method: json['method'] as String,
      amount: json['amount'] as String,
      status: $enumDecode(_$PaymentStatusEnumMap, json['status']),
      imageUrl: json['image_url'] as String?,
    );

Map<String, dynamic> _$PaymentTransactionToJson(_PaymentTransaction instance) =>
    <String, dynamic>{
      'id': instance.id,
      'program_name': instance.programName,
      'date': instance.date,
      'method': instance.method,
      'amount': instance.amount,
      'status': _$PaymentStatusEnumMap[instance.status]!,
      'image_url': instance.imageUrl,
    };

const _$PaymentStatusEnumMap = {
  PaymentStatus.success: 'success',
  PaymentStatus.failed: 'failed',
  PaymentStatus.pending: 'pending',
};

_PaymentSummary _$PaymentSummaryFromJson(Map<String, dynamic> json) =>
    _PaymentSummary(
      totalInvestment: json['total_investment'] as String,
      enrolledCount: json['enrolled_count'] as String,
      activeCount: (json['active_count'] as num).toInt(),
      completedCount: (json['completed_count'] as num).toInt(),
      lastPaidAmount: json['last_paid_amount'] as String,
    );

Map<String, dynamic> _$PaymentSummaryToJson(_PaymentSummary instance) =>
    <String, dynamic>{
      'total_investment': instance.totalInvestment,
      'enrolled_count': instance.enrolledCount,
      'active_count': instance.activeCount,
      'completed_count': instance.completedCount,
      'last_paid_amount': instance.lastPaidAmount,
    };
