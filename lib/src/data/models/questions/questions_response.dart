import 'package:json_annotation/json_annotation.dart';
import 'package:stackexchange_app/src/domain/entities/owner.dart';
import 'package:stackexchange_app/src/domain/entities/question.dart';

import 'question_item_response.dart';

part 'questions_response.g.dart';

@JsonSerializable()
class QuestionsResponse {
  List<QuestionItemResposne>? items;
  @JsonKey(name: 'has_more')
  bool? hasMore;
  @JsonKey(name: 'quota_max')
  int? quotaMax;
  @JsonKey(name: 'quota_remaining')
  int? quotaRemaining;

  QuestionsResponse({this.items, this.hasMore, this.quotaMax, this.quotaRemaining});

  Question toEntity() => Question(
        hasMore: hasMore ?? false,
        questionItems: items
                ?.map((e) => QuestionItem(
                      tags: e.tags ?? [],
                      owner: Owner(
                          displayName: e.owner?.displayName ?? "",
                          profileImage: e.owner?.profileImage ?? "",
                          reputation: e.owner?.reputation ?? 0),
                      isAnswered: e.isAnswered ?? false,
                      viewCount: e.viewCount ?? 0,
                      answerCount: e.answerCount ?? 0,
                      score: e.score ?? 0,
                      creationDate: e.creationDate ?? 0,
                      lastEditDate: e.lastEditDate ?? 0,
                      questionId: e.questionId ?? 0,
                      link: e.link ?? "",
                      title: e.title ?? "",
                      body: e.body ?? "",
                      bodyMarkdown: e.bodyMarkdown ?? "",
                    ))
                .toList() ??
            [],
      );

  factory QuestionsResponse.fromJson(Map<String, dynamic> json) =>
      _$QuestionsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionsResponseToJson(this);
}
