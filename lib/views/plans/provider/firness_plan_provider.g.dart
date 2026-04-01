// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'firness_plan_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(fitnessPlanRepository)
final fitnessPlanRepositoryProvider = FitnessPlanRepositoryProvider._();

final class FitnessPlanRepositoryProvider
    extends
        $FunctionalProvider<
          FitnessPlanRepository,
          FitnessPlanRepository,
          FitnessPlanRepository
        >
    with $Provider<FitnessPlanRepository> {
  FitnessPlanRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'fitnessPlanRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$fitnessPlanRepositoryHash();

  @$internal
  @override
  $ProviderElement<FitnessPlanRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  FitnessPlanRepository create(Ref ref) {
    return fitnessPlanRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FitnessPlanRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FitnessPlanRepository>(value),
    );
  }
}

String _$fitnessPlanRepositoryHash() =>
    r'ae44a77018eef808687fea8e4a7c0636e88d34e7';

@ProviderFor(FitnessPlanNotifier)
final fitnessPlanProvider = FitnessPlanNotifierProvider._();

final class FitnessPlanNotifierProvider
    extends $AsyncNotifierProvider<FitnessPlanNotifier, List<FitnessPlan>> {
  FitnessPlanNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'fitnessPlanProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$fitnessPlanNotifierHash();

  @$internal
  @override
  FitnessPlanNotifier create() => FitnessPlanNotifier();
}

String _$fitnessPlanNotifierHash() =>
    r'5ad6959abce686bf7620d8c40b8d6b5aa1268ba4';

abstract class _$FitnessPlanNotifier extends $AsyncNotifier<List<FitnessPlan>> {
  FutureOr<List<FitnessPlan>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<List<FitnessPlan>>, List<FitnessPlan>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<FitnessPlan>>, List<FitnessPlan>>,
              AsyncValue<List<FitnessPlan>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(featuredPlan)
final featuredPlanProvider = FeaturedPlanProvider._();

final class FeaturedPlanProvider
    extends $FunctionalProvider<FitnessPlan?, FitnessPlan?, FitnessPlan?>
    with $Provider<FitnessPlan?> {
  FeaturedPlanProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'featuredPlanProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$featuredPlanHash();

  @$internal
  @override
  $ProviderElement<FitnessPlan?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  FitnessPlan? create(Ref ref) {
    return featuredPlan(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FitnessPlan? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FitnessPlan?>(value),
    );
  }
}

String _$featuredPlanHash() => r'010c099248b38b007aaa7553dd93028af45b8f43';

@ProviderFor(regularPlans)
final regularPlansProvider = RegularPlansProvider._();

final class RegularPlansProvider
    extends
        $FunctionalProvider<
          List<FitnessPlan>,
          List<FitnessPlan>,
          List<FitnessPlan>
        >
    with $Provider<List<FitnessPlan>> {
  RegularPlansProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'regularPlansProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$regularPlansHash();

  @$internal
  @override
  $ProviderElement<List<FitnessPlan>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  List<FitnessPlan> create(Ref ref) {
    return regularPlans(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<FitnessPlan> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<FitnessPlan>>(value),
    );
  }
}

String _$regularPlansHash() => r'b2de24be460e92499f37c1a42a38b54d2aaaa070';

@ProviderFor(fitnessPlanById)
final fitnessPlanByIdProvider = FitnessPlanByIdFamily._();

final class FitnessPlanByIdProvider
    extends
        $FunctionalProvider<
          AsyncValue<FitnessPlanDetail>,
          FitnessPlanDetail,
          FutureOr<FitnessPlanDetail>
        >
    with
        $FutureModifier<FitnessPlanDetail>,
        $FutureProvider<FitnessPlanDetail> {
  FitnessPlanByIdProvider._({
    required FitnessPlanByIdFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'fitnessPlanByIdProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$fitnessPlanByIdHash();

  @override
  String toString() {
    return r'fitnessPlanByIdProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<FitnessPlanDetail> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<FitnessPlanDetail> create(Ref ref) {
    final argument = this.argument as String;
    return fitnessPlanById(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is FitnessPlanByIdProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$fitnessPlanByIdHash() => r'e2b62f1e47ea860d97f8acc72b4e84c1e21ebe9e';

final class FitnessPlanByIdFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<FitnessPlanDetail>, String> {
  FitnessPlanByIdFamily._()
    : super(
        retry: null,
        name: r'fitnessPlanByIdProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  FitnessPlanByIdProvider call(String id) =>
      FitnessPlanByIdProvider._(argument: id, from: this);

  @override
  String toString() => r'fitnessPlanByIdProvider';
}
