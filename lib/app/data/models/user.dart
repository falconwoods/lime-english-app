import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  @JsonKey(required: true)
  String? name;

  @JsonKey(required: true)
  String? email;

  @JsonKey(required: true)
  int? vipLevel;

  String? avatar;

  User({this.name, this.email, this.vipLevel, this.avatar});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
