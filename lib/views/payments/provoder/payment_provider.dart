import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:fitiq/core/utils/async_state.dart';
import 'package:fitiq/views/payments/models/payment_transaction.dart';

part 'payment_provider.g.dart';

/// ─────────────────────────────────────────────
/// 🔹 SUMMARY PROVIDER
/// ─────────────────────────────────────────────
@riverpod
class PaymentSummaryNotifier extends _$PaymentSummaryNotifier {
  @override
  AsyncState<PaymentSummary> build() {
    Future.microtask(fetch);
    return const AsyncState();
  }

  Future<void> fetch() async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      await Future.delayed(const Duration(milliseconds: 800));

      const data = PaymentSummary(
        totalInvestment: '₹14,499',
        enrolledCount: '3',
        activeCount: 2,
        completedCount: 1,
        lastPaidAmount: '₹4,499',
      );

      state = state.copyWith(isLoading: false, data: data);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  void retry() => fetch();
}

/// ─────────────────────────────────────────────
/// 🔹 TRANSACTIONS PROVIDER
/// ─────────────────────────────────────────────
@riverpod
class PaymentTransactionsNotifier extends _$PaymentTransactionsNotifier {
  @override
  AsyncState<List<PaymentTransaction>> build() {
    Future.microtask(fetch);
    return const AsyncState();
  }

  Future<void> fetch() async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      await Future.delayed(const Duration(milliseconds: 800));

      final data = <PaymentTransaction>[
        PaymentTransaction(
          id: 'tx_001',
          programName: '90 Days Total Transformation',
          date: 'Jul 12, 2025',
          method: 'UPI • Google Pay',
          amount: '₹4,499',
          status: PaymentStatus.success,
          imageUrl:
              'https://images.unsplash.com/photo-1571019613454-1cb2f99b2d8b?w=200',
        ),
        PaymentTransaction(
          id: 'tx_002',
          programName: '90 Days Total Transformation',
          date: 'Jul 12, 2025',
          method: 'UPI • Google Pay',
          amount: '₹4,499',
          status: PaymentStatus.failed,
        ),
        PaymentTransaction(
          id: 'tx_003',
          programName: '90 Days Total Transformation',
          date: 'Jul 12, 2025',
          method: 'UPI • Google Pay',
          amount: '₹4,499',
          status: PaymentStatus.pending,
        ),
      ];

      state = state.copyWith(isLoading: false, data: data);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  void retry() => fetch();
}

/// ─────────────────────────────────────────────
/// 🔹 FILTER PROVIDER
/// ─────────────────────────────────────────────
@riverpod
class PaymentFilterNotifier extends _$PaymentFilterNotifier {
  @override
  PaymentStatusFilter build() => PaymentStatusFilter.all;

  void setFilter(PaymentStatusFilter filter) => state = filter;
}

/// ─────────────────────────────────────────────
/// 🔹 DERIVED FILTERED LIST
/// ─────────────────────────────────────────────
@riverpod
List<PaymentTransaction> filteredTransactions(Ref ref) {
  final txState = ref.watch(paymentTransactionsProvider);
  final filter = ref.watch(paymentFilterProvider);

  final txs = txState.data ?? [];

  if (filter == PaymentStatusFilter.all) return txs;

  final mapped = switch (filter) {
    PaymentStatusFilter.success => PaymentStatus.success,
    PaymentStatusFilter.failed => PaymentStatus.failed,
    PaymentStatusFilter.pending => PaymentStatus.pending,
    PaymentStatusFilter.all => null,
  };

  return txs.where((t) => t.status == mapped).toList();
}

/// ─────────────────────────────────────────────
/// 🔹 FILTER ENUM
/// ─────────────────────────────────────────────
enum PaymentStatusFilter { all, success, failed, pending }
