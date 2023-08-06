import 'package:lime_english/app/data/models/user.dart';

class ApiResponse<T> {
  final int statusCode;
  late final int code;
  late final String message;
  late final T? data;

  ApiResponse(this.statusCode, Map<String, dynamic> json) {
    this.code = json['code'] as int;
    this.message = json['message'];
    this.data = T.fromJson(['data']);
    User.fromJson(json)
  }

  get isOk => statusCode >= 200 && statusCode < 300 && code == 0;
}
