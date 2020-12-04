import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';
@JsonSerializable(nullable: true, explicitToJson: true)
class User {
  String accessToken;
  String encryptedAccessToken;
  int expireInSeconds;
  int userId;

  User(
      {this.accessToken,
        this.encryptedAccessToken,
        this.expireInSeconds,
        this.userId});
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}