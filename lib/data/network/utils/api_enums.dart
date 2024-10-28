enum ApiState {
  initial,
  loading,
  success,
  failed;

  bool get isInitial => this == ApiState.initial;

  bool get isLoading => this == ApiState.loading;

  bool get isSuccess => this == ApiState.success;

  bool get isFailed => this == ApiState.failed;
}

enum RequestType {
  post,
  get;

  bool get isPost => this == RequestType.post;

  bool get isGet => this == RequestType.get;
}
