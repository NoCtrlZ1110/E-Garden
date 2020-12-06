// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    accessToken: json['accessToken'] as String,
    encryptedAccessToken: json['encryptedAccessToken'] as String,
    expireInSeconds: json['expireInSeconds'] as int,
    userId: json['userId'] as int,
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'accessToken': instance.accessToken,
      'encryptedAccessToken': instance.encryptedAccessToken,
      'expireInSeconds': instance.expireInSeconds,
      'userId': instance.userId,
    };
