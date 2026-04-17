// lib/utils/async_state.dart
class AsyncState<T> {
  final bool isLoading;
  final T? data;
  final String? error;

  const AsyncState({this.isLoading = false, this.data, this.error});

  AsyncState<T> copyWith({
    bool? isLoading,
    T? data,
    String? error,
    bool clearData = false,
  }) {
    return AsyncState(
      isLoading: isLoading ?? this.isLoading,
      data: clearData ? null : (data ?? this.data),
      error: error ?? this.error,
    );
  }
}
