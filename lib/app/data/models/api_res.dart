import 'package:get/get_connect/connect.dart';

class ApiResponse<T> {
  late final int? code;
  late final String message;
  late final dynamic data;
  late final int? timestamp;
  late final Response res;

  ApiResponse(this.res) {
    if (res.isOk) {
      var json = res.body;
      try {
        this.code = json['code'] as int;
        this.message = json['message'];
        this.data = json['data'];
        this.timestamp = json['timestamp'] as int;
      } catch (e) {
        this.code = -1;
        this.message = 'Error parsing response';
        this.data = null;
        this.timestamp = 0;
      }
    } else {
      this.code = -2;
      this.message = 'Http Error';
      this.data = null;
      this.timestamp = 0;
    }
  }

  bool get isOk {
    return code == 0;
  }

  bool get hasError {
    return !isOk;
  }
}
