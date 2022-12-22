// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'answer_comments_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnswerCommentsResponse _$AnswerCommentsResponseFromJson(
        Map<String, dynamic> json) =>
    AnswerCommentsResponse(
      owner: json['owner'] == null
          ? null
          : AnswerOwnerResponse.fromJson(json['owner'] as Map<String, dynamic>),
      edited: json['edited'] as bool?,
      score: json['score'] as int?,
      creationDate: json['creation_date'] as int?,
      postId: json['post_id'] as int?,
      commentId: json['comment_id'] as int?,
      bodyMarkdown: json['body_markdown'] as String?,
      body: json['body'] as String?,
    );

Map<String, dynamic> _$AnswerCommentsResponseToJson(
        AnswerCommentsResponse instance) =>
    <String, dynamic>{
      'owner': instance.owner,
      'edited': instance.edited,
      'score': instance.score,
      'creation_date': instance.creationDate,
      'post_id': instance.postId,
      'comment_id': instance.commentId,
      'body_markdown': instance.bodyMarkdown,
      'body': instance.body,
    };
