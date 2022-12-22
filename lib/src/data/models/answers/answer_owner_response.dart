import 'package:json_annotation/json_annotation.dart';

part 'answer_owner_response.g.dart';

@JsonSerializable()
class AnswerOwnerResponse {
  @JsonKey(name: 'account_id')
  int? accountId;
  int? reputation;
  @JsonKey(name: 'user_id')
  int? userId;
  @JsonKey(name: 'user_type')
  String? userType;
  @JsonKey(name: 'accept_rate')
  int? acceptRate;
  @JsonKey(name: 'profile_image')
  String? profileImage;
  @JsonKey(name: 'display_name')
  String? displayName;
  String? link;

  AnswerOwnerResponse(
      {this.accountId,
      this.reputation,
      this.userId,
      this.userType,
      this.acceptRate,
      this.profileImage,
      this.displayName,
      this.link});

  factory AnswerOwnerResponse.fromJson(Map<String, dynamic> json) =>
      _$AnswerOwnerResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AnswerOwnerResponseToJson(this);
}
