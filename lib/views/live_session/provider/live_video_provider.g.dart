// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'live_video_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(LiveVideoProgress)
final liveVideoProgressProvider = LiveVideoProgressFamily._();

final class LiveVideoProgressProvider
    extends
        $NotifierProvider<
          LiveVideoProgress,
          ({Duration position, Duration total})
        > {
  LiveVideoProgressProvider._({
    required LiveVideoProgressFamily super.from,
    required LiveVideoConfig super.argument,
  }) : super(
         retry: null,
         name: r'liveVideoProgressProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$liveVideoProgressHash();

  @override
  String toString() {
    return r'liveVideoProgressProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  LiveVideoProgress create() => LiveVideoProgress();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(({Duration position, Duration total}) value) {
    return $ProviderOverride(
      origin: this,
      providerOverride:
          $SyncValueProvider<({Duration position, Duration total})>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is LiveVideoProgressProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$liveVideoProgressHash() => r'c00d1e7a1b3733a94f8ca9d8a9e793f5289bc34b';

final class LiveVideoProgressFamily extends $Family
    with
        $ClassFamilyOverride<
          LiveVideoProgress,
          ({Duration position, Duration total}),
          ({Duration position, Duration total}),
          ({Duration position, Duration total}),
          LiveVideoConfig
        > {
  LiveVideoProgressFamily._()
    : super(
        retry: null,
        name: r'liveVideoProgressProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  LiveVideoProgressProvider call(LiveVideoConfig config) =>
      LiveVideoProgressProvider._(argument: config, from: this);

  @override
  String toString() => r'liveVideoProgressProvider';
}

abstract class _$LiveVideoProgress
    extends $Notifier<({Duration position, Duration total})> {
  late final _$args = ref.$arg as LiveVideoConfig;
  LiveVideoConfig get config => _$args;

  ({Duration position, Duration total}) build(LiveVideoConfig config);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<
              ({Duration position, Duration total}),
              ({Duration position, Duration total})
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                ({Duration position, Duration total}),
                ({Duration position, Duration total})
              >,
              ({Duration position, Duration total}),
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}

@ProviderFor(LiveVideoMessages)
final liveVideoMessagesProvider = LiveVideoMessagesFamily._();

final class LiveVideoMessagesProvider
    extends $NotifierProvider<LiveVideoMessages, List<ChatMessage>> {
  LiveVideoMessagesProvider._({
    required LiveVideoMessagesFamily super.from,
    required LiveVideoConfig super.argument,
  }) : super(
         retry: null,
         name: r'liveVideoMessagesProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$liveVideoMessagesHash();

  @override
  String toString() {
    return r'liveVideoMessagesProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  LiveVideoMessages create() => LiveVideoMessages();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<ChatMessage> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<ChatMessage>>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is LiveVideoMessagesProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$liveVideoMessagesHash() => r'512c00f7b738b1ee9fb3934db407d369fddd18f9';

final class LiveVideoMessagesFamily extends $Family
    with
        $ClassFamilyOverride<
          LiveVideoMessages,
          List<ChatMessage>,
          List<ChatMessage>,
          List<ChatMessage>,
          LiveVideoConfig
        > {
  LiveVideoMessagesFamily._()
    : super(
        retry: null,
        name: r'liveVideoMessagesProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  LiveVideoMessagesProvider call(LiveVideoConfig config) =>
      LiveVideoMessagesProvider._(argument: config, from: this);

  @override
  String toString() => r'liveVideoMessagesProvider';
}

abstract class _$LiveVideoMessages extends $Notifier<List<ChatMessage>> {
  late final _$args = ref.$arg as LiveVideoConfig;
  LiveVideoConfig get config => _$args;

  List<ChatMessage> build(LiveVideoConfig config);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<List<ChatMessage>, List<ChatMessage>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<ChatMessage>, List<ChatMessage>>,
              List<ChatMessage>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}

@ProviderFor(LiveVideoControls)
final liveVideoControlsProvider = LiveVideoControlsFamily._();

final class LiveVideoControlsProvider
    extends $NotifierProvider<LiveVideoControls, LiveVideoControlsState> {
  LiveVideoControlsProvider._({
    required LiveVideoControlsFamily super.from,
    required LiveVideoConfig super.argument,
  }) : super(
         retry: null,
         name: r'liveVideoControlsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$liveVideoControlsHash();

  @override
  String toString() {
    return r'liveVideoControlsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  LiveVideoControls create() => LiveVideoControls();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LiveVideoControlsState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LiveVideoControlsState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is LiveVideoControlsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$liveVideoControlsHash() => r'5e0b2c16d0482bc68a80ed50c04b8ea525cee83d';

final class LiveVideoControlsFamily extends $Family
    with
        $ClassFamilyOverride<
          LiveVideoControls,
          LiveVideoControlsState,
          LiveVideoControlsState,
          LiveVideoControlsState,
          LiveVideoConfig
        > {
  LiveVideoControlsFamily._()
    : super(
        retry: null,
        name: r'liveVideoControlsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  LiveVideoControlsProvider call(LiveVideoConfig config) =>
      LiveVideoControlsProvider._(argument: config, from: this);

  @override
  String toString() => r'liveVideoControlsProvider';
}

abstract class _$LiveVideoControls extends $Notifier<LiveVideoControlsState> {
  late final _$args = ref.$arg as LiveVideoConfig;
  LiveVideoConfig get config => _$args;

  LiveVideoControlsState build(LiveVideoConfig config);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<LiveVideoControlsState, LiveVideoControlsState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<LiveVideoControlsState, LiveVideoControlsState>,
              LiveVideoControlsState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}

@ProviderFor(LiveVideoConfigNotifier)
final liveVideoConfigProvider = LiveVideoConfigNotifierFamily._();

final class LiveVideoConfigNotifierProvider
    extends $NotifierProvider<LiveVideoConfigNotifier, LiveVideoConfig> {
  LiveVideoConfigNotifierProvider._({
    required LiveVideoConfigNotifierFamily super.from,
    required LiveVideoConfig super.argument,
  }) : super(
         retry: null,
         name: r'liveVideoConfigProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$liveVideoConfigNotifierHash();

  @override
  String toString() {
    return r'liveVideoConfigProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  LiveVideoConfigNotifier create() => LiveVideoConfigNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LiveVideoConfig value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LiveVideoConfig>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is LiveVideoConfigNotifierProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$liveVideoConfigNotifierHash() =>
    r'6549311abb746d5c2f164ed1051b977c84726137';

final class LiveVideoConfigNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          LiveVideoConfigNotifier,
          LiveVideoConfig,
          LiveVideoConfig,
          LiveVideoConfig,
          LiveVideoConfig
        > {
  LiveVideoConfigNotifierFamily._()
    : super(
        retry: null,
        name: r'liveVideoConfigProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  LiveVideoConfigNotifierProvider call(LiveVideoConfig config) =>
      LiveVideoConfigNotifierProvider._(argument: config, from: this);

  @override
  String toString() => r'liveVideoConfigProvider';
}

abstract class _$LiveVideoConfigNotifier extends $Notifier<LiveVideoConfig> {
  late final _$args = ref.$arg as LiveVideoConfig;
  LiveVideoConfig get config => _$args;

  LiveVideoConfig build(LiveVideoConfig config);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<LiveVideoConfig, LiveVideoConfig>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<LiveVideoConfig, LiveVideoConfig>,
              LiveVideoConfig,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}

/// Chat open flag — AnimationController in LiveVideoScreen

@ProviderFor(liveVideoChatOpen)
final liveVideoChatOpenProvider = LiveVideoChatOpenFamily._();

/// Chat open flag — AnimationController in LiveVideoScreen

final class LiveVideoChatOpenProvider
    extends $FunctionalProvider<bool, bool, bool>
    with $Provider<bool> {
  /// Chat open flag — AnimationController in LiveVideoScreen
  LiveVideoChatOpenProvider._({
    required LiveVideoChatOpenFamily super.from,
    required LiveVideoConfig super.argument,
  }) : super(
         retry: null,
         name: r'liveVideoChatOpenProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$liveVideoChatOpenHash();

  @override
  String toString() {
    return r'liveVideoChatOpenProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  bool create(Ref ref) {
    final argument = this.argument as LiveVideoConfig;
    return liveVideoChatOpen(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is LiveVideoChatOpenProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$liveVideoChatOpenHash() => r'3eb9858da0ef706dfc7a1031a0921020c119e811';

/// Chat open flag — AnimationController in LiveVideoScreen

final class LiveVideoChatOpenFamily extends $Family
    with $FunctionalFamilyOverride<bool, LiveVideoConfig> {
  LiveVideoChatOpenFamily._()
    : super(
        retry: null,
        name: r'liveVideoChatOpenProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Chat open flag — AnimationController in LiveVideoScreen

  LiveVideoChatOpenProvider call(LiveVideoConfig config) =>
      LiveVideoChatOpenProvider._(argument: config, from: this);

  @override
  String toString() => r'liveVideoChatOpenProvider';
}

/// Mute flag — mic button in VideoActionBar

@ProviderFor(liveVideoIsMuted)
final liveVideoIsMutedProvider = LiveVideoIsMutedFamily._();

/// Mute flag — mic button in VideoActionBar

final class LiveVideoIsMutedProvider
    extends $FunctionalProvider<bool, bool, bool>
    with $Provider<bool> {
  /// Mute flag — mic button in VideoActionBar
  LiveVideoIsMutedProvider._({
    required LiveVideoIsMutedFamily super.from,
    required LiveVideoConfig super.argument,
  }) : super(
         retry: null,
         name: r'liveVideoIsMutedProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$liveVideoIsMutedHash();

  @override
  String toString() {
    return r'liveVideoIsMutedProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  bool create(Ref ref) {
    final argument = this.argument as LiveVideoConfig;
    return liveVideoIsMuted(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is LiveVideoIsMutedProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$liveVideoIsMutedHash() => r'fad8469b40586b093904cb410e091b7a4b83993e';

/// Mute flag — mic button in VideoActionBar

final class LiveVideoIsMutedFamily extends $Family
    with $FunctionalFamilyOverride<bool, LiveVideoConfig> {
  LiveVideoIsMutedFamily._()
    : super(
        retry: null,
        name: r'liveVideoIsMutedProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Mute flag — mic button in VideoActionBar

  LiveVideoIsMutedProvider call(LiveVideoConfig config) =>
      LiveVideoIsMutedProvider._(argument: config, from: this);

  @override
  String toString() => r'liveVideoIsMutedProvider';
}

/// Camera flag — camera button in VideoActionBar

@ProviderFor(liveVideoIsCameraOff)
final liveVideoIsCameraOffProvider = LiveVideoIsCameraOffFamily._();

/// Camera flag — camera button in VideoActionBar

final class LiveVideoIsCameraOffProvider
    extends $FunctionalProvider<bool, bool, bool>
    with $Provider<bool> {
  /// Camera flag — camera button in VideoActionBar
  LiveVideoIsCameraOffProvider._({
    required LiveVideoIsCameraOffFamily super.from,
    required LiveVideoConfig super.argument,
  }) : super(
         retry: null,
         name: r'liveVideoIsCameraOffProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$liveVideoIsCameraOffHash();

  @override
  String toString() {
    return r'liveVideoIsCameraOffProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  bool create(Ref ref) {
    final argument = this.argument as LiveVideoConfig;
    return liveVideoIsCameraOff(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is LiveVideoIsCameraOffProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$liveVideoIsCameraOffHash() =>
    r'51ba827a7ced30726a94cbd20f58d46405729af7';

/// Camera flag — camera button in VideoActionBar

final class LiveVideoIsCameraOffFamily extends $Family
    with $FunctionalFamilyOverride<bool, LiveVideoConfig> {
  LiveVideoIsCameraOffFamily._()
    : super(
        retry: null,
        name: r'liveVideoIsCameraOffProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Camera flag — camera button in VideoActionBar

  LiveVideoIsCameraOffProvider call(LiveVideoConfig config) =>
      LiveVideoIsCameraOffProvider._(argument: config, from: this);

  @override
  String toString() => r'liveVideoIsCameraOffProvider';
}

/// Progress tuple — ProgressBar only

@ProviderFor(liveVideoProgressState)
final liveVideoProgressStateProvider = LiveVideoProgressStateFamily._();

/// Progress tuple — ProgressBar only

final class LiveVideoProgressStateProvider
    extends
        $FunctionalProvider<
          ({Duration position, Duration total}),
          ({Duration position, Duration total}),
          ({Duration position, Duration total})
        >
    with $Provider<({Duration position, Duration total})> {
  /// Progress tuple — ProgressBar only
  LiveVideoProgressStateProvider._({
    required LiveVideoProgressStateFamily super.from,
    required LiveVideoConfig super.argument,
  }) : super(
         retry: null,
         name: r'liveVideoProgressStateProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$liveVideoProgressStateHash();

  @override
  String toString() {
    return r'liveVideoProgressStateProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<({Duration position, Duration total})> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ({Duration position, Duration total}) create(Ref ref) {
    final argument = this.argument as LiveVideoConfig;
    return liveVideoProgressState(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(({Duration position, Duration total}) value) {
    return $ProviderOverride(
      origin: this,
      providerOverride:
          $SyncValueProvider<({Duration position, Duration total})>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is LiveVideoProgressStateProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$liveVideoProgressStateHash() =>
    r'a55ca8bb8c28af33e0ba50a323e5d7d230eed60e';

/// Progress tuple — ProgressBar only

final class LiveVideoProgressStateFamily extends $Family
    with
        $FunctionalFamilyOverride<
          ({Duration position, Duration total}),
          LiveVideoConfig
        > {
  LiveVideoProgressStateFamily._()
    : super(
        retry: null,
        name: r'liveVideoProgressStateProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Progress tuple — ProgressBar only

  LiveVideoProgressStateProvider call(LiveVideoConfig config) =>
      LiveVideoProgressStateProvider._(argument: config, from: this);

  @override
  String toString() => r'liveVideoProgressStateProvider';
}

/// Config snapshot — VideoTopBar / VideoOverlayInfo

@ProviderFor(liveVideoConfigState)
final liveVideoConfigStateProvider = LiveVideoConfigStateFamily._();

/// Config snapshot — VideoTopBar / VideoOverlayInfo

final class LiveVideoConfigStateProvider
    extends
        $FunctionalProvider<LiveVideoConfig, LiveVideoConfig, LiveVideoConfig>
    with $Provider<LiveVideoConfig> {
  /// Config snapshot — VideoTopBar / VideoOverlayInfo
  LiveVideoConfigStateProvider._({
    required LiveVideoConfigStateFamily super.from,
    required LiveVideoConfig super.argument,
  }) : super(
         retry: null,
         name: r'liveVideoConfigStateProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$liveVideoConfigStateHash();

  @override
  String toString() {
    return r'liveVideoConfigStateProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<LiveVideoConfig> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  LiveVideoConfig create(Ref ref) {
    final argument = this.argument as LiveVideoConfig;
    return liveVideoConfigState(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LiveVideoConfig value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LiveVideoConfig>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is LiveVideoConfigStateProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$liveVideoConfigStateHash() =>
    r'1368b10c1d69fffbdca69e70f050e79dd8d03838';

/// Config snapshot — VideoTopBar / VideoOverlayInfo

final class LiveVideoConfigStateFamily extends $Family
    with $FunctionalFamilyOverride<LiveVideoConfig, LiveVideoConfig> {
  LiveVideoConfigStateFamily._()
    : super(
        retry: null,
        name: r'liveVideoConfigStateProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Config snapshot — VideoTopBar / VideoOverlayInfo

  LiveVideoConfigStateProvider call(LiveVideoConfig config) =>
      LiveVideoConfigStateProvider._(argument: config, from: this);

  @override
  String toString() => r'liveVideoConfigStateProvider';
}

/// Messages list — ChatPanel / LiveMessagesOverlay

@ProviderFor(liveVideoMessagesList)
final liveVideoMessagesListProvider = LiveVideoMessagesListFamily._();

/// Messages list — ChatPanel / LiveMessagesOverlay

final class LiveVideoMessagesListProvider
    extends
        $FunctionalProvider<
          List<ChatMessage>,
          List<ChatMessage>,
          List<ChatMessage>
        >
    with $Provider<List<ChatMessage>> {
  /// Messages list — ChatPanel / LiveMessagesOverlay
  LiveVideoMessagesListProvider._({
    required LiveVideoMessagesListFamily super.from,
    required LiveVideoConfig super.argument,
  }) : super(
         retry: null,
         name: r'liveVideoMessagesListProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$liveVideoMessagesListHash();

  @override
  String toString() {
    return r'liveVideoMessagesListProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<List<ChatMessage>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  List<ChatMessage> create(Ref ref) {
    final argument = this.argument as LiveVideoConfig;
    return liveVideoMessagesList(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<ChatMessage> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<ChatMessage>>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is LiveVideoMessagesListProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$liveVideoMessagesListHash() =>
    r'dc4586a3aafdaa8d99199fc8652ecd4aa616f10c';

/// Messages list — ChatPanel / LiveMessagesOverlay

final class LiveVideoMessagesListFamily extends $Family
    with $FunctionalFamilyOverride<List<ChatMessage>, LiveVideoConfig> {
  LiveVideoMessagesListFamily._()
    : super(
        retry: null,
        name: r'liveVideoMessagesListProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Messages list — ChatPanel / LiveMessagesOverlay

  LiveVideoMessagesListProvider call(LiveVideoConfig config) =>
      LiveVideoMessagesListProvider._(argument: config, from: this);

  @override
  String toString() => r'liveVideoMessagesListProvider';
}
