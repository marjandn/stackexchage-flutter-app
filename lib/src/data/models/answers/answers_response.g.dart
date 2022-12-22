// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'answers_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnswersResponse _$AnswersResponseFromJson(Map<String, dynamic> json) =>
    AnswersResponse(
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => AnswerItemResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      hasMore: json['has_more'] as bool?,
      quotaMax: json['quota_max'] as int?,
      quotaRemaining: json['quota_remaining'] as int?,
    );

Map<String, dynamic> _$AnswersResponseToJson(AnswersResponse instance) =>
    <String, dynamic>{
      'items': instance.items,
      'has_more': instance.hasMore,
      'quota_max': instance.quotaMax,
      'quota_remaining': instance.quotaRemaining,
    };
