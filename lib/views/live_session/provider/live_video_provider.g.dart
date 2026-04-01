// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'live_video_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(LiveVideoNotifier)
final liveVideoProvider = LiveVideoNotifierFamily._();

final class LiveVideoNotifierProvider
    extends $NotifierProvider<LiveVideoNotifier, LiveVideoState> {
  LiveVideoNotifierProvider._({
    required LiveVideoNotifierFamily super.from,
    required LiveVideoConfig super.argument,
  }) : super(
         retry: null,
         name: r'liveVideoProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$liveVideoNotifierHash();

  @override
  String toString() {
    return r'liveVideoProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  LiveVideoNotifier create() => LiveVideoNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LiveVideoState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LiveVideoState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is LiveVideoNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$liveVideoNotifierHash() => r'9334a02b0b8540809c9082b6ecf0317d46bd359a';

final class LiveVideoNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          LiveVideoNotifier,
          LiveVideoState,
          LiveVideoState,
          LiveVideoState,
          LiveVideoConfig
        > {
  LiveVideoNotifierFamily._()
    : super(
        retry: null,
        name: r'liveVideoProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  LiveVideoNotifierProvider call(LiveVideoConfig config) =>
      LiveVideoNotifierProvider._(argument: config, from: this);

  @override
  String toString() => r'liveVideoProvider';
}

abstract class _$LiveVideoNotifier extends $Notifier<LiveVideoState> {
  late final _$args = ref.$arg as LiveVideoConfig;
  LiveVideoConfig get config => _$args;

  LiveVideoState build(LiveVideoConfig config);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<LiveVideoState, LiveVideoState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<LiveVideoState, LiveVideoState>,
              LiveVideoState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}

/// Only the messages list — ChatPanel rebuilds on new messages only.

@ProviderFor(liveVideoMessages)
final liveVideoMessagesProvider = LiveVideoMessagesFamily._();

/// Only the messages list — ChatPanel rebuilds on new messages only.

final class LiveVideoMessagesProvider
    extends
        $FunctionalProvider<
          List<ChatMessage>,
          List<ChatMessage>,
          List<ChatMessage>
        >
    with $Provider<List<ChatMessage>> {
  /// Only the messages list — ChatPanel rebuilds on new messages only.
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
  $ProviderElement<List<ChatMessage>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  List<ChatMessage> create(Ref ref) {
    final argument = this.argument as LiveVideoConfig;
    return liveVideoMessages(ref, argument);
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
    return other is LiveVideoMessagesProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$liveVideoMessagesHash() => r'd2e144a7caa384f0666fe25dc4e548612f65853d';

/// Only the messages list — ChatPanel rebuilds on new messages only.

final class LiveVideoMessagesFamily extends $Family
    with $FunctionalFamilyOverride<List<ChatMessage>, LiveVideoConfig> {
  LiveVideoMessagesFamily._()
    : super(
        retry: null,
        name: r'liveVideoMessagesProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Only the messages list — ChatPanel rebuilds on new messages only.

  LiveVideoMessagesProvider call(LiveVideoConfig config) =>
      LiveVideoMessagesProvider._(argument: config, from: this);

  @override
  String toString() => r'liveVideoMessagesProvider';
}

/// Only the chat-open flag — VideoActionBar rebuilds on toggle only.

@ProviderFor(liveVideoChatOpen)
final liveVideoChatOpenProvider = LiveVideoChatOpenFamily._();

/// Only the chat-open flag — VideoActionBar rebuilds on toggle only.

final class LiveVideoChatOpenProvider
    extends $FunctionalProvider<bool, bool, bool>
    with $Provider<bool> {
  /// Only the chat-open flag — VideoActionBar rebuilds on toggle only.
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

String _$liveVideoChatOpenHash() => r'84ff698874b2b7be060cf0aa3b7374bc1bf60e07';

/// Only the chat-open flag — VideoActionBar rebuilds on toggle only.

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

  /// Only the chat-open flag — VideoActionBar rebuilds on toggle only.

  LiveVideoChatOpenProvider call(LiveVideoConfig config) =>
      LiveVideoChatOpenProvider._(argument: config, from: this);

  @override
  String toString() => r'liveVideoChatOpenProvider';
}

/// Only mute state.

@ProviderFor(liveVideoIsMuted)
final liveVideoIsMutedProvider = LiveVideoIsMutedFamily._();

/// Only mute state.

final class LiveVideoIsMutedProvider
    extends $FunctionalProvider<bool, bool, bool>
    with $Provider<bool> {
  /// Only mute state.
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

String _$liveVideoIsMutedHash() => r'a6e6e081002dbc192b5d1067069c42c652ed77fe';

/// Only mute state.

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

  /// Only mute state.

  LiveVideoIsMutedProvider call(LiveVideoConfig config) =>
      LiveVideoIsMutedProvider._(argument: config, from: this);

  @override
  String toString() => r'liveVideoIsMutedProvider';
}

/// Only camera-off state.

@ProviderFor(liveVideoIsCameraOff)
final liveVideoIsCameraOffProvider = LiveVideoIsCameraOffFamily._();

/// Only camera-off state.

final class LiveVideoIsCameraOffProvider
    extends $FunctionalProvider<bool, bool, bool>
    with $Provider<bool> {
  /// Only camera-off state.
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
    r'95ed7f6934b41dd9f2436e19749fb9c3238fc93e';

/// Only camera-off state.

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

  /// Only camera-off state.

  LiveVideoIsCameraOffProvider call(LiveVideoConfig config) =>
      LiveVideoIsCameraOffProvider._(argument: config, from: this);

  @override
  String toString() => r'liveVideoIsCameraOffProvider';
}

/// Only the config (viewer count, progress) — VideoTopBar + VideoOverlayInfo.

@ProviderFor(liveVideoConfig)
final liveVideoConfigProvider = LiveVideoConfigFamily._();

/// Only the config (viewer count, progress) — VideoTopBar + VideoOverlayInfo.

final class LiveVideoConfigProvider
    extends
        $FunctionalProvider<LiveVideoConfig, LiveVideoConfig, LiveVideoConfig>
    with $Provider<LiveVideoConfig> {
  /// Only the config (viewer count, progress) — VideoTopBar + VideoOverlayInfo.
  LiveVideoConfigProvider._({
    required LiveVideoConfigFamily super.from,
    required LiveVideoConfig super.argument,
  }) : super(
         retry: null,
         name: r'liveVideoConfigProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$liveVideoConfigHash();

  @override
  String toString() {
    return r'liveVideoConfigProvider'
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
    return liveVideoConfig(ref, argument);
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
    return other is LiveVideoConfigProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$liveVideoConfigHash() => r'428efd07862804c48a5351cd0ec903c29e3cd1b6';

/// Only the config (viewer count, progress) — VideoTopBar + VideoOverlayInfo.

final class LiveVideoConfigFamily extends $Family
    with $FunctionalFamilyOverride<LiveVideoConfig, LiveVideoConfig> {
  LiveVideoConfigFamily._()
    : super(
        retry: null,
        name: r'liveVideoConfigProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Only the config (viewer count, progress) — VideoTopBar + VideoOverlayInfo.

  LiveVideoConfigProvider call(LiveVideoConfig config) =>
      LiveVideoConfigProvider._(argument: config, from: this);

  @override
  String toString() => r'liveVideoConfigProvider';
}
