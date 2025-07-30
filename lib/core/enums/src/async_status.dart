enum AsyncStatus { initial, loading, success, failure }

extension AsyncStatusX on AsyncStatus {
  bool get isInitial => this == AsyncStatus.initial;
  bool get isLoading => this == AsyncStatus.loading;
  bool get isSuccess => this == AsyncStatus.success;
  bool get isFailure => this == AsyncStatus.failure;
}

class AsyncResult<T> {
  const AsyncResult({
    this.status = AsyncStatus.initial,
    this.data,
    this.error,
  });
  final AsyncStatus status;
  final T? data;
  final Exception? error;

  bool get isInitial => status == AsyncStatus.initial;
  bool get isLoading => status == AsyncStatus.loading;
  bool get isSuccess => status == AsyncStatus.success;
  bool get isFailure => status == AsyncStatus.failure;

  AsyncResult<T> copyWith({
    AsyncStatus? status,
    T? data,
    Exception? error,
  }) {
    return AsyncResult(
      status: status ?? this.status,
      data: data ?? this.data,
      error: error ?? this.error,
    );
  }

  @override
  String toString() =>
      'AsyncResult(status: $status, data: $data, error: $error)';
}

enum AsyncSocket { initial, received, done, error }
