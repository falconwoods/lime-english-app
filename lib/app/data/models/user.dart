import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'user.freezed.dart';

@Freezed()
class User with _$User {
  factory User(
      {required String id,
      required String name,
      required String email,
      required String phone,
      required String avatar,
      required String token}) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
