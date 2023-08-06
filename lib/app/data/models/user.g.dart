// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['name', 'email', 'vipLevel'],
  );
  return User(
    json['name'] as String,
    json['email'] as String,
    json['vipLevel'] as int,
    json['avatar'] as String,
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'vipLevel': instance.vipLevel,
      'avatar': instance.avatar,
    };
