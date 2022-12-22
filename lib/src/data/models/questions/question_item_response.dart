import 'package:json_annotation/json_annotation.dart';
import 'package:stackexchange_app/src/data/models/questions/question_owner_respopnse.dart';

part 'question_item_response.g.dart';

@JsonSerializable()
class QuestionItemResposne {
  final List<String>? tags;
  final QuestionOwnerResponse? owner;
  @JsonKey(name: 'is_answered')
  final bool? isAnswered;
  @JsonKey(name: 'view_count')
  final int? viewCount;
  @JsonKey(name: 'accepted_answer_id')
  final int? acceptedAnswerId;
  @JsonKey(name: 'answer_count')
  final int? answerCount;
  final int? score;
  @JsonKey(name: 'last_activity_date')
  final int? lastActivityDate;
  @JsonKey(name: 'creation_date')
  final int? creationDate;
  @JsonKey(name: 'last_edit_date')
  final int? lastEditDate;
  @JsonKey(name: 'question_id')
  final int? questionId;
  @JsonKey(name: 'content_license')
  final String? contentLicense;
  final String? link;
  final String? title;
  @JsonKey(name: 'body_markdown')
  final String? bodyMarkdown;
  final String? body;

  QuestionItemResposne({
    this.tags,
    this.owner,
    this.isAnswered,
    this.viewCount,
    this.acceptedAnswerId,
    this.answerCount,
    this.score,
    this.lastActivityDate,
    this.creationDate,
    this.lastEditDate,
    this.questionId,
    this.contentLicense,
    this.link,
    this.title,
    this.body,
    this.bodyMarkdown,
  });

  factory QuestionItemResposne.fromJson(Map<String, dynamic> json) =>
      _$QuestionItemResposneFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionItemResposneToJson(this);
}
