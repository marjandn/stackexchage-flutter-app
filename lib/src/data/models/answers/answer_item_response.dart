import 'package:json_annotation/json_annotation.dart';

import 'answer_comments_response.dart';
import 'answer_owner_response.dart';

part 'answer_item_response.g.dart';

@JsonSerializable()
class AnswerItemResponse {
  final AnswerOwnerResponse? owner;
  @JsonKey(name: 'is_accepted')
  final bool? isAccepted;
  final int? score;
  @JsonKey(name: 'last_activity_date')
  final int? lastActivityDate;
  @JsonKey(name: 'creation_date')
  final int? creationDate;
  @JsonKey(name: 'answer_id')
  final int? answerId;
  @JsonKey(name: 'question_id')
  final int? questionId;
  @JsonKey(name: 'content_license')
  final String? contentLicense;
  @JsonKey(name: 'body_markdown')
  final String? bodyMarkdown;
  final String? body;
  final List<AnswerCommentsResponse>? comments;
  @JsonKey(name: 'last_edit_date')
  final int? lastEditDate;

  AnswerItemResponse(
      {this.owner,
      this.isAccepted,
      this.score,
      this.lastActivityDate,
      this.creationDate,
      this.answerId,
      this.questionId,
      this.contentLicense,
      this.bodyMarkdown,
      this.body,
      this.comments,
      this.lastEditDate});

  factory AnswerItemResponse.fromJson(Map<String, dynamic> json) =>
      _$AnswerItemResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AnswerItemResponseToJson(this);
}
