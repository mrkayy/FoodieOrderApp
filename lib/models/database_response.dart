class DataBaseResponse<T> {
  T data;
  bool error;
  String errorMessage;
  DataBaseResponse({this.data, this.errorMessage,this.error = false});
}
