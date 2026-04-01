// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SelectedDate)
final selectedDateProvider = SelectedDateProvider._();

final class SelectedDateProvider extends $NotifierProvider<SelectedDate, int?> {
  SelectedDateProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'selectedDateProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$selectedDateHash();

  @$internal
  @override
  SelectedDate create() => SelectedDate();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int?>(value),
    );
  }
}

String _$selectedDateHash() => r'a4a8f48bcf23afd766592d7749e75c7294b33c8f';

abstract class _$SelectedDate extends $Notifier<int?> {
  int? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<int?, int?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<int?, int?>,
              int?,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(scheduleRepository)
final scheduleRepositoryProvider = ScheduleRepositoryProvider._();

final class ScheduleRepositoryProvider
    extends
        $FunctionalProvider<
          ScheduleRepository,
          ScheduleRepository,
          ScheduleRepository
        >
    with $Provider<ScheduleRepository> {
  ScheduleRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'scheduleRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$scheduleRepositoryHash();

  @$internal
  @override
  $ProviderElement<ScheduleRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ScheduleRepository create(Ref ref) {
    return scheduleRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ScheduleRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ScheduleRepository>(value),
    );
  }
}

String _$scheduleRepositoryHash() =>
    r'7e667a0b13cd9b5eee6eb22c7c9bc0e7ad4979ef';

@ProviderFor(ScheduleNotifier)
final scheduleProvider = ScheduleNotifierProvider._();

final class ScheduleNotifierProvider
    extends $AsyncNotifierProvider<ScheduleNotifier, ScheduleResponse> {
  ScheduleNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'scheduleProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$scheduleNotifierHash();

  @$internal
  @override
  ScheduleNotifier create() => ScheduleNotifier();
}

String _$scheduleNotifierHash() => r'd5310e8ca528ed6027cb369d4c1c76d50de9ff79';

abstract class _$ScheduleNotifier extends $AsyncNotifier<ScheduleResponse> {
  FutureOr<ScheduleResponse> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<ScheduleResponse>, ScheduleResponse>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<ScheduleResponse>, ScheduleResponse>,
              AsyncValue<ScheduleResponse>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(todaySession)
final todaySessionProvider = TodaySessionProvider._();

final class TodaySessionProvider
    extends $FunctionalProvider<Session?, Session?, Session?>
    with $Provider<Session?> {
  TodaySessionProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'todaySessionProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$todaySessionHash();

  @$internal
  @override
  $ProviderElement<Session?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Session? create(Ref ref) {
    return todaySession(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Session? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Session?>(value),
    );
  }
}

String _$todaySessionHash() => r'dad6aeab1b7f6bce1a8a789e8bb082f231b74bb2';

@ProviderFor(upcomingSessions)
final upcomingSessionsProvider = UpcomingSessionsProvider._();

final class UpcomingSessionsProvider
    extends $FunctionalProvider<List<Session>, List<Session>, List<Session>>
    with $Provider<List<Session>> {
  UpcomingSessionsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'upcomingSessionsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$upcomingSessionsHash();

  @$internal
  @override
  $ProviderElement<List<Session>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  List<Session> create(Ref ref) {
    return upcomingSessions(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<Session> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<Session>>(value),
    );
  }
}

String _$upcomingSessionsHash() => r'4a14640345e72904a4fcf10439f8c27ffaa679ed';

@ProviderFor(pastSessions)
final pastSessionsProvider = PastSessionsProvider._();

final class PastSessionsProvider
    extends $FunctionalProvider<List<Session>, List<Session>, List<Session>>
    with $Provider<List<Session>> {
  PastSessionsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'pastSessionsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$pastSessionsHash();

  @$internal
  @override
  $ProviderElement<List<Session>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  List<Session> create(Ref ref) {
    return pastSessions(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<Session> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<Session>>(value),
    );
  }
}

String _$pastSessionsHash() => r'677fd2a7501d3d917f82ee1e0903bbf8ec9586cd';
