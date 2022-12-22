// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'answer_item_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnswerItemResponse _$AnswerItemResponseFromJson(Map<String, dynamic> json) =>
    AnswerItemResponse(
      owner: json['owner'] == null
          ? null
          : AnswerOwnerResponse.fromJson(json['owner'] as Map<String, dynamic>),
      isAccepted: json['is_accepted'] as bool?,
      score: json['score'] as int?,
      lastActivityDate: json['last_activity_date'] as int?,
      creationDate: json['creation_date'] as int?,
      answerId: json['answer_id'] as int?,
      questionId: json['question_id'] as int?,
      contentLicense: json['content_license'] as String?,
      bodyMarkdown: json['body_markdown'] as String?,
      body: json['body'] as String?,
      comments: (json['comments'] as List<dynamic>?)
          ?.map(
              (e) => AnswerCommentsResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      lastEditDate: json['last_edit_date'] as int?,
    );

Map<String, dynamic> _$AnswerItemResponseToJson(AnswerItemResponse instance) =>
    <String, dynamic>{
      'owner': instance.owner,
      'is_accepted': instance.isAccepted,
      'score': instance.score,
      'last_activity_date': instance.lastActivityDate,
      'creation_date': instance.creationDate,
      'answer_id': instance.answerId,
      'question_id': instance.questionId,
      'content_license': instance.contentLicense,
      'body_markdown': instance.bodyMarkdown,
      'body': instance.body,
      'comments': instance.comments,
      'last_edit_date': instance.lastEditDate,
    };
