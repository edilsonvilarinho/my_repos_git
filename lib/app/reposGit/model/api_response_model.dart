class ApiResponse<T> {
  bool ok;
  String message;
  T result;

  ApiResponse.ok(this.result) {
    this.ok = true;
  }

  ApiResponse.error(this.message) {
    this.ok = false;
  }
}
