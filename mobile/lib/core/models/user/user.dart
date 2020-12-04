import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';
@JsonSerializable(nullable: true, explicitToJson: true)
class User {
  Result result;
  User(
      {this.result});
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
@JsonSerializable(nullable: true, explicitToJson: true)
class Result {
  String accessToken;
  String encryptedAccessToken;
  int expireInSeconds;
  int userId;

  Result(
      {this.accessToken,
        this.encryptedAccessToken,
        this.expireInSeconds,
        this.userId});
  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

  Map<String, dynamic> toJson() => _$ResultToJson(this);
}