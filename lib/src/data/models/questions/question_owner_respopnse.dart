import 'package:json_annotation/json_annotation.dart';

part 'question_owner_respopnse.g.dart';

@JsonSerializable()
class QuestionOwnerResponse {
  @JsonKey(name: 'account_id')
  int? accountId;
  int? reputation;
  @JsonKey(name: 'user_id')
  int? userId;
  @JsonKey(name: 'user_type')
  String? userType;
  @JsonKey(name: 'profile_image')
  String? profileImage;
  @JsonKey(name: 'display_name')
  String? displayName;
  String? link;

  QuestionOwnerResponse(
      {this.accountId,
      this.reputation,
      this.userId,
      this.userType,
      this.profileImage,
      this.displayName,
      this.link});

  factory QuestionOwnerResponse.fromJson(Map<String, dynamic> json) =>
      _$QuestionOwnerResponseFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionOwnerResponseToJson(this);
}
