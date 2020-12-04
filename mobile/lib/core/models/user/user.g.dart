// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    result: json['result'] == null
        ? null
        : Result.fromJson(json['result'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'result': instance.result?.toJson(),
    };

Result _$ResultFromJson(Map<String, dynamic> json) {
  return Result(
    accessToken: json['accessToken'] as String,
    encryptedAccessToken: json['encryptedAccessToken'] as String,
    expireInSeconds: json['expireInSeconds'] as int,
    userId: json['userId'] as int,
  );
}

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'accessToken': instance.accessToken,
      'encryptedAccessToken': instance.encryptedAccessToken,
      'expireInSeconds': instance.expireInSeconds,
      'userId': instance.userId,
    };
