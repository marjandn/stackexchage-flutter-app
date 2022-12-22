// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'answer_owner_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnswerOwnerResponse _$AnswerOwnerResponseFromJson(Map<String, dynamic> json) =>
    AnswerOwnerResponse(
      accountId: json['account_id'] as int?,
      reputation: json['reputation'] as int?,
      userId: json['user_id'] as int?,
      userType: json['user_type'] as String?,
      acceptRate: json['accept_rate'] as int?,
      profileImage: json['profile_image'] as String?,
      displayName: json['display_name'] as String?,
      link: json['link'] as String?,
    );

Map<String, dynamic> _$AnswerOwnerResponseToJson(
        AnswerOwnerResponse instance) =>
    <String, dynamic>{
      'account_id': instance.accountId,
      'reputation': instance.reputation,
      'user_id': instance.userId,
      'user_type': instance.userType,
      'accept_rate': instance.acceptRate,
      'profile_image': instance.profileImage,
      'display_name': instance.displayName,
      'link': instance.link,
    };
