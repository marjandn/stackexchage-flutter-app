import 'package:json_annotation/json_annotation.dart';
import 'package:stackexchange_app/src/data/models/answers/answer_item_response.dart';
import 'package:stackexchange_app/src/domain/entities/comment.dart';
import 'package:stackexchange_app/src/domain/entities/owner.dart';

import '../../../domain/entities/answer.dart';

part 'answers_response.g.dart';

@JsonSerializable()
class AnswersResponse {
  final List<AnswerItemResponse>? items;
  @JsonKey(name: 'has_more')
  final bool? hasMore;
  @JsonKey(name: 'quota_max')
  final int? quotaMax;
  @JsonKey(name: 'quota_remaining')
  final int? quotaRemaining;

  AnswersResponse({this.items, this.hasMore, this.quotaMax, this.quotaRemaining});

  Answer toEntity() => Answer(
      hasMore: hasMore ?? false,
      answerItems: items
              ?.map((e) => AnswerItem(
                  owner: Owner(
                      displayName: e.owner?.displayName ?? "",
                      profileImage: e.owner?.profileImage ?? "",
                      reputation: e.owner?.reputation ?? 0),
                  isAccepted: e.isAccepted ?? false,
                  score: e.score ?? 0,
                  lastActivityDate: e.lastActivityDate ?? 0,
                  creationDate: e.creationDate ?? 0,
                  bodyMarkdown: e.bodyMarkdown ?? "",
                  body: e.body ?? "",
                  comments: e.comments
                          ?.map((c) => Comment(
                              owner: Owner(
                                  reputation: c.owner?.reputation ?? 0,
                                  profileImage: e.owner?.profileImage ?? "",
                                  displayName: e.owner?.displayName ?? ""),
                              edited: c.edited ?? false,
                              score: e.score ?? 0,
                              creationDate: e.creationDate ?? 0,
                              bodyMarkdown: e.bodyMarkdown ?? "",
                              body: e.body ?? ""))
                          .toList() ??
                      [],
                  lastEditDate: e.lastEditDate ?? 0))
              .toList() ??
          []);

  factory AnswersResponse.fromJson(Map<String, dynamic> json) => _$AnswersResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AnswersResponseToJson(this);
}
