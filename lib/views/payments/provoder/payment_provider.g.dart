// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// ─────────────────────────────────────────────
/// 🔹 SUMMARY PROVIDER
/// ─────────────────────────────────────────────

@ProviderFor(PaymentSummaryNotifier)
final paymentSummaryProvider = PaymentSummaryNotifierProvider._();

/// ─────────────────────────────────────────────
/// 🔹 SUMMARY PROVIDER
/// ─────────────────────────────────────────────
final class PaymentSummaryNotifierProvider
    extends
        $NotifierProvider<PaymentSummaryNotifier, AsyncState<PaymentSummary>> {
  /// ─────────────────────────────────────────────
  /// 🔹 SUMMARY PROVIDER
  /// ─────────────────────────────────────────────
  PaymentSummaryNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'paymentSummaryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$paymentSummaryNotifierHash();

  @$internal
  @override
  PaymentSummaryNotifier create() => PaymentSummaryNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncState<PaymentSummary> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncState<PaymentSummary>>(value),
    );
  }
}

String _$paymentSummaryNotifierHash() =>
    r'9873fd1e58f9679750a45963a94404db202c16bf';

/// ─────────────────────────────────────────────
/// 🔹 SUMMARY PROVIDER
/// ─────────────────────────────────────────────

abstract class _$PaymentSummaryNotifier
    extends $Notifier<AsyncState<PaymentSummary>> {
  AsyncState<PaymentSummary> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<AsyncState<PaymentSummary>, AsyncState<PaymentSummary>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncState<PaymentSummary>,
                AsyncState<PaymentSummary>
              >,
              AsyncState<PaymentSummary>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

/// ─────────────────────────────────────────────
/// 🔹 TRANSACTIONS PROVIDER
/// ─────────────────────────────────────────────

@ProviderFor(PaymentTransactionsNotifier)
final paymentTransactionsProvider = PaymentTransactionsNotifierProvider._();

/// ─────────────────────────────────────────────
/// 🔹 TRANSACTIONS PROVIDER
/// ─────────────────────────────────────────────
final class PaymentTransactionsNotifierProvider
    extends
        $NotifierProvider<
          PaymentTransactionsNotifier,
          AsyncState<List<PaymentTransaction>>
        > {
  /// ─────────────────────────────────────────────
  /// 🔹 TRANSACTIONS PROVIDER
  /// ─────────────────────────────────────────────
  PaymentTransactionsNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'paymentTransactionsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$paymentTransactionsNotifierHash();

  @$internal
  @override
  PaymentTransactionsNotifier create() => PaymentTransactionsNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncState<List<PaymentTransaction>> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride:
          $SyncValueProvider<AsyncState<List<PaymentTransaction>>>(value),
    );
  }
}

String _$paymentTransactionsNotifierHash() =>
    r'c1ea904487a00b931f58ceaf50505da8f1e5a8ba';

/// ─────────────────────────────────────────────
/// 🔹 TRANSACTIONS PROVIDER
/// ─────────────────────────────────────────────

abstract class _$PaymentTransactionsNotifier
    extends $Notifier<AsyncState<List<PaymentTransaction>>> {
  AsyncState<List<PaymentTransaction>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<
              AsyncState<List<PaymentTransaction>>,
              AsyncState<List<PaymentTransaction>>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncState<List<PaymentTransaction>>,
                AsyncState<List<PaymentTransaction>>
              >,
              AsyncState<List<PaymentTransaction>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

/// ─────────────────────────────────────────────
/// 🔹 FILTER PROVIDER
/// ─────────────────────────────────────────────

@ProviderFor(PaymentFilterNotifier)
final paymentFilterProvider = PaymentFilterNotifierProvider._();

/// ─────────────────────────────────────────────
/// 🔹 FILTER PROVIDER
/// ─────────────────────────────────────────────
final class PaymentFilterNotifierProvider
    extends $NotifierProvider<PaymentFilterNotifier, PaymentStatusFilter> {
  /// ─────────────────────────────────────────────
  /// 🔹 FILTER PROVIDER
  /// ─────────────────────────────────────────────
  PaymentFilterNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'paymentFilterProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$paymentFilterNotifierHash();

  @$internal
  @override
  PaymentFilterNotifier create() => PaymentFilterNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PaymentStatusFilter value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PaymentStatusFilter>(value),
    );
  }
}

String _$paymentFilterNotifierHash() =>
    r'cff3bc6c9588f4263d4408d9fe4323f404d90b08';

/// ─────────────────────────────────────────────
/// 🔹 FILTER PROVIDER
/// ─────────────────────────────────────────────

abstract class _$PaymentFilterNotifier extends $Notifier<PaymentStatusFilter> {
  PaymentStatusFilter build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<PaymentStatusFilter, PaymentStatusFilter>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<PaymentStatusFilter, PaymentStatusFilter>,
              PaymentStatusFilter,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

/// ─────────────────────────────────────────────
/// 🔹 DERIVED FILTERED LIST
/// ─────────────────────────────────────────────

@ProviderFor(filteredTransactions)
final filteredTransactionsProvider = FilteredTransactionsProvider._();

/// ─────────────────────────────────────────────
/// 🔹 DERIVED FILTERED LIST
/// ─────────────────────────────────────────────

final class FilteredTransactionsProvider
    extends
        $FunctionalProvider<
          List<PaymentTransaction>,
          List<PaymentTransaction>,
          List<PaymentTransaction>
        >
    with $Provider<List<PaymentTransaction>> {
  /// ─────────────────────────────────────────────
  /// 🔹 DERIVED FILTERED LIST
  /// ─────────────────────────────────────────────
  FilteredTransactionsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'filteredTransactionsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$filteredTransactionsHash();

  @$internal
  @override
  $ProviderElement<List<PaymentTransaction>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  List<PaymentTransaction> create(Ref ref) {
    return filteredTransactions(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<PaymentTransaction> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<PaymentTransaction>>(value),
    );
  }
}

String _$filteredTransactionsHash() =>
    r'68022e92ca9219333dec4d650f6f779f08800681';
