// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_item_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuestionItemResposne _$QuestionItemResposneFromJson(
        Map<String, dynamic> json) =>
    QuestionItemResposne(
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      owner: json['owner'] == null
          ? null
          : QuestionOwnerResponse.fromJson(
              json['owner'] as Map<String, dynamic>),
      isAnswered: json['is_answered'] as bool?,
      viewCount: json['view_count'] as int?,
      acceptedAnswerId: json['accepted_answer_id'] as int?,
      answerCount: json['answer_count'] as int?,
      score: json['score'] as int?,
      lastActivityDate: json['last_activity_date'] as int?,
      creationDate: json['creation_date'] as int?,
      lastEditDate: json['last_edit_date'] as int?,
      questionId: json['question_id'] as int?,
      contentLicense: json['content_license'] as String?,
      link: json['link'] as String?,
      title: json['title'] as String?,
      body: json['body'] as String?,
      bodyMarkdown: json['body_markdown'] as String?,
    );

Map<String, dynamic> _$QuestionItemResposneToJson(
        QuestionItemResposne instance) =>
    <String, dynamic>{
      'tags': instance.tags,
      'owner': instance.owner,
      'is_answered': instance.isAnswered,
      'view_count': instance.viewCount,
      'accepted_answer_id': instance.acceptedAnswerId,
      'answer_count': instance.answerCount,
      'score': instance.score,
      'last_activity_date': instance.lastActivityDate,
      'creation_date': instance.creationDate,
      'last_edit_date': instance.lastEditDate,
      'question_id': instance.questionId,
      'content_license': instance.contentLicense,
      'link': instance.link,
      'title': instance.title,
      'body_markdown': instance.bodyMarkdown,
      'body': instance.body,
    };
