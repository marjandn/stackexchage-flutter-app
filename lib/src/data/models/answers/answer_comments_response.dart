import 'package:json_annotation/json_annotation.dart';
import 'package:stackexchange_app/src/data/models/answers/answer_owner_response.dart';

part 'answer_comments_response.g.dart';

@JsonSerializable()
class AnswerCommentsResponse {
  final AnswerOwnerResponse? owner;
  final bool? edited;
  final int? score;
  @JsonKey(name: 'creation_date')
  final int? creationDate;
  @JsonKey(name: 'post_id')
  final int? postId;
  @JsonKey(name: 'comment_id')
  final int? commentId;
  @JsonKey(name: 'body_markdown')
  final String? bodyMarkdown;
  final String? body;

  AnswerCommentsResponse(
      {this.owner,
      this.edited,
      this.score,
      this.creationDate,
      this.postId,
      this.commentId,
      this.bodyMarkdown,
      this.body});

  factory AnswerCommentsResponse.fromJson(Map<String, dynamic> json) =>
      _$AnswerCommentsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AnswerCommentsResponseToJson(this);
}
