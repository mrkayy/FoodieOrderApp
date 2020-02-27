class APIResponse<T> {
  T data;
  String error;
  String errorMessage;

  APIResponse({
    this.data,
    this.error,
    this.errorMessage,
  });
}
