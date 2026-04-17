import 'package:fitiq/views/payments/models/payment_transaction.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_state.freezed.dart';

@freezed
abstract class PaymentState with _$PaymentState {
  const PaymentState._(); // private constructor for computed getters

  const factory PaymentState({
    // ── loading / error flags ─────────────────
    @Default(false) bool isLoading,
    String? errorMessage,

    // ── data ──────────────────────────────────
    PaymentSummary? summary,
    @Default([]) List<PaymentTransaction> transactions,

    // ── filter ────────────────────────────────
    @Default(PaymentStatusFilter.all) PaymentStatusFilter filter,
  }) = _PaymentState;

  // ── Computed: filtered list ─────────────────
  List<PaymentTransaction> get filteredTransactions {
    if (filter == PaymentStatusFilter.all) return transactions;
    final PaymentStatus? mapped = switch (filter) {
      PaymentStatusFilter.success => PaymentStatus.success,
      PaymentStatusFilter.failed => PaymentStatus.failed,
      PaymentStatusFilter.pending => PaymentStatus.pending,
      PaymentStatusFilter.all => null,
    };
    return transactions.where((t) => t.status == mapped).toList();
  }
}

enum PaymentStatusFilter { all, success, failed, pending }