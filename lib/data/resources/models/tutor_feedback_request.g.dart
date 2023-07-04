// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tutor_feedback_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetFeedbackRequest _$GetFeedbackRequestFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['description'],
  );
  return GetFeedbackRequest(
    json['description'] as String?,
  );
}

Map<String, dynamic> _$GetFeedbackRequestToJson(GetFeedbackRequest instance) =>
    <String, dynamic>{
      'description': instance.description,
    };
