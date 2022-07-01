class Resource {
  static const LOADING = 0, SUCCESS = 1, ERROR = 2;

  int status = LOADING;
  dynamic data;
  String? message;

  Resource._constructor(this.status, this.data, this.message);

  Resource();

  success(dynamic data) {
    return Resource._constructor(SUCCESS, data, "");
  }

  error(String message) {
    return Resource._constructor(ERROR, null, message);
  }

  loading() {
    return Resource._constructor(LOADING, null, "");
  }
}
